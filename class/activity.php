<?php

require_once('base.php');

class Activity extends Base {
    public $name = null;
    public $description = null;
    public $activity_result_id = null;

    public function __construct($initial_id = null) {
        $this->set_table_name('activity');
        parent::__construct($initial_id);
    }

}

?>