<?php


class DocumentCopyData
{
    private $DocID;
    private $DocCopyNo;
    private $DocBID;
    private $DocPosition;

    public function __construct($data)
    {
        $this->DocID = $data['DOCID'];
        $this->DocCopyNo = $data['COPYNO'];
        $this->DocBID = $data['BID'];
        $this->DocPosition = $data['POSITION'];
    }
    
    public function getDocID() {
        return $this->DocID;
    }

    public function getDocCopyNo() {
        return $this->DocCopyNo;
    }

    public function getDocBID() {
        return $this->DocBID;
    }
    
    public function getDocPosition() {
        return $this->DocPosition;
    }
}
