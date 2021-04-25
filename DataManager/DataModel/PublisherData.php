<?php


class PublisherData
{
    private $PublisherID;
    private $PublisherName;
    private $PublisherAddress;

    public function __construct($data)
    {
        $this->PublisherID = $data['PUBLISHERID'];
        $this->PublisherName = $data['PUBNAME'];
        $this->PublisherAddress = $data['ADDRESS'];
    }
    
    public function getPubID() {
        return $this->PublisherID;
    }

    public function getPublisherName() {
        return $this->PublisherName;
    }
    
    public function getPublisherAddress() {
        return $this->PublisherAddress;
    }

}
