<?php

require_once('class/base.php');

class ActivityResult extends Base {
    public $name = null;
    public $highest_wins = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','activity_result');
        parent::__construct($initial_id);
    }

    public function get_activities() {
        if(!(int)$this->id > 0)
            return null;

        require_once('class/activity.php');

        $results_array = array();
        $db2 = new Database();
        $sql_to_run = "SELECT id FROM activity WHERE activity_result_id = " . $this->id;
        $results_list = $db2->runSQL($sql_to_run);

        foreach($results_list as $this_result) {
            if(!(int)$this_result['id'] > 0)
                continue;
            $tmp_result = new Activity($this_result['id']);
            array_push($results_array,$tmp_result);
        }
        
        return $results_array;
    }
    
}

?>