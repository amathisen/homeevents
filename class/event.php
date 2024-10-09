<?php

require_once('class/base.php');

class Event extends Base {
    public $location_id = null;
    public $date = null;
    public $title = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','event');
        parent::__construct($initial_id);
    }

    public function get_location() {
        if(!(int)$this->location_id > 0)
            return null;
        
        require_once('class/location.php');
        
        $tmp_location = new Location($this->location_id);
        
        return $tmp_location;
    }
    
    public function get_users() {
        require_once('class/user.php');
        $users_list = array();
        $db2 = new Database();
        $sql_to_run = "SELECT id FROM user WHERE id IN(SELECT user_id FROM event_users WHERE event_id = " . $this->id . ")";
        $users_id_array = $db2->runSQL($sql_to_run);
        
        foreach($users_id_array as $this_id) {
            if(!(int)$this_id['id'] > 0)
                continue;
            $tmp_user = new User($this_id['id']);
            array_push($users_list,$tmp_user);
        }
        return $users_list;
    }
    
    public function get_event_activities() {
        require_once('class/event_activities.php');

        $db2 = new Database();
        $event_activities = array();
        $sql_to_run = "SELECT id FROM event_activities WHERE event_id = " . $this->id;
        $event_activities_list = $db2->runSQL($sql_to_run);
        
        foreach($event_activities_list as $this_activity) {
            if(!(int)$this_activity['id'] > 0)
                continue;
            $tmp_activity = new EventActivities($this_activity['id']);
            array_push($event_activities,$tmp_activity);
        }

        return $event_activities;
    }
}

?>