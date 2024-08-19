<?php

require_once('base.php');

class Location extends Base {
    public $name = null;
    public $address = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','location');
        parent::__construct($initial_id);
    }

}

?>