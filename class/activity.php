<?php

require_once('class/base.php');

class Activity extends Base {
    public $name = null;
    public $description = null;
    public $activity_result_id = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','activity');
        parent::__construct($initial_id);
    }

    public function get_activity_result() {
        if(!(int)$this->activity_result_id > 0)
            return null;

        require_once('class/activity_result.php');
        $activity_result = new ActivityResult($this->activity_result_id);
        
        return $activity_result;
    }

    public function get_activity_object_types() {
        if(!(int)$this->id > 0)
            return null;

        require_once('class/activity_object_type.php');

        $results_array = array();
        $db2 = new Database();
        $sql_to_run = "SELECT id FROM activity_object_type WHERE activity_id = " . $this->id;
        $results_list = $db2->runSQL($sql_to_run);

        foreach($results_list as $this_result) {
            if(!(int)$this_result['id'] > 0)
                continue;
            $tmp_result = new ActivityObjectType($this_result['id']);
            array_push($results_array,$tmp_result);
        }
        
        return $results_array;
    }
    
}

?>