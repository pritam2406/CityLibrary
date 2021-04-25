<?php


class BookData extends DocumentData
{
    private $ISBN;
    
    public function __construct($data) {
        parent::__construct($data);
        $this->ISBN = $data['ISBN'];
    }
    
    public function getISBN() {
        return $this->ISBN;
    }
}
