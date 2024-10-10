<?php

require_once('class/base.php');

class ActivityResult extends Base {
    public $name = null;
    public $highest_wins = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','activity_result');
        parent::__construct($initial_id);
    }

}

?>