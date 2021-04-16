<?php

include('CommonDataManager.php');
include('BranchDataManager.php');
include('ReaderDataManager.php');
include('PublisherDataManager.php');
include('PersonDataManager.php');
include('DocumentDataManager.php');
include('DocumentCopyDataManager.php');

class AdminHelper {
    
    //- Add a document copy.
    public static function addDocCopy($docID, $copyNo, $BID, $position)
    {
        return DocumentCopyDataManager::insertDocCopy($docID, $copyNo, $BID, $position);
    }
    
    //- Add a reader
    public static function addReader($readerType, $readerName, $readerAddress, $readerPhone)
    {
        return ReaderDataManager::insertReader($readerType, $readerName, $readerAddress, $readerPhone);
    }
    
    //- Print branch information (name and location).
    public static function printBranchInfo($BID)
    {
        return BranchDataManager::getBranchInfo($BID);
    }
    
    //- Search document copy in branch and check its status.
    public static function searchDocCopyInBranch($docID, $copyNo, $BID)
    {
        return CommonDataManager::getDocStatus($docID, $copyNo, $BID);
    }
    
    //- Get number N as input and print the top N most frequent borrowers (Rid and name) in the library and the number of books each has borrowed.
    public static function frequentBorrowers($topN)
    {
        return CommonDataManager::mostFrequentBorrowers($topN);
    }
    
    //- Get number N and branch number I as input and print the top N most frequent borrowers (Rid and name) in branch I and the number of books each has borrowed.
    public static function frequentBorrowersByBranch($BID, $topN)
    {
        return CommonDataManager::mostFrequentBorrowersByBranch($BID, $topN);
    }
    
    //- Get number N as input and print the N most borrowed books in the library.
    public static function mostBorrowedDocs($topN)
    {
        return CommonDataManager::mostBorrowedDocs($topN);
    }
    
    //- Get number N and branch number I as input and print the N most borrowed books in branch I.
    public static function mostBorrowedDocsByBranch($BID, $topN)
    {
        return CommonDataManager::mostBorrowedDocsByBranch($BID, $topN);
    }
    
    //- Get a year as input and print the 10 most popular books of that year in the library.
    public static function mostPopular10DocsOfYear($year)
    {
        return CommonDataManager::mostPopular10DocsInYear($year);
    }
    
    //- Get a start date S and an end date E as input and print, for each branch, the branch Id and name and the average fine paid by the borrowers for documents borrowed from this branch during the corresponding period of time.
    public static function avgFineInPeriod($startDate, $endDate)
    {
        return CommonDataManager::calculateAvgFine($startDate, $endDate);
    }
    
//-------------------------------------------------------------//
    
    public static function insertPublisher($publisherName, $publisherAddress)
    {
        return PublisherDataManager::createPublisher($publisherName, $publisherAddress);
    }
    
    public static function getAllPublishers()
    {
        return PublisherDataManager::getAllPublishers();
    }
    
    public static function insertPerson($personName)
    {
        return PersonDataManager::createPerson($personName);
    }
    
    public static function getAllPersons()
    {
        return PersonDataManager::getAllPersons();
    }
    
    public static function insertBranch($branchName, $branchLocation)
    {
        return BranchDataManager::createBranch($branchName, $branchLocation);
    }
    
    public static function insertBook($title, $pDate, $publisherID, $ISBN, $authorPIDs)
    {
        return DocumentDataManager::insertBook($title, $pDate, $publisherID, $ISBN, $authorPIDs);
    }
    
    public static function insertProceedings($title, $pDate, $publisherID, $cDate, $cLocation, $cEditorID, $chairIDs)
    {
        return DocumentDataManager::insertProceedings($title, $pDate, $publisherID, $cDate, $cLocation, $cEditorID, $chairIDs);
    }
    
    public static function insertJournalVolume($title, $pDate, $publisherID, $volumeNo, $editorID)
    {
        return DocumentDataManager::insertJournalVolume($title, $pDate, $publisherID, $volumeNo, $editorID);
    }
    
    public static function insertJournalIssue($docID, $issueNo, $scope, $guestEditorPIDs)
    {
        return DocumentDataManager::insertJournalIssue($docID, $issueNo, $scope, $guestEditorPIDs);
    }
}
?>

</div>
</BODY>
</HTML>
