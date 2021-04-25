<?php


class ReaderData
{
    private $RID;
    private $ReaderType;
    private $ReaderName;
    private $ReaderAddress;
    private $ReaderPhoneNo;

    public function __construct($data)
    {
        $this->RID = $data['RID'];
        $this->ReaderType = $data['RTYPE'];
        $this->ReaderName = $data['RNAME'];
        $this->ReaderAddress = $data['RADDRESS'];
        $this->ReaderPhoneNo = $data['PHONE_NO'];
    }
    
    public function getRID() {
        return $this->RID;
    }

    public function getReaderType() {
        return $this->ReaderType;
    }

    public function getReaderName() {
        return $this->ReaderName;
    }
    
    public function getReaderAddress() {
        return $this->ReaderAddress;
    }
    
    public function getReaderPhoneNo() {
        return $this->ReaderPhoneNo;
    }

}

