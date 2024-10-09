<?php

require_once('class/base.php');

class EventActivitiesResults extends Base {
    public $event_activities_id = null;
    public $user_id = null;
    public $result_value = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','event_activities_results');
        parent::__construct($initial_id);
    }

    public function get_results_object() {
        if(!(int)$this->id > 0)
            return null;

        require_once('class/event_activities_results_objects.php');

        $results_array = array();
        $db2 = new Database();
        $sql_to_run = "SELECT id FROM event_activities_results_objects WHERE event_activities_results_id = " . $this->id;
        $results_list = $db2->runSQL($sql_to_run);

        foreach($results_list as $this_result) {
            if(!(int)$this_result['id'] > 0)
                continue;
            $tmp_result = new EventActivitiesResultsObjects($this_result['id']);
            array_push($results_array,$tmp_result);
        }
        
        if(count($results_array) == 1)
            return $tmp_result;

        return $results_array;
    }
    
}

?>