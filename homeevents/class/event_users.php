<?php

require_once('base.php');

class EventUser extends Base {
    public $event_id = null;
    public $user_id = null;

    public function __construct($initial_id = null) {
        $this->set_table_name('event_users');
        parent::__construct($initial_id);
    }

}

?>