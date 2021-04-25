<?php


class PersonData
{
    private $PID;
    private $PersonName;
    
    public function __construct($data)
    {
        $this->PID = $data['PID'];
        $this->PersonName = $data['PNAME'];
    }
    
    public function getPID() {
        return $this->PID;
    }

    public function getPersonName() {
        return $this->PersonName;
    }

}
