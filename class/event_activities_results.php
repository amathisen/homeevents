<?php

require_once('base.php');

class EventActivityResult extends Base {
    public $event_activities_id = null;
    public $user_id = null;
    public $activity_result_id = null;
    public $result_value = null;

    public function __construct($initial_id = null) {
        $this->set_table_name('event_activities_results');
        parent::__construct($initial_id);
    }

}

?>