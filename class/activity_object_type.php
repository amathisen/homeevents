<?php

require_once('class/base.php');

class ActivityObjectType extends Base {
    public $name = null;
    public $activity_id = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','activity_object_type');
        parent::__construct($initial_id);
    }

    public function get_activity() {
        if(!(int)$this->activity_id > 0)
            return null;

        require_once('class/activity.php');
        $activity = new Activity($this->activity_id);
        
        return $activity;
    }
    
    public function get_activity_objects() {
        if(!(int)$this->id > 0)
            return null;

        require_once('class/activity_object.php');

        $results_array = array();
        $db2 = new Database();
        $sql_to_run = "SELECT id FROM activity_object WHERE activity_object_type_id = " . $this->id;
        $results_list = $db2->runSQL($sql_to_run);

        foreach($results_list as $this_result) {
            if(!(int)$this_result['id'] > 0)
                continue;
            $tmp_result = new ActivityObject($this_result['id']);
            array_push($results_array,$tmp_result);
        }
        
        return $results_array;
    }
    
}

?>