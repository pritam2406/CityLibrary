<?php

require_once("DBController.php");

class DocumentBorrowManager
{
    
    public static function borrowMultiDocs($docCopies, $RID)
    {
        $query = "INSERT INTO BORROWING";
        $attributes = "(";
        $values = " VALUES (";
        
        //$attributes .= "BOR_NO";
        //$values .= "".$resID."";
        
        $attributes .= "BDTIME";
        $values .= ", NOW()";
        
        $attributes .= ")";
        $values .= ")";
        
        $query .= $attributes;
        $query .= $values;

        $resID = DBController::getInstance()->runQuery($query);
        
        
        foreach($docCopies as $docCopy)
        {
            borrowDoc($resID, $docCopy->getDocID(), $docCopy->getDocCopyNo(), $docCopy->getDocBID(), $RID);
        }
    }
    
    public static function borrowDoc($BOR_NO, $DocID, $CopyNo, $BID, $RID)
    {
        //insert to Borrows
        //insert to Borrowing
        
        $query = "INSERT INTO BORROWS";
        $attributes = "(";
        $values = " VALUES (";
        
        $attributes .= "BOR_NO";
        $values .= "".$BOR_NO."";
        
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
    
    public static function getBorrowList($RID)
    {
        //return array of borrowed docs sorted orders
    }
    
    public static function returnDocs($BOR_NO)
    {
        $query = "UPDATE BORROWING";
        $query .= " SET RDTIME=NOW()";
        $query .= " WHERE BOR_NO=".$BOR_NO;
        
        $resID = DBController::getInstance()->runQuery($query);

        return $resID;
    }
    
    public static function calculateFine($RID)
    {
        $delayLimit = 5;
        $fineForEachDay = 20; //20 cents
        
        $query = "SELECT SUM((DATEDIFF(NOW(), BDTIME) - ".$delayLimit.") * ".$fineForEachDay.") AS FINE";
        $query .= " FROM BORROWS NATURAL JOIN BORROWING";
        $query .= " WHERE RID = ".$RID." AND RDTIME IS NULL AND DATEDIFF(NOW(), BDTIME) > ".$delayLimit;
        
        $res = DBController::getInstance()->runSelectQuery($query);
        if (count($res) > 0)
            return $res[0]["FINE"];
        else
            return 0;
    }
    
    public static function updateReturnTime($BOR_NO) {
        $query = "UPDATE BORROWING";
        $query .= " SET RDTIME = NOW()";
        $query .= " WHERE BOR_NO = ".$BOR_NO;
        $res = DBController::getInstance()->runQuery($query);
        return $res;
    }
}
