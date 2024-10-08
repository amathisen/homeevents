<?php

require_once('base.php');

class ActivityObject extends Base {
    public $name = null;
    public $activity_object_type_id = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','activity_object');
        parent::__construct($initial_id);
    }

}

?>