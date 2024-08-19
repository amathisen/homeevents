<?php

require_once('base.php');

class User extends Base {
    public $name = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','user');
        parent::__construct($initial_id);
    }

}

?>