<?php


class ProceedingsData extends DocumentData
{
    private $CDate;
    private $CLocation;
    private $CEditor;
    
    public function __construct($data) {
        parent::__construct($data);
        $this->CDate = $data['CDATE'];
        $this->CLocation = $data['CLOCATION'];
        $this->CEditor = $data['CEDITOR'];
    }
    
    public function getCDate() {
        return $this->CDate;
    }
    
    public function getCLocation() {
        return $this->CLocation;
    }
    
    public function getCEditor() {
        return $this->CEditor;
    }
}
