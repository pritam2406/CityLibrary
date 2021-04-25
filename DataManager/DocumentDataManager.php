<?php


class DocumentDataManager
{
    public static function insertBook($title, $pDate, $publisherID, $ISBN, $authorPIDs) {

        $docID = DocumentDataManager::insertDocument($title, $pDate, $publisherID);
        
        $query = "INSERT INTO BOOK";
        $attributes = "(";
        $values = " VALUES (";
        
        $attributes .= "DOCID";
        $values .= "".$docID."";

        $attributes .= ", ISBN";
        $values .= ", '".$ISBN."'";
        
        $attributes .= ")";
        $values .= ")";
        
        $query .= $attributes;
        $query .= $values;

        $res = DBController::getInstance()->runQuery($query);
        
        DocumentDataManager::insertAuthors($authorPIDs, $docID);
        
        return $docID;
    }
    
    public static function insertAuthors($PIDs, $docID)
    {
        $query = "INSERT INTO AUTHORS";
        $attributes = "(PID, DOCID)";
        
        $values = " VALUES ";
        
        $cnt = 0;
        foreach($PIDs as $PID)
        {
            if($cnt > 0)
            {
                $values .= ", ";
            }
            $values .= "(".$PID.", ".$docID.")";
            $cnt = $cnt + 1;
        }
        
        $query .= $attributes;
        $query .= $values;

        $res = DBController::getInstance()->runQuery($query);
    }
    
    public static function insertJournalVolume($title, $pDate, $publisherID, $volumeNo, $editorID) {
        
        $docID = DocumentDataManager::insertDocument($title, $pDate, $publisherID);
        $query = "INSERT INTO JOURNAL_VOLUME";
        $attributes = "(";
        $values = " VALUES (";
        
        $attributes .= "DOCID";
        $values .= "".$docID."";

        $attributes .= ", VOLUME_NO";
        $values .= ", ".$volumeNo."";
        
        $attributes .= ", EDITOR";
        $values .= ", ".$editorID."";
        
        $attributes .= ")";
        $values .= ")";
        
        $query .= $attributes;
        $query .= $values;

        $res = DBController::getInstance()->runQuery($query);
        
        return $docID;
    }
    
    public static function insertJournalIssue($docID, $issueNo, $scope, $guestEditorPIDs)
    {
        $query = "INSERT INTO JOURNAL_ISSUE";
        $attributes = "(";
        $values = " VALUES (";
        
        $attributes .= "DOCID";
        $values .= "".$docID."";

        $attributes .= ", ISSUE_NO";
        $values .= ", ".$issueNo."";
        
        $attributes .= ", SCOPE";
        $values .= ", '".$editorID."'";
        
        $attributes .= ")";
        $values .= ")";
        
        $query .= $attributes;
        $query .= $values;

        $res = DBController::getInstance()->runQuery($query);
        
        DocumentDataManager::insertGuestEditors($docID, $issueNo, $guestEditorPIDs);
        
    }
    
    public static function insertGuestEditors($docID, $issueNo, $PIDs)
    {
        $query = "INSERT INTO GEDITS";
        $attributes = "(DOCID, ISSUE_NO, PID)";
        
        $values = " VALUES ";
        
        $cnt = 0;
        foreach($PIDs as $PID)
        {
            if($cnt > 0)
            {
                $values .= ", ";
            }
            $values .= "(".$docID.", ".$issueNo.", ".$PID.")";
            $cnt = $cnt + 1;
        }
        
        $query .= $attributes;
        $query .= $values;

        $res = DBController::getInstance()->runQuery($query);
    }
    
    public static function insertProceedings($title, $pDate, $publisherID, $cDate, $cLocation, $cEditorID, $chairIDs) {
        
        $docID = DocumentDataManager::insertDocument($title, $pDate, $publisherID);
        $query = "INSERT INTO PROCEEDINGS";
        $attributes = "(";
        $values = " VALUES (";
        
        $attributes .= "DOCID";
        $values .= "".$docID."";

        $attributes .= ", CDATE";
        $values .= ", '".$cDate."'";
        
        $attributes .= ", CLOCATION";
        $values .= ", '".$cLocation."'";
        
        $attributes .= ", CEDITOR";
        $values .= ", ".$cEditorID."";
        
        $attributes .= ")";
        $values .= ")";
        
        $query .= $attributes;
        $query .= $values;

        $res = DBController::getInstance()->runQuery($query);
        
        DocumentDataManager::insertChairs($chairIDs, $docID);
        
        return $docID;
    }
    
    public static function insertChairs($PIDs, $docID)
    {
        $query = "INSERT INTO CHAIRS";
        $attributes = "(PID, DOCID)";
        
        $values = " VALUES ";
        
        $cnt = 0;
        foreach($PIDs as $PID)
        {
            if($cnt > 0)
            {
                $values .= ", ";
            }
            $values .= "(".$PID.", ".$docID.")";
            $cnt = $cnt + 1;
        }
        
        $query .= $attributes;
        $query .= $values;

        $res = DBController::getInstance()->runQuery($query);
    }
    
    public static function insertDocument($title, $pDate, $publisherID) {
        $query = "INSERT INTO DOCUMENT";
        $attributes = "(";
        $values = " VALUES (";
        
        $attributes .= "TITLE";
        $values .= "'".$title."'";

        $attributes .= ", PDATE";
        $values .= ", '".$pDate."'";
        
        $attributes .= ", PUBLISHERID";
        $values .= ", ".$publisherID."";
        
        $attributes .= ")";
        $values .= ")";
        
        $query .= $attributes;
        $query .= $values;

        $res = DBController::getInstance()->runQuery($query);
        return $res;
    }
    
    public static function getAllDocIDs()
    {
        $docIDs = array();
        $res = DBController::getInstance()->runSelectQuery("SELECT DOCID FROM DOCUMENT");
        foreach ($res as $data) {
            array_push($docIDs, $data["DOCID"]);
        }
        return $docIDs;
    }
    
    public static function getAllBooks() {
        
    }
    
    public static function getAllJournalVolumes() {
        
    }
    
    public static function getAllProceedings() {
        
    }
    
    public static function getAllDocuments() {
        
    }
    
    
}
