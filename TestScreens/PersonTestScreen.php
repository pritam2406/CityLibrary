<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Record</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .wrapper{
            width: 600px;
            margin: 0 auto;
        }
    </style>
</head>

<?php
include('../DataManager/PersonDataManager.php');
    if(array_key_exists('createPerson', $_POST)) {
        createPerson();
    }
    else if(array_key_exists('getAllPersons', $_POST)) {
        getAllPersons();
    }
    else if(array_key_exists('getPersonInfo', $_POST)) {
        getPersonInfo();
    }
    else if(array_key_exists('getPersonName', $_POST)) {
        getPersonName();
    }
    else if(array_key_exists('deletePerson', $_POST)) {
        deletePerson();
    }
    else if(array_key_exists('deleteAllPersons', $_POST)) {
        deleteAllPersons();
    }
    
    function createPerson() {
        $res = PersonDataManager::createPerson("1", "NAME1");
        if($res == 1) {
            echo "Person created with PID 1";
        }
        else {
            echo "Person not created";
        }
    }
    function getAllPersons() {
        $res = PersonDataManager::getAllPersons();
        if(count($res) == 0) {
            echo "No Person";
        }
        else {
            foreach($res as $person) {
                echo "PersonName : ".$person->getPersonName()."<br>" ;
            }
        }
    }
    function getPersonInfo() {
        $res = PersonDataManager::getPersonInfo("1");
        if($res == null) {
            echo "No Person";
        }
        else {
            echo "PersonName : ".$res->getPersonName()."" ;
        }
    }
    function getPersonName() {
        $res = PersonDataManager::getPersonName("1");
        if($res == null) {
            echo "No Person";
        }
        else {
            echo $res;
        }
    }
    function deletePerson() {
        $res = PersonDataManager::deletePerson("1");
        if($res == 1) {
            echo "Deleted Person with PID=1";
        }
    }
    function deleteAllPersons() {
        $res = PersonDataManager::deleteAllPersons();
        if($res == 1) {
            echo "Deleted all persons";
        }
    }
?>

<body>
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <form method="post">
                    <input type="submit" name="createPerson" class="button" value="Create Person" />
                    <input type="submit" name="getAllPersons" class="button" value="Get All Persons" />
                    <input type="submit" name="getPersonInfo" class="button" value="Get Person" />
                    <input type="submit" name="getPersonName" class="button" value="Get Person Name" />
                    <input type="submit" name="deletePerson" class="button" value="Delete Person" />
                    <input type="submit" name="deleteAllPersons" class="button" value="Delete All Persons" />
                </form>
            </div>
        </div>
    </div>
</body>
</html>
