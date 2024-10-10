<?php

require_once('class/base.php');

class EventActivitiesResultsObjects extends Base {
    public $event_activities_results_id = null;
    public $activity_object_id = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','event_activities_results_objects');
        parent::__construct($initial_id);
    }

}

?>