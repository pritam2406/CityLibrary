<?php


class DocumentReserveManager
{
    public static function reserveMultiDocs($docCopies, $RID)
    {
        $query = "INSERT INTO RESERVATION";
        $attributes = "(";
        $values = " VALUES (";
        
        //$attributes .= "RES_NO";
        //$values .= "".$resID."";
        
        $attributes .= "DTIME";
        $values .= "NOW()";
        
        $attributes .= ")";
        $values .= ")";
        
        $query .= $attributes;
        $query .= $values;

        $resID = DBController::getInstance()->runQuery($query);

        foreach($docCopies as $docCopy)
        {
            DocumentReserveManager::reserveDoc($resID, $docCopy->getDocID(), $docCopy->getDocCopyNo(), $docCopy->getDocBID(), $RID);
        }
    }
    
    public static function reserveDoc($RESERVATION_NO, $DocID, $CopyNo, $BID, $RID)
    {
        //insert to Reserves
        //insert to Reservations
            
        $query = "INSERT INTO RESERVES";
        $attributes = "(";
        $values = " VALUES (";
        
        $attributes .= "RES_NO";
        $values .= "".$RESERVATION_NO."";
        
        $attributes .= ", DOCID";
        $values .= ", ".$DocID."";
        
        $attributes .= ", COPYNO";
        $values .= ", ".$CopyNo."";
        
        $attributes .= ", BID";
        $values .= ", ".$BID."";
        
        $attributes .= ", RID";
        $values .= ", ".$RID."";
        
        $attributes .= ")";
        $values .= ")";
        
        $query .= $attributes;
        $query .= $values;

        $resID = DBController::getInstance()->runQuery($query);
        
                
        return $resID;
    }
    
    public static function getReservationList($RID)
    {
        //return array of reserved docs sorted order
        $query = "SELECT DISTINCT RES_NO, DTIME";
        $query .= " FROM RESERVATION NATURAL JOIN RESERVES";
        $query .= " WHERE RID=".$RID;
        $query .= " ORDER BY DTIME DESC";
        
        $res = DBController::getInstance()->runSelectQuery($query);
        $reservationList = array();
        foreach ($res as $data) {
            $dict = [
                'RES_NO' => $data["RES_NO"],
                'DTIME' => $data["DTIME"]
            ];
            array_push($reservationList, $dict);
        }
        
        return $reservationList;
    }
    
    public static function getReservedDocList($RES_NO)
    {
        $query = "SELECT TITLE, DOCID, COPYNO, BID, PUBNAME, LNAME";
        $query .= " FROM (((RESERVES NATURAL JOIN DOCUMENT) NATURAL JOIN PUBLISHER) NATURAL JOIN BRANCH)";
        $query .= " WHERE RES_NO=".$RES_NO;
        $res = DBController::getInstance()->runSelectQuery($query);
        $reservedDocList = array();
        foreach ($res as $data) {
            $dict = [
                'TITLE' => $data["TITLE"],
                'COPYNO' => $data["COPYNO"],
                'PUBNAME' => $data["PUBNAME"],
                'LNAME' => $data["LNAME"],
                'DOCID' => $data["DOCID"],
                'BID' => $data["BID"]
            ];
            array_push($reservedDocList, $dict);
        }
        
        return $reservedDocList;
    }
    
    public static function clearReservation($RES_NO)
    {
        $res = DBController::getInstance()->runQuery("DELETE FROM RESERVATION WHERE RES_NO= ".$RES_NO);
        return $res;
    }
    
    public static function clearExpiredReservations()
    {
        $currentHour = (date("H") + 20) % 24 ; # 20 for USA (GMT - 4)
        
        if ($currentHour >= 18) {
            $dateBefore6PM = "DATE_ADD(CURDATE(), INTERVAL 18 HOUR)";
            $query = "DELETE FROM RESERVATION WHERE DTIME <=";
            $query .= $dateBefore6PM;
            $res = DBController::getInstance()->runQuery($query);
        }
        else {
            $res = DBController::getInstance()->runQuery("DELETE FROM RESERVATION WHERE DTIME < DATE(CURDATE())");
        }
    }
    

}
