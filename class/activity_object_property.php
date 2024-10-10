<?php

require_once('class/base.php');

class ActivityObjectProperty extends Base {
    public $name = null;
    public $value = null;
    public $activity_object_id = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','activity_object_property');
        parent::__construct($initial_id);
    }

    public function get_activity_object() {
        if(!(int)$this->activity_object_id > 0)
            return null;
        
        require_once('class/activity_object.php');
        $this_activity = new ActivityObject($this->activity_object_id);
        
        return $this_activity;
    }
    
}

?>