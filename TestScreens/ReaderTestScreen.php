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
include('../DataManager/ReaderDataManager.php');
    if(array_key_exists('insertReader', $_POST)) {
        insertReader();
    }
    else if(array_key_exists('getAllReaders', $_POST)) {
        getAllReaders();
    }
    else if(array_key_exists('getReader', $_POST)) {
        getReader();
    }
    else if(array_key_exists('getReaderName', $_POST)) {
        getReaderName();
    }
    else if(array_key_exists('deleteReader', $_POST)) {
        deleteReader();
    }
    else if(array_key_exists('deleteAllReaders', $_POST)) {
        deleteAllReaders();
    }
    
    function insertReader() {
        $res = ReaderDataManager::insertReader("1", "100", "Name1", null, "5512332414");
        if($res == 1) {
            echo "Reader created with RID 1";
        }
        else {
            echo "Reader not created";
        }
    }
    function getAllReaders() {
        $res = ReaderDataManager::getAllReaders();
        if(count($res) == 0) {
            echo "No Reader";
        }
        else {
            foreach($res as $reader) {
                echo "ReaderName : ".$reader->getReaderName().", ReaderLocation: ".$reader->getReaderAddress()."<br>" ;
            }
        }
    }
    function getReader() {
        $res = ReaderDataManager::getReaderInfo("1");
        if($res == null) {
            echo "No Reader";
        }
        else {
            echo "ReaderName : ".$res->getReaderName().", ReaderLocation: ".$res->getReaderAddress()."" ;
        }
    }
    function getReaderName() {
        $res = ReaderDataManager::getReaderName("1");
        if($res == null) {
            echo "No Reader";
        }
        else {
            echo $res;
        }
    }
    function deleteReader() {
        $res = ReaderDataManager::deleteReader("1");
        if($res == 1) {
            echo "Deleted reader with RID=1";
        }
    }
    function deleteAllReaders() {
        $res = ReaderDataManager::deleteAllReaders();
        if($res == 1) {
            echo "Deleted all readers";
        }
    }
?>

<body>
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <form method="post">
                    <input type="submit" name="insertReader" class="button" value="Insert Reader" />
                    <input type="submit" name="getAllReaders" class="button" value="Get All Readers" />
                    <input type="submit" name="getReader" class="button" value="Get Reader" />
                    <input type="submit" name="getReaderName" class="button" value="Get Reader Name" />
                    <input type="submit" name="deleteReader" class="button" value="Delete Reader" />
                    <input type="submit" name="deleteAllReaders" class="button" value="Delete All Readers" />
                </form>
            </div>
        </div>
    </div>
</body>
</html>
