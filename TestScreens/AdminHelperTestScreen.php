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
include('../DataManager/AdminHelper.php');
    if(array_key_exists('addDocCopy', $_POST)) {
        addDocCopy();
    }
    else if(array_key_exists('addReader', $_POST)) {
        addReader();
    }
    else if(array_key_exists('printBranchInfo', $_POST)) {
        printBranchInfo();
    }
    else if(array_key_exists('searchDocCopyInBranch', $_POST)) {
        searchDocCopyInBranch();
    }
    else if(array_key_exists('frequentBorrowers', $_POST)) {
        frequentBorrowers();
    }
    else if(array_key_exists('frequentBorrowersByBranch', $_POST)) {
        frequentBorrowersByBranch();
    }
    else if(array_key_exists('mostBorrowedDocs', $_POST)) {
        mostBorrowedDocs();
    }
    else if(array_key_exists('mostBorrowedDocsByBranch', $_POST)) {
        mostBorrowedDocsByBranch();
    }
    else if(array_key_exists('mostPopular10DocsOfYear', $_POST)) {
        mostPopular10DocsOfYear();
    }
    else if(array_key_exists('avgFineInPeriod', $_POST)) {
        avgFineInPeriod();
    }
    
    function addDocCopy() {
//        $res = BranchDataManager::createBranch("1", "LNAME1", "LOCATION1");
//        if($res == 1) {
//            echo "Branch created with BID 1";
//        }
//        else {
//            echo "Branch not created";
//        }
    }
    function addReader() {
//        $res = BranchDataManager::getAllBranches();
//        if(count($res) == 0) {
//            echo "No Branch";
//        }
//        else {
//            foreach($res as $branch) {
//                echo "BranchName : ".$branch->getBranchName().", BranchLocation: ".$branch->getBranchLocation()."<br>" ;
//            }
//        }
    }
    function printBranchInfo() {
        $res = AdminHelper::printBranchInfo("1");
        if($res == null) {
            echo "No Branch";
        }
        else {
            echo "BranchName : ".$res->getBranchName().", BranchLocation: ".$res->getBranchLocation()."" ;
        }
    }
    function searchDocCopyInBranch() {
        $res = AdminHelper::searchDocCopyInBranch("1", "1", "1");
        if($res == null) {
            echo "Not available";
        }
        else {
            if($res['RESERVED_RID'] != null) {
                echo "Reserved By ".$res['RESERVED_RID'];
            }
            else if($res['BORROWED_RID'] != null) {
                echo "Borrowed By ".$res['BORROWED_RID'];
            }
            else {
                echo "Available";
            }
        }
    }
    function frequentBorrowers() {
        $res = AdminHelper::frequentBorrowers(3);
        if(count($res) == 0) {
            echo "No Borrowers";
        }
        else {
            foreach($res as $borrower) {
                echo "RID ".$borrower["RID"].", Name : ".$borrower["RNAME"]." borrowed ".$borrower["NUM_DOCS"]." docs"."<br>";
            }
        }
    }
    function frequentBorrowersByBranch() {
        $res = AdminHelper::frequentBorrowersByBranch(1, 3);
        if(count($res) == 0) {
            echo "No Borrowers";
        }
        else {
            foreach($res as $borrower) {
                echo "RID ".$borrower["RID"].", Name : ".$borrower["RNAME"]." borrowed ".$borrower["NUM_DOCS"]." docs"."<br>";
            }
        }
    }
    
    function mostBorrowedDocs() {
        $res = AdminHelper::mostBorrowedDocs(3);
        if(count($res) == 0) {
            echo "No Borrowers";
        }
        else {
            foreach($res as $doc) {
                echo "DOCID ".$doc["DOCID"].", Title : ".$doc["TITLE"]." published on ".$doc["PDATE"].", published by ".$doc["PUBNAME"]." count ".$doc["NUM_DOCS"]."<br>";
            }
        }
    }
    
    function mostBorrowedDocsByBranch() {
        $res = AdminHelper::mostBorrowedDocsByBranch(1, 3);
        if(count($res) == 0) {
            echo "No Borrowers";
        }
        else {
            foreach($res as $doc) {
                echo "DOCID ".$doc["DOCID"].", Title : ".$doc["TITLE"]." published on ".$doc["PDATE"].", published by ".$doc["PUBNAME"]." count ".$doc["NUM_DOCS"]."<br>";
            }
        }
    }
    
    function mostPopular10DocsOfYear() {
        $res = AdminHelper::mostPopular10DocsOfYear(2021);
        if(count($res) == 0) {
            echo "No Borrowers";
        }
        else {
            foreach($res as $doc) {
                echo "DOCID ".$doc["DOCID"].", Title : ".$doc["TITLE"]." published on ".$doc["PDATE"].", published by ".$doc["PUBNAME"]." count ".$doc["NUM_DOCS"]."<br>";
            }
        }
    }
    
    function avgFineInPeriod() {
        $res = AdminHelper::avgFineInPeriod('2021-03-20', '2021-04-10');
        if(count($res) == 0) {
            echo "No Borrowers";
        }
        else {
            foreach($res as $branch) {
                echo "BID ".$branch["BID"].", LNAME : ".$branch["LNAME"]." avg fine ".$branch["AVG_FINE"]."<br>";
            }
        }
    }
?>

<body>
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <form method="post">
                    <input type="submit" name="addDocCopy" class="button" value="Add Doc Copy" />
                    <input type="submit" name="addReader" class="button" value="Add Reader" />
                    <input type="submit" name="printBranchInfo" class="button" value="Print Branch Info" />
                    <input type="submit" name="searchDocCopyInBranch" class="button" value="Search Doc Copy Status" />
                    <input type="submit" name="frequentBorrowers" class="button" value="Frequent Borrowers" />
                    <input type="submit" name="frequentBorrowersByBranch" class="button" value="Frequent Borrowers By Branch" />
                    <input type="submit" name="mostBorrowedDocs" class="button" value="Most Borrowed Docs" />
                    <input type="submit" name="mostBorrowedDocsByBranch" class="button" value="Most Borrowed Docs By Branch" />
                    <input type="submit" name="mostPopular10DocsOfYear" class="button" value="Most Popular 10 Docs of Year" />
                    <input type="submit" name="avgFineInPeriod" class="button" value="Avg Fine In Period" />
                </form>
            </div>
        </div>
    </div>
</body>
</html>
