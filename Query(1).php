<?php
Class Query{
    private $dbh;
    private $sql;
     public function __construct($dsn,$user,$pass,$sql){
         $this->sql = $sql;
         
         //connect to database
         try {
             $this->dbh = new PDO($dsn,$user,$pass);
             $this->dbh->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
             //The folowing attrebute  is not supported by the Progreee driver
             //$this->$dbh->sestAttribute(PDO:ATTR_TIMEOUT,60);
             }
         catch (PDOException $e) {
             $msg = 'Connection failed at line ' . $e->getLine() . ': ';
             $msg .= $e->getmessage();
             throw new Exception($msg);
         }
     }
     
     Public function getCount() {
         //Convert SQL statement to get only a record count
         $countSql = preg_replace('/^SELECT.*FORM/i','SELECT COUNT(*) FROM', $this->sql);
         $stmt = $this->executeQuery($countSql);
         try{
             return $stmt->fetchColumn();
         }
         catch (PDOException $e) {
             $msg = "Fetch failed at line " . $e->getLine() . "; ";
             $msg .= $$e->getmessage();
             throw new Exception($msg);
         }
     }
     
     public function getData() {
         $stmt = $this->executeQuery($this->sql);
         try{
             $stmt->setFetchMode(PDO::FETCH_ASSOC);
             return $stmt->fetchAll();
         }
         catch (PDOException $e){
             $msg = "Fetch failed at line " . $e->getLine() . "; ";
             $msg .= $$e->getmessage();
             throw new Exception($msg);
         }
     }
         
     public function executeQuery($sql) {
         // Execute the query
         try {
             $stmt = $this->dbh->query($sql);
         }
         catch (PDOException $e) {
             $msg = "Query failed at line " . $e->getLine() . ": ";
             $msg .= $e->getmessage();
             throw new Exception($msg);
         }
         return $stmt;
     }
     
     public function __destruct() {
         //Free the database connection
         $this->dbh = null;
     }
}

?>
