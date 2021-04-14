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

        for($docCopies as $docCopy)
        {
            reserveDoc($resID, $docCopy->getDocID(), $docCopy->getDocCopyNo(), $docCopy->getDocBID(), $RID);
        }
    }
    
    public static function reserveDoc($RESERVATION_NO, $DocID, $CopyNo, $BID, $RID)
    {
        //insert to Reserves
        //insert to Reservations
            
        $query = "INSERT INTO RESERVES";
        $attributes = "(";
        $values = " VALUES (";
        
        $attributes .= "RESERVATION_NO";
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
    
    public static function getReservedList($RID)
    {
        //return array of reserved docs sorted order
    }
    
    public static function clearReservations($DocCopies)
    {
        //remove from Reserves
    }
    
    public static function updateReturnTime($BOR_NO) {
        //
    }
}
