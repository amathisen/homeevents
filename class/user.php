<?php

require_once('class/base.php');

class User extends Base {
    public $name = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','user');
        parent::__construct($initial_id);
    }

    public function get_events() {
        if(!(int)$this->id > 0)
            return null;

        require_once('class/event.php');
        $event_list = array();
        $db2 = new Database();
        $sql_to_run = "SELECT event_id FROM event_users WHERE user_id = " . $this->id;
        $event_id_array = $db2->runSQL($sql_to_run);
        
        foreach($event_id_array as $this_id) {
            if(!(int)$this_id['event_id'] > 0)
                continue;
            $tmp_event = new Event($this_id['event_id']);
            array_push($event_list,$tmp_event);
        }
        return $event_list;
    }
    
}

?>