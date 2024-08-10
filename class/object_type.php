<?php

require_once('base.php');

class ObjectType extends Base {
    public $name = null;
    public $base_table_name = null;

    public function __construct($initial_id = null) {
        $this->set_table_name('object_type');
        parent::__construct($initial_id);
    }

}

?>