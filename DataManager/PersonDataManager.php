<?php

include('DataModel/PersonData.php');
require_once("DBController.php");

class PersonDataManager
{
    public static function createPerson($PersonName) {
        $query = "INSERT INTO PERSON";
        $attributes = "(";
        $values = " VALUES (";
        
        $attributes .= "PNAME";
        $values .= "'".$PersonName."'";

        $attributes .= ")";
        $values .= ")";
        
        $query .= $attributes;
        $query .= $values;

        $res = DBController::getInstance()->runQuery($query);
        return $res;
    }
    
    public static function getAllPersons() {
        $persons = array();
        $res = DBController::getInstance()->runSelectQuery("SELECT * FROM PERSON");
        foreach ($res as $data) {
            array_push($persons, new PersonData($data));
        }
        return $persons;
    }

    public static function getPersonInfo($PID) {
        $res = DBController::getInstance()->runSelectQuery("SELECT * FROM PERSON WHERE PID= ".$PID."");
        if (count($res) > 0)
            return new PersonData($res[0]);
        else
            return null;
    }

    public static function getPersonName($PID) {
        $res = DBController::getInstance()->runSelectQuery("SELECT PNAME FROM PERSON WHERE PID= ".$PID."");
        if (count($res) > 0)
            return $res[0]["PNAME"];
        else
            return null;
    }

    public static function deletePerson($PID) {
        $res = DBController::getInstance()->runQuery("DELETE FROM PERSON WHERE PID= ".$PID."");
        return $res;
    }
    
    public static function deleteAllPersons() {
        $res = DBController::getInstance()->runQuery("DELETE FROM PERSON");
        return $res;
    }
}
