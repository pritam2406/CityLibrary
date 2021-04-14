<?php


class JournalVolumeData extends DocumentData
{
    private $VolumeNo;
    private $Editor;
    
    public function __construct($data) {
        parent::__construct($data);
        $this->VolumeNo = $data['VOLUME_NO'];
        $this->Editor = $data['EDITOR'];
    }
    
    public function getVolumeNo() {
        return $this->VolumeNo;
    }
    
    public function getEditor() {
        return $this->Editor;
    }
}
