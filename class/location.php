<?php

require_once('class/base.php');

class Location extends Base {
    public $name = null;
    public $address = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','location');
        parent::__construct($initial_id);
    }

    public function get_events() {
        if(!(int)$this->id > 0)
            return null;

        require_once('class/event.php');

        $results_array = array();
        $db2 = new Database();
        $sql_to_run = "SELECT id FROM event WHERE location_id = " . $this->id;
        $results_list = $db2->runSQL($sql_to_run);

        foreach($results_list as $this_result) {
            if(!(int)$this_result['id'] > 0)
                continue;
            $tmp_result = new Event($this_result['id']);
            array_push($results_array,$tmp_result);
        }
        
        return $results_array;
    }
    
}

?>