<?php

require_once('class/base.php');

class ObjectType extends Base {
    public $name = null;
    public $base_table_name = null;

    public function __construct($initial_id = null) {
        $this->set_value('table_name','object_type');
        parent::__construct($initial_id);
    }

}

?>