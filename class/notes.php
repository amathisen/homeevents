<?php

require_once('class/base.php');

class Note extends Base {
    public $user_id = null;
    public $date = null;
    public $object_type_id = null;
    public $object_id = null;
    public $note_text = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','notes');
        parent::__construct($initial_id);
    }

}

?>