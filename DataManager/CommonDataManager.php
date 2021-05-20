<?php

require_once("DBController.php");
    
class CommonDataManager
{
    public static function getDocStatus($DocID, $CopyNo, $BID)
    {
        $query = "SELECT C.DOCID, C.COPYNO, C.BID, C.POSITION, (SELECT RID FROM RESERVES WHERE DOCID = C.DOCID AND COPYNO = C.COPYNO AND BID = C.BID) AS RESERVED_RID, (SELECT RID FROM (BORROWS NATURAL JOIN BORROWING) WHERE DOCID = C.DOCID AND COPYNO = C.COPYNO AND BID = C.BID AND RDTIME IS NULL) AS BORROWED_RID";
        $query .= " FROM COPY C";
        $query .= " WHERE C.DOCID = ".$DocID." AND C.COPYNO = ".$CopyNo." AND C.BID = ".$BID;
        
        $res = DBController::getInstance()->runSelectQuery($query);
        
        if (count($res) > 0) {
            $dict = [
                'DOCID' => $res[0]["C.DOCID"],
                'COPYNO' => $res[0]["C.COPYNO"],
                'BID' => $res[0]["C.BID"],
                'POSITION' => $res[0]["C.POSITION"],
                'RESERVED_RID' => $res[0]["RESERVED_RID"],
                'BORROWED_RID' => $res[0]["BORROWED_RID"]
            ];
            return $dict;
        }
        else
            return NULL;
    }
    
    public static function mostFrequentBorrowers($topN)
    {
        $query = "SELECT RID, RNAME, COUNT(*) AS NUM_DOCS";
        $query .= " FROM BORROWS NATURAL JOIN READER";
        $query .= " GROUP BY RID, RNAME";
        $query .= " ORDER BY NUM_DOCS DESC";
        $query .= " LIMIT ".$topN;
        
        $res = DBController::getInstance()->runSelectQuery($query);
        $mostFrequentBorrowers = array();
        foreach ($res as $data) {
            $dict = [
                'RID' => $data["RID"],
                'RNAME' => $data["RNAME"],
                'NUM_DOCS' => $data["NUM_DOCS"]
            ];
            array_push($mostFrequentBorrowers, $dict);
        }
        
        return $mostFrequentBorrowers;
    }
    
    public static function mostFrequentBorrowersByBranch($BID, $topN)
    {
        $query = "SELECT RID, RNAME, COUNT(*) AS NUM_DOCS";
        $query .= " FROM BORROWS NATURAL JOIN READER";
        if($BID != null)
        {
            $query .= " WHERE BID = ".$BID;
        }
        $query .= " GROUP BY RID, RNAME";
        $query .= " ORDER BY NUM_DOCS DESC";
        $query .= " LIMIT ".$topN;
        
        $res = DBController::getInstance()->runSelectQuery($query);
        $mostFrequentBorrowers = array();
        foreach ($res as $data) {
            $dict = [
                'RID' => $data["RID"],
                'RNAME' => $data["RNAME"],
                'NUM_DOCS' => $data["NUM_DOCS"]
            ];
            array_push($mostFrequentBorrowers, $dict);
        }
        
        return $mostFrequentBorrowers;
    }
    
    public static function mostBorrowedDocs($topN)
    {
        $query = "SELECT DOCID, TITLE, PDATE, PUBNAME, COUNT(*) AS NUM_DOCS";
        $query .= " FROM ((BORROWS NATURAL JOIN DOCUMENT) NATURAL JOIN PUBLISHER)";
        $query .= " GROUP BY DOCID";
        $query .= " ORDER BY NUM_DOCS DESC";
        $query .= " LIMIT ".$topN;
        
        $res = DBController::getInstance()->runSelectQuery($query);
        $mostBorrowedDocs = array();
        foreach ($res as $data) {
            $dict = [
                'DOCID' => $data["DOCID"],
                'TITLE' => $data["TITLE"],
                'PDATE' => $data["PDATE"],
                'PUBNAME' => $data["PUBNAME"],
                'NUM_DOCS' => $data["NUM_DOCS"]
            ];
            array_push($mostBorrowedDocs, $dict);
        }
        
        return $mostBorrowedDocs;
    }
    
    public static function mostBorrowedDocsByBranch($BID, $topN)
    {
        $query = "SELECT DOCID, TITLE, PDATE, PUBNAME, COUNT(*) AS NUM_DOCS";
        $query .= " FROM ((BORROWS NATURAL JOIN DOCUMENT) NATURAL JOIN PUBLISHER)";
        if($BID != null)
        {
            $query .= " WHERE BID = ".$BID;
        }
        $query .= " GROUP BY DOCID";
        $query .= " ORDER BY NUM_DOCS DESC";
        $query .= " LIMIT ".$topN;
        
        $res = DBController::getInstance()->runSelectQuery($query);
        $mostBorrowedDocs = array();
        foreach ($res as $data) {
            $dict = [
                'DOCID' => $data["DOCID"],
                'TITLE' => $data["TITLE"],
                'PDATE' => $data["PDATE"],
                'PUBNAME' => $data["PUBNAME"],
                'NUM_DOCS' => $data["NUM_DOCS"]
            ];
            array_push($mostBorrowedDocs, $dict);
        }
        
        return $mostBorrowedDocs;
    }
    
    public static function mostPopular10DocsInYear($year)
    {
        $query = "SELECT DOCID, TITLE, PDATE, PUBNAME, COUNT(*) AS NUM_DOCS";
        $query .= " FROM ((BORROWS NATURAL JOIN BORROWING) NATURAL JOIN DOCUMENT) NATURAL JOIN PUBLISHER";
        $query .= " WHERE YEAR(BDTIME) = ".$year;
        $query .= " GROUP BY DOCID";
        $query .= " ORDER BY NUM_DOCS DESC";
        $query .= " LIMIT 10";
        
        $res = DBController::getInstance()->runSelectQuery($query);
        
        $popular10Docs = array();
        foreach ($res as $data) {
            $dict = [
                'DOCID' => $data["DOCID"],
                'TITLE' => $data["TITLE"],
                'PDATE' => $data["PDATE"],
                'PUBNAME' => $data["PUBNAME"],
                'NUM_DOCS' => $data["NUM_DOCS"]
            ];
            array_push($popular10Docs, $dict);
        }
        
        return $popular10Docs;
    }
    
    public static function calculateAvgFine($startDate, $endDate)
    {
        $delayLimit = 20;
        $fineForEachDay = 20; //20 cents
        
        $query = "SELECT BID, LNAME, SUM((DATEDIFF(RDTIME, BDTIME) - ".$delayLimit.") * ".$fineForEachDay.") / COUNT(DISTINCT(RID)) AS AVG_FINE";
        $query .= " FROM (BORROWS NATURAL JOIN BORROWING) NATURAL JOIN BRANCH";
        $query .= " WHERE RDTIME IS NOT NULL AND (YEAR(BDTIME) BETWEEN '".$startDate."' AND '".$endDate."') AND DATEDIFF(RDTIME, BDTIME) > ".$delayLimit;
        $query .= " GROUP BY BID, LNAME";
        
        $res = DBController::getInstance()->runSelectQuery($query);
        
        $avgFineList = array();
        foreach ($res as $data) {
            $dict = [
                'BID' => $data["BID"],
                'LNAME' => $data["LNAME"],
                'AVG_FINE' => $data["AVG_FINE"]
            ];
            array_push($avgFineList, $dict);
        }
        
        return $avgFineList;
    }

}
