<?php

require_once('base.php');

class EventActivity extends Base {
    public $name = null;
    public $event_id = null;
    public $activity_id = null;

    public function __construct($initial_id = null) {
        $this->set_table_name('event_activities');
        parent::__construct($initial_id);
    }

}

?>