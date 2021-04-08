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
include('../DataManager/PublisherDataManager.php');
    if(array_key_exists('createPublisher', $_POST)) {
        createPublisher();
    }
    else if(array_key_exists('getAllPublishers', $_POST)) {
        getAllPublishers();
    }
    else if(array_key_exists('getPublisherInfo', $_POST)) {
        getPublisherInfo();
    }
    else if(array_key_exists('getPublisherName', $_POST)) {
        getPublisherName();
    }
    else if(array_key_exists('deletePublisher', $_POST)) {
        deletePublisher();
    }
    else if(array_key_exists('deleteAllPublishers', $_POST)) {
        deleteAllPublishers();
    }
    
    function createPublisher() {
        $res = PublisherDataManager::createPublisher("1", "PubNAME1", null);
        if($res == 1) {
            echo "Publisher created with PubID 1";
        }
        else {
            echo "Publisher not created";
        }
    }
    function getAllPublishers() {
        $res = PublisherDataManager::getAllPublishers();
        if(count($res) == 0) {
            echo "No Publisher";
        }
        else {
            foreach($res as $branch) {
                echo "PublisherName : ".$branch->getPublisherName().", PublisherLocation: ".$branch->getPublisherAddress()."<br>" ;
            }
        }
    }
    function getPublisherInfo() {
        $res = PublisherDataManager::getPublisherInfo("1");
        if($res == null) {
            echo "No Publisher";
        }
        else {
            echo "PublisherName : ".$res->getPublisherName().", PublisherLocation: ".$res->getPublisherAddress()."" ;
        }
    }
    function getPublisherName() {
        $res = PublisherDataManager::getPublisherName("1");
        if($res == null) {
            echo "No Publisher";
        }
        else {
            echo $res;
        }
    }
    function deletePublisher() {
        $res = PublisherDataManager::deletePublisher("1");
        if($res == 1) {
            echo "Deleted Publisher with PubID=1";
        }
    }
    function deleteAllPublishers() {
        $res = PublisherDataManager::deleteAllPublishers();
        if($res == 1) {
            echo "Deleted all publishers";
        }
    }
?>

<body>
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <form method="post">
                    <input type="submit" name="createPublisher" class="button" value="Create Publishers" />
                    <input type="submit" name="getAllPublishers" class="button" value="Get All Publishers" />
                    <input type="submit" name="getPublisherInfo" class="button" value="Get Publisher" />
                    <input type="submit" name="getPublisherName" class="button" value="Get Publisher Name" />
                    <input type="submit" name="deletePublisher" class="button" value="Delete Publisher" />
                    <input type="submit" name="deleteAllPublishers" class="button" value="Delete All Publishers" />
                </form>
            </div>
        </div>
    </div>
</body>
</html>
