<?php

class Database {
    private $host = 'localhost'; // Change this to your database host if its not localhost
    private $username = 'root'; // Change this to your database username
    private $password = ''; // Change this to your database password
    private $dbname = 'homeevents'; // The name of your database
    private $connection;

    // Constructor to create the connection
    public function __construct() {
        $this->connect();
    }
    
    // Method to establish a database connection
    private function connect() {
        $this->connection = new mysqli($this->host, $this->username, $this->password, $this->dbname);

        // Check if the connection was successful
        if ($this->connection->connect_error) {
            die('Connection failed: ' . $this->connection->connect_error);
        }
    }

    // Method to get the database connection
    public function getConnection() {
        return $this->connection;
    }

    // Method to close the database connection
    public function close() {
        if ($this->connection) {
            $this->connection->close();
        }
    }
    
    public function runSQL($sql) {
        // Ensure the connection is established
        if (!$this->connection) {
            die('No connection to the database');
        }

        try {
        $result = $this->connection->query($sql);
        if (!$result) {
             //throw new Exception('Query failed: ' . $this->connection->error);
             return false;
        }
        } catch (Exception $e) {
            //echo 'Database error: ' . $e->getMessage();
            return false;
        }

        return $result;
    }
    
    //Pass in a SQL SELECT statement. Return the first row of the result of the query as an array, or FALSE if no data returned
    public function get_first_result($sql) {
        
        $result = $this->runSQL($sql);
        if(!$result)
            return false;

        $firstrow = mysqli_fetch_assoc($result);
        if(!$firstrow)
            return false;
        
        return $firstrow;
        
    }
    
    public function get_single_value($table,$column,$test_col,$test_val) {
        $rs = $this->get_first_result("SELECT " . $column . " FROM " . $table . " WHERE " . $test_col . " = '" . $test_val . "'");
        if($rs)
            return $rs[$column];
        else
            return false;
    }
    
    public function write_note($user_id,$object_type,$object_id,$note_text,$date_override=null) {
        require_once('class/blank.php');
        $new_note = new Blank('notes');
        $new_note->set_value('user_id',$user_id);
        $new_note->set_value('object_type',$object_type);
        $new_note->set_value('object_identifier',$object_id);
        $new_note->set_value('note_text',$note_text);
        if($date_override != null)
            $new_note->set_value('date',$date_override);
        $new_note->save();
    }
    
    //Pass in a table name. Return an array with elements that are arrays of the fields and their properties
    //If no argument is passed, return a list of table names
    public function get_schema($table_name=null) {
        
        if($table_name != null) {
            $table_data = $this->runSQL("DESC " . $table_name);
            return $table_data;
        }
        $tables = array();
        $schema_data = $this->runSQL("SELECT TABLE_NAME FROM `INFORMATION_SCHEMA`.`TABLES` WHERE table_type = 'BASE TABLE' AND TABLE_SCHEMA = 'homeevents' ORDER BY TABLE_NAME");
        foreach($schema_data as $this_table) {
            array_push($tables,$this_table['TABLE_NAME']);
        }
        return $tables;
    }
    
    public function get_last_insert_id() {
        return mysqli_insert_id($this->connection);
    }
}

?>