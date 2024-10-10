<?php

require_once('class/base.php');

class ActivityObjectType extends Base {
    public $name = null;
    public $activity_id = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','activity_object_type');
        parent::__construct($initial_id);
    }

}

?>