<?php

require_once('base.php');

class EventActivities extends Base {
    public $name = null;
    public $event_id = null;
    public $activity_id = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','event_activities');
        parent::__construct($initial_id);
    }

}

?>