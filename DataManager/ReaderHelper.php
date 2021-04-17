<?php

include('DocumentBorrowManager.php');
include('DocumentReserveManager.php');
    
class ReaderHelper {
    
    //Search a document by ID.
    public static function searchDocByID($docID)
    {
        
    }
    
    //Search a document by title.
    public static function searchDocByTitle($docTitle)
    {
        
    }
    
    //Search a document by publisher name.
    //Print the document id and document titles of documents published by a publisher
    public static function searchDocByPublisherName($pubName)
    {
        
    }
    
    //Document checkout (borrow)
    public static function checkoutDocs($docCopies, $RID)
    {
        return DocumentBorrowManager::borrowMultiDocs($docCopies, $RID)
    }
    
    //Document reserve
    public static function reserveDocs($docCopies, $RID)
    {
        return DocumentReserveManager::reserveMultiDocs($docCopies, $RID)
    }
    
    //Document return
    public static function returnDocs($BOR_NO)
    {
        return DocumentBorrowManager::returnDocs($BOR_NO);
    }
    
    //Compute fine for a document copy borrowed by a reader based on the current date.
    public static function computeFine($RID)
    {
        return DocumentBorrowManager::calculateFine($RID);
    }
    
    //Print the list of documents reserved by a reader and their status(??).
    public static function getReservedDocs()
    {
        
    }
    
    //-------------------------------------------------------------//
}
?>

</div>
</BODY>
</HTML>
