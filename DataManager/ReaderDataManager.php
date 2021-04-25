<?php

include('DataModel/ReaderData.php');
require_once("DBController.php");
    
class ReaderDataManager
{
    public static function insertReader($ReaderType, $ReaderName, $ReaderAddress, $ReaderPhone) {
        
        $query = "INSERT INTO READER";
        $attributes = "(";
        $values = " VALUES (";
        
        if($ReaderType != null) {
            $attributes .= "RTYPE";
            $values .= "".$ReaderType."";
        }
        if($ReaderName != null) {
            $attributes .= ", RNAME";
            $values .= ", '".$ReaderName."'";
        }
        if($ReaderAddress != null) {
            $attributes .= ", RADDRESS";
            $values .= ", '".$ReaderAddress."'";
        }
        if($ReaderPhone != null) {
            $attributes .= ", PHONE_NO";
            $values .= ", '".$ReaderPhone."'";
        }
        
        $attributes .= ")";
        $values .= ")";
        
        $query .= $attributes;
        $query .= $values;

        $res = DBController::getInstance()->runQuery($query);
        return $res;
    }

    public static function getReaderInfo($RID) {
        $res = DBController::getInstance()->runSelectQuery("SELECT * FROM READER WHERE RID= ".$RID."");
        if (count($res) > 0)
            return new ReaderData($res[0]);
        else
            return null;
    }
    
    public static function getAllReaders() {
        $readers = array();
        $res = DBController::getInstance()->runSelectQuery("SELECT * FROM READER");
        foreach ($res as $data) {
            array_push($readers, new ReaderData($data));
        }
        return $readers;
    }

    public static function getReaderType($RID) {
        $res = DBController::getInstance()->runSelectQuery("SELECT RTYPE FROM READER WHERE RID= ".$RID."");
        if (count($res) > 0)
            return $res[0]["RTYPE"];
        else
            return null;
    }

    public static function getReaderName($RID) {
        $res = DBController::getInstance()->runSelectQuery("SELECT RNAME FROM READER WHERE RID= ".$RID."");
        if (count($res) > 0)
            return $res[0]["RNAME"];
        else
            return null;
    }

    public static function getReaderAddress($RID) {
        $res = DBController::getInstance()->runSelectQuery("SELECT RADDRESS FROM READER WHERE RID= ".$RID."");
        if (count($res) > 0)
            return $res[0]["RADDRESS"];
        else
            return null;
    }

    public static function getReaderPhoneNo($RID) {
        $res = DBController::getInstance()->runSelectQuery("SELECT PHONE_NO FROM READER WHERE RID= ".$RID."");
        if (count($res) > 0)
            return $res[0]["PHONE_NO"];
        else
            return null;
    }

    public static function deleteReader($RID) {
        $res = DBController::getInstance()->runQuery("DELETE FROM READER WHERE RID= ".$RID."");
        return $res;
    }
    
    public static function deleteAllReaders() {
        $res = DBController::getInstance()->runQuery("DELETE FROM READER");
        return $res;
    }
}
