<?php

abstract class DocumentType
{
    const Book = 0;
    const JournalVolume = 1;
    const Proceedings = 2;
}

class DocumentData
{
    private $DocID;
    private $DocTitle;
    private $DocPublishedDate;
    private $DocPublisherID;

    public function __construct($data)
    {
        $this->DocID = $data['DOCID'];
        $this->DocTitle = $data['TITLE'];
        $this->DocPublishedDate = $data['PDATE'];
        $this->DocPublisherID = $data['PUBLISHERID'];
    }
    
    public function getDocID() {
        return $this->DOCID;
    }

    public function getDocTitle() {
        return $this->DocTitle;
    }

    public function getDocPublishedDate() {
        return $this->DocPublishedDate;
    }
    
    public function getDocPublisherID() {
        return $this->DocPublisherID;
    }
}
