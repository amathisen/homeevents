<?php

require_once('class/base.php');

class EventUsers extends Base {
    public $event_id = null;
    public $user_id = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','event_users');
        parent::__construct($initial_id);
    }

}

?>