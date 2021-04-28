<?php

require_once("DBController.php");

class DocumentCopyDataManager
{
    public static function insertMultipleDocCopies($DocID, $BID, $numCopies, $position)
    {
        $currentCopiesCount = DocumentCopyDataManager::getNumberOfCopiesInBranch($DocID, $BID);
        
        for($num = 1; $num <= (int)$numCopies; $num++)
        {
            DocumentCopyDataManager::insertDocCopy($DocID, (int)$currentCopiesCount + (int)$num, $BID, $position);
        }
    }

    public static function insertDocCopy($DocID, $CopyNo, $BID, $Position)
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
    
    public static function getDocCopiesByBranch($DocID, $BID)
    {
        $query = "SELECT COPYNO";
        $query .= " FROM COPY";
        $query .= " WHERE DOCID = ".$DocID." AND BID = ".$BID;
        
        $res = DBController::getInstance()->runSelectQuery($query);
        
        $docCopies = array();
        foreach ($res as $data)
        {
            array_push($availableDocs, $data['COPYNO']);
        }
            
        return $docCopies;
    }
    
    public static function getNumberOfCopiesInBranch($DocID, $BID)
    {
        $query = "SELECT COUNT(COPYNO) AS NUM_COPIES";
        $query .= " FROM COPY";
        $query .= " WHERE DOCID = ".$DocID." AND BID = ".$BID;
        
        $res = DBController::getInstance()->runSelectQuery($query);
        
        if(count($res) > 0)
        {
            return $res[0]['NUM_COPIES'];
        }
        else
        {
            return 0;
        }
        
    }
    
    public static function availableDocsForReader($DocID, $Title, $PublisherName)
    {
        $query =
        "SELECT *";
        $query .=" FROM (((DOCUMENT NATURAL JOIN PUBLISHER) NATURAL JOIN COPY) NATURAL JOIN BRANCH)";
        $query .=" WHERE (DOCID, COPYNO, BID) NOT IN";
        $query .=" (SELECT DOCID, COPYNO, BID FROM BORROWS NATURAL JOIN BORROWING WHERE RDTIME IS NULL UNION SELECT DOCID, COPYNO, BID FROM RESERVES)";
        
        if($DocID != null)
        {
            $query .= " AND DOCID = ".$DocID;
        }
        
        if($Title != null)
        {
            $query .= " AND TITLE LIKE '%".$Title."%'";
        }
        
        if($PublisherName != null)
        {
            $query .= " AND PUBNAME LIKE '%".$PublisherName."%'";
        }
        
        $res = DBController::getInstance()->runSelectQuery($query);
        
        $availableDocs = array();
        foreach ($res as $data)
        {
            $dict = [
                'BID' => $data["BID"],
                'DOCID' => $data["DOCID"],
                'PUBLISHERID' => $data["PUBLISHERID"],
                'TITLE' => $data["TITLE"],
                'PDATE' => $data["PDATE"],
                'PUBNAME' => $data["PUBNAME"],
                'ADDRESS' => $data["ADDRESS"],
                'COPYNO' => $data["COPYNO"],
                'POSITION' => $data["POSITION"],
                'LNAME' => $data["LNAME"],
                'LOCATION' => $data["LOCATION"]
            ];
            array_push($availableDocs, $dict);
        }
            
        return $availableDocs;
    }
    
    /*
    public static function availableDocsForReader()
    {
        $query =
        "SELECT *";
        $query .=" FROM (((DOCUMENT NATURAL JOIN PUBLISHER) NATURAL JOIN COPY) NATURAL JOIN BRANCH)";
        $query .=" WHERE (DOCID, COPYNO, BID) NOT IN";
        $query .=" (SELECT DOCID, COPYNO, BID FROM BORROWS NATURAL JOIN BORROWING WHERE RDTIME IS NULL UNION SELECT DOCID, COPYNO, BID FROM RESERVES)";
        
        $res = DBController::getInstance()->runSelectQuery($query);
        
        $availableDocs = array();
        foreach ($res as $data)
        {
            $dict = [
                'BID' => $data["BID"],
                'DOCID' => $data["DOCID"],
                'PUBLISHERID' => $data["PUBLISHERID"],
                'TITLE' => $data["TITLE"],
                'PDATE' => $data["PDATE"],
                'PUBNAME' => $data["PUBNAME"],
                'ADDRESS' => $data["ADDRESS"],
                'COPYNO' => $data["COPYNO"],
                'POSITION' => $data["POSITION"],
                'LNAME' => $data["LNAME"],
                'LOCATION' => $data["LOCATION"]
            ];
            array_push($availableDocs, $dict);
        }
            
        return $availableDocs;
    }
     */
}
