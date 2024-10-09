<?php

require_once('base.php');

class Event extends Base {
    public $location_id = null;
    public $date = null;
    public $title = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','event');
        parent::__construct($initial_id);
    }

    public function get_users() {
        $db2 = new Database();
        $sql_to_run = "SELECT * FROM user WHERE id IN(SELECT user_id FROM event_users WHERE event_id = " . $this->id . ")";
        $users_list = $db2->runSQL($sql_to_run);
        return $users_list;
    }
    
    public function get_event_activities() {
        $db2 = new Database();
        $sql_to_run = "SELECT * FROM event_activities WHERE event_id = " . $this->id;
        $event_activities_list = $db2->runSQL($sql_to_run);
        return $event_activities_list;
    }
}

?>