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
include('../DataManager/BranchDataManager.php');
    if(array_key_exists('createBranch', $_POST)) {
        createBranch();
    }
    else if(array_key_exists('getAllBranch', $_POST)) {
        getAllBranch();
    }
    else if(array_key_exists('getBranch', $_POST)) {
        getBranch();
    }
    else if(array_key_exists('getBranchName', $_POST)) {
        getBranchName();
    }
    else if(array_key_exists('deleteBranch', $_POST)) {
        deleteBranch();
    }
    else if(array_key_exists('deleteAllBranch', $_POST)) {
        deleteAllBranch();
    }
    
    function createBranch() {
        $res = BranchDataManager::createBranch("1", "LNAME1", "LOCATION1");
        if($res == 1) {
            echo "Branch created with BID 1";
        }
        else {
            echo "Branch not created";
        }
    }
    function getAllBranch() {
        $res = BranchDataManager::getAllBranches();
        if(count($res) == 0) {
            echo "No Branch";
        }
        else {
            foreach($res as $branch) {
                echo "BranchName : ".$branch->getBranchName().", BranchLocation: ".$branch->getBranchLocation()."<br>" ;
            }
        }
    }
    function getBranch() {
        $res = BranchDataManager::getBranchInfo("1");
        if($res == null) {
            echo "No Branch";
        }
        else {
            echo "BranchName : ".$res->getBranchName().", BranchLocation: ".$res->getBranchLocation()."" ;
        }
    }
    function getBranchName() {
        $res = BranchDataManager::getBranchName("1");
        if($res == null) {
            echo "No Branch";
        }
        else {
            echo $res;
        }
    }
    function deleteBranch() {
        $res = BranchDataManager::deleteBranch("1");
        if($res == 1) {
            echo "Deleted Branch with BID=1";
        }
    }
    function deleteAllBranch() {
        $res = BranchDataManager::deleteAllBranches();
        if($res == 1) {
            echo "Deleted all branches";
        }
    }
?>

<body>
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <form method="post">
                    <input type="submit" name="createBranch" class="button" value="Create Branch" />
                    <input type="submit" name="getAllBranch" class="button" value="Get All Branch" />
                    <input type="submit" name="getBranch" class="button" value="Get Branch" />
                    <input type="submit" name="getBranchName" class="button" value="Get Branch Name" />
                    <input type="submit" name="deleteBranch" class="button" value="Delete Branch" />
                    <input type="submit" name="deleteAllBranch" class="button" value="Delete All Branch" />
                </form>
            </div>
        </div>
    </div>
</body>
</html>
