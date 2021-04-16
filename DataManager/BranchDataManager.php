<?php

include('../DataModel/BranchData.php');
require_once("DBController.php");

    
class BranchDataManager {
    
    public static function createBranch($BranchName, $BranchLocation) {
        $query = "INSERT INTO BRANCH";
        $attributes = "(";
        $values = " VALUES (";
    
        $attributes .= "LNAME";
        $values .= "'".$BranchName."'";

        $attributes .= ", LOCATION";
        $values .= ", '".$BranchLocation."'";

        $attributes .= ")";
        $values .= ")";
        
        $query .= $attributes;
        $query .= $values;

        $res = DBController::getInstance()->runQuery($query);
        return $res;
    }
    
    public static function getAllBranches() {
        $branches = array();
        $res = DBController::getInstance()->runSelectQuery("SELECT * FROM BRANCH");
        foreach ($res as $data) {
            array_push($branches, new BranchData($data));
        }
        return $branches;
    }

    public static function getBranchInfo($BID) {
        $res = DBController::getInstance()->runSelectQuery("SELECT * FROM BRANCH WHERE BID= ".$BID."");
        if (count($res) > 0)
            return new BranchData($res[0]);
        else
            return null;
    }

    public static function getBranchName($BID) {
        $res = DBController::getInstance()->runSelectQuery("SELECT LNAME FROM BRANCH WHERE BID= ".$BID."");
        if (count($res) > 0)
            return $res[0]["LNAME"];
        else
            return null;
    }

    public static function getBranchLocation($BID) {
        $res = DBController::getInstance()->runSelectQuery("SELECT LOCATION FROM BRANCH WHERE BID= ".$BID."");
        if (count($res) > 0)
            return $res[0]["LOCATION"];
        else
            return null;
    }

    public static function deleteBranch($BID) {
        $res = DBController::getInstance()->runQuery("DELETE FROM BRANCH WHERE BID= ".$BID."");
        return $res;
    }
    
    public static function deleteAllBranches() {
        $res = DBController::getInstance()->runQuery("DELETE FROM BRANCH");
        return $res;
    }
}
?>

</div>
</BODY>
</HTML>
