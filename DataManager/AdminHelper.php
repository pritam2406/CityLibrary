<?php

include('CommonDataManager.php');
include('BranchDataManager.php');
include('ReaderDataManager.php');

class AdminHelper {
    
    //- Add a document copy.
    public static function addDocCopy($docID, $copyNo, $BID, $position)
    {
        
    }
    
    //- Add new reader.
    public static function addReader($ReaderType, $ReaderName, $ReaderAddress, $ReaderPhone)
    {
        return ReaderDataManager::insertReader($ReaderType, $ReaderName, $ReaderAddress, $ReaderPhone);
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
}
?>

</div>
</BODY>
</HTML>
