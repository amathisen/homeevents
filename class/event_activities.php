<?php

require_once('class/base.php');

class EventActivities extends Base {
    public $name = null;
    public $event_id = null;
    public $activity_id = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','event_activities');
        parent::__construct($initial_id);
    }
    
    public function get_activity() {
        if(!(int)$this->activity_id > 0)
            return null;
        
        require_once('class/activity.php');
        $this_activity = new Activity($this->activity_id);
        
        return $this_activity;
    }
    
    public function get_results($user_id = null) {
        if(!(int)$this->id > 0)
            return null;

        require_once('class/event_activities_results.php');

        $results_array = array();
        $db2 = new Database();
        $sql_to_run = "SELECT id FROM event_activities_results WHERE event_activities_id = " . $this->id;
        if($user_id != null)
            $sql_to_run .= " AND user_id = " . $user_id;
        $results_list = $db2->runSQL($sql_to_run);

        foreach($results_list as $this_result) {
            if(!(int)$this_result['id'] > 0)
                continue;
            $tmp_result = new EventActivitiesResults($this_result['id']);
            array_push($results_array,$tmp_result);
        }
        
        if(count($results_array) == 1)
            return $tmp_result;

        return $results_array;
    }
}

?>