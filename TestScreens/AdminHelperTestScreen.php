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
    else if(array_key_exists('insertBook', $_POST)) {
        insertBook();
    }
    else if(array_key_exists('insertProceeding', $_POST)) {
        insertProceeding();
    }
    else if(array_key_exists('insertJournalVolume', $_POST)) {
        insertJournalVolume();
    }
    else if(array_key_exists('insertBranch', $_POST)) {
        insertBranch();
    }
    
    function insertBranch()
    {
        AdminHelper::insertBranch("Branch1", "BranchLocation1");
    }
    function addReader()
    {
        AdminHelper::addReader(1, "ReaderName1", "ReaderAddress1", "123456789");
    }
    
    function insertBook()
    {
        $pubID = AdminHelper::insertPublisher("PublisherName1", "PublisherAddress1");
        
        $pID1 = AdminHelper::insertPerson("PersonName1");
        $pID2 = AdminHelper::insertPerson("PersonName2");
        $pID3 = AdminHelper::insertPerson("PersonName3");
        
        $authorPIDs = array($pID1, $pID2, $pID3);
        
        AdminHelper::insertBook("Book1", '2021-01-05', $pubID, "ISBN1", $authorPIDs);
    }
    
    function insertProceeding()
    {
        $pubID = AdminHelper::insertPublisher("PublisherName2", "PublisherAddress2");
        
        $pID4 = AdminHelper::insertPerson("PersonName4");
        $pID5 = AdminHelper::insertPerson("PersonName5");
        $pID6 = AdminHelper::insertPerson("PersonName6");
        
        $chairPIDs = array($pID4, $pID5, $pID6);
        
        $pID7 = AdminHelper::insertPerson("PersonName7");
        
        AdminHelper::insertProceedings("Proceeding1", '2021-01-11', $pubID, '2021-01-02', 'Kearny', $pID7, $chairPIDs);
    }
    
    function insertJournalVolume()
    {
        $pubID = AdminHelper::insertPublisher("PublisherName3", "PublisherAddress3");
        
        $pID8 = AdminHelper::insertPerson("PersonName8");
        
        $docID = AdminHelper::insertJournalVolume("JournalVolume1", '2021-01-11', $pubID, 1, $pID8);
        
        $pID9 = AdminHelper::insertPerson("PersonName9");
        $pID10 = AdminHelper::insertPerson("PersonName10");
        $guest1PIDs = array($pID9, $pID10);
        AdminHelper::insertJournalIssue($docID, 1, "scope1", $guest1PIDs);
        
        $pID11 = AdminHelper::insertPerson("PersonName11");
        $pID12 = AdminHelper::insertPerson("PersonName12");
        $guest2PIDs = array($pID11, $pID12);
        AdminHelper::insertJournalIssue($docID, 2, "scope2", $guest2PIDs);
    }
    
    function addDocCopy() {
        $res = AdminHelper::addDocCopy(10, 1, 1, "A1B2C3");
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
                    <input type="submit" name="insertBook" class="button" value="Insert Book" />
                    <input type="submit" name="insertProceeding" class="button" value="Insert Proceeding" />
                    <input type="submit" name="insertJournalVolume" class="button" value="Insert Journal Volume" />
                    <input type="submit" name="insertBranch" class="button" value="Insert Branch" />
                </form>
            </div>
        </div>
    </div>
</body>
</html>
