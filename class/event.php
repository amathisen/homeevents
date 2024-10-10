<?php

require_once('class/base.php');

class Event extends Base {
    public $location_id = null;
    public $date = null;
    public $title = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','event');
        parent::__construct($initial_id);
    }

}

?>