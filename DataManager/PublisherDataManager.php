<?php

include('../DataModel/PublisherData.php');
require_once("DBController.php");
    
class PublisherDataManager
{
    public static function createPublisher($PublisherName, $PublisherAddress) {
        $query = "INSERT INTO PUBLISHER";
        $attributes = "(";
        $values = " VALUES (";
        
        $attributes .= "PUBNAME";
        $values .= "'".$PublisherName."'";

        $attributes .= ", ADDRESS";
        $values .= ", '".$PublisherAddress."'";

        $attributes .= ")";
        $values .= ")";
        
        $query .= $attributes;
        $query .= $values;

        $res = DBController::getInstance()->runQuery($query);
        return $res;
    }
    
    public static function getAllPublishers() {
        $publishers = array();
        $res = DBController::getInstance()->runSelectQuery("SELECT * FROM PUBLISHER");
        foreach ($res as $data) {
            array_push($publishers, new PublisherData($data));
        }
        return $publishers;
    }

    public static function getPublisherInfo($PubID) {
        $res = DBController::getInstance()->runSelectQuery("SELECT * FROM PUBLISHER WHERE PUBLISHERID= ".$PubID."");
        if (count($res) > 0)
            return new PublisherData($res[0]);
        else
            return null;
    }

    public static function getPublisherName($PubID) {
        $res = DBController::getInstance()->runSelectQuery("SELECT PUBNAME FROM PUBLISHER WHERE PUBLISHERID= ".$PubID."");
        if (count($res) > 0)
            return $res[0]["PUBNAME"];
        else
            return null;
    }

    public static function getPublisherAddress($PubID) {
        $res = DBController::getInstance()->runSelectQuery("SELECT ADDRESS FROM PUBLISHER WHERE PUBLISHERID= ".$PubID."");
        if (count($res) > 0)
            return $res[0]["ADDRESS"];
        else
            return null;
    }

    public static function deletePublisher($PubID) {
        $res = DBController::getInstance()->runQuery("DELETE FROM PUBLISHER WHERE PUBLISHERID= ".$PubID."");
        return $res;
    }
    
    public static function deleteAllPublishers() {
        $res = DBController::getInstance()->runQuery("DELETE FROM PUBLISHER");
        return $res;
    }
}
