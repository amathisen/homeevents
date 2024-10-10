<?php

require_once('class/base.php');

class ActivityObject extends Base {
    public $name = null;
    public $activity_object_type_id = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','activity_object');
        parent::__construct($initial_id);
    }

    public function get_activity_object_type() {
        if(!(int)$this->activity_object_type_id > 0)
            return null;

        require_once('class/activity_object_type.php');
        $activity_object_type = new ActivityObjectType($this->activity_object_type_id);
        
        return $activity_object_type;
    }
   
    public function get_activity_object_properties() {
        if(!(int)$this->id > 0)
            return null;

        require_once('class/activity_object_property.php');

        $results_array = array();
        $db2 = new Database();
        $sql_to_run = "SELECT id FROM activity_object_property WHERE activity_object_id = " . $this->id;
        $results_list = $db2->runSQL($sql_to_run);

        foreach($results_list as $this_result) {
            if(!(int)$this_result['id'] > 0)
                continue;
            $tmp_result = new ActivityObjectProperty($this_result['id']);
            array_push($results_array,$tmp_result);
        }
        
        return $results_array;
    }
}

?>