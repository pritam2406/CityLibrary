<?php
class DBController {

    private static $instance = null;
    
	private $host = "localhost";
	private $user = "root";
	private $password = ""; //Blank password for Bilas
	private $database = "city_library";
	private $conn;
	
    public static function getInstance()
    {
        if (self::$instance == null)
        {
          self::$instance = new DBController();
        }
     
        return self::$instance;
    }
    
	function __construct() {
		$this->conn = $this->connectDB();
	}
	
	function connectDB() {
		$conn = mysqli_connect($this->host,$this->user,$this->password,$this->database);
		return $conn;
	}
	
	function runSelectQuery($query) {
        #echo $query."<br>";
		$result = mysqli_query($this->conn,$query);
        
//		while($row=mysqli_fetch_assoc($result)) {
//			$resultset[] = $row;
//		}
//		if(!empty($resultset))
//			return $resultset;
        
        $res = array();
        while($row = $result->fetch_assoc()) {
            array_push($res, $row);
        }
        
        return $res;
	}
	
	function runQuery($query) {
		$result = mysqli_query($this->conn,$query);
        if($result != 1) {
            echo("<br> <b> Error description: " . mysqli_error($this->conn)). "</b> <br>";
        }
        $insertID = mysqli_insert_id($this->conn);
		return $insertID;
	}
	
	function numRows($query) {
		$result  = mysqli_query($this->conn,$query);
		$rowcount = mysqli_num_rows($result);
		return $rowcount;	
	}
}
?>
