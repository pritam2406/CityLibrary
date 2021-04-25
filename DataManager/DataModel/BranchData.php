<?php


class BranchData
{
    private $BID;
    private $BranchName;
    private $BranchLocation;

    public function __construct($data)
    {
        $this->BID = $data['BID'];
        $this->BranchName = $data['LNAME'];
        $this->BranchLocation = $data['LOCATION'];
    }
    
    public function getBID() {
        return $this->BID;
    }

    public function getBranchName() {
        return $this->BranchName;
    }

    public function getBranchLocation() {
        return $this->BranchLocation;
    }
}

?>
