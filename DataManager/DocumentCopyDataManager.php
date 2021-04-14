<?php

require_once("DBController.php");

class DocumentCopyDataManager
{
    public static insertDocCopy($DocID, $CopyNo, $BID, $Position)
    {
        $query = "INSERT INTO COPY";
        $attributes = "(";
        $values = " VALUES (";
        
        $attributes .= "DOCID";
        $values .= "".$DocID."";
        
        $attributes .= ", COPYNO";
        $values .= ", ".$CopyNo."";
        
        $attributes .= ", BID";
        $values .= ", ".$BID."";
        
        if($Position != null) {
            $attributes .= ", POSITION";
            $values .= ", '".$Position."'";
        }
        
        $attributes .= ")";
        $values .= ")";
        
        $query .= $attributes;
        $query .= $values;

        $res = DBController::getInstance()->runQuery($query);
        return $res;
    }
    
    public static getDocCopiesByBranch($DocID, $BID)
    {
        //array of copy numbers
    }
    
    public static availableDocsForReader($RID)
    {
        //$DOCID, $CopyNO, $BID, $Position, $isBorrowed
    }
}
