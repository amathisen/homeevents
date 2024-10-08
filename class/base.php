<?php

class Base {
    public $id = null;
    private $table_name = null;

    // Constructor to create the activity. Pass in an ID to populate values for that activity
    public function __construct($initial_id = null) {
            $this->id = (int)$initial_id;
            $this->set_values_by_id((int)$initial_id);
    }
    
    //Pass in an activity ID to populate values for this object with that activity
    public function set_values_by_id($base_id) {
        require_once('class/db.php');
        $db = new Database();

        if($base_id == null || !is_int($base_id) || (int)$base_id < 0)
            return false;

        $db_obj = $db->get_first_result("SELECT * FROM " . $this->table_name . " WHERE id = " . (int)$base_id);

        if(isset($db_obj['id']) && (int)$db_obj['id'] === $base_id) {
            foreach($db_obj as $key => $value) {
                $this->$key = $value;
            }
            $db->close();
            return true;
        } else
            $this->id = null;
        
        $db->close();
        return false;
    }

    public function get_value($val_name) {
        if(isset($this->$val_name))
            return $this->$val_name;
    
        return false;
    }
    
    public function get_all($sort_by=NULL) {
        if($this->table_name == null)
            return false;

        $all_objects = array();
        require_once('class/db.php');
        $db = new Database();
        $sql_to_run = "SELECT id FROM " . $this->table_name;
        
        if($sort_by != NULL)
            $sql_to_run .= " ORDER BY " . $sort_by;
        $all_the_objects = $db->runSQL($sql_to_run);

        foreach($all_the_objects as $this_object) {
            $class_name = $this::class;
            $tmp = new $class_name($this_object['id']);
            if($tmp->id == $this_object['id'])  {
                array_push($all_objects,$tmp);
            }
        }
        
        $db->close();
        return $all_objects;
        
    }
    
    public function set_value($val_name,$val_value) {
            $this->$val_name = $val_value;
    }
    
    public function add_note($note_text,$date_override=null) {
        require_once('class/db.php');
        $db = new Database();
        $user_id = 1;
        $object_type_id = $db->get_single_value('object_type','id','base_table_name',$this->table_name);
        $db->write_note($user_id,$object_type_id,$this->id,$note_text,$date_override);
        $db->close();
        
    }
    
    public function table_name_to_class($base_name=null) {
        if($base_name == null)
            $base_name = $this->table_name;
            
        return preg_replace_callback('/_(.)/', function($matches) {
            return strtoupper($matches[1]);
        }, $base_name);
    }
    
    public function get_fk_value($base_value) {
        $tmp = $this->get_value($base_value);
        if(!str_ends_with($base_value,"_id") || !$tmp)
            return false;
        
        $db2 = new Database();
        $tmp_value = null;
        $test_cols = array("name","title");
        
        foreach($test_cols as $this_column) {
            $tmp_value = $db2->get_single_value(substr($base_value, 0, -3),$this_column,'id',$tmp);
            if($tmp_value != null)
                break;
        }
        
        $db2->close();

        return $tmp_value;
        
    }
    
    public function save($delete=false) {

        require_once('class/db.php');
        $db = new Database();
        $table_data = $db->get_schema($this->table_name);
        
        if(!$table_data)
            return false;

        if($delete === "DELETE" && (int)$this->id > 0) {
            $db->runSQL("DELETE FROM `" . $this->table_name . "` WHERE id = " . (int)$this->id);
            $db->close();
            return true;
        }

        $upd_sql = "UPDATE `" . $this->table_name . "` SET ";
        $insert_sql = "INSERT INTO `" . $this->table_name . "` (";
        $col_value = array();
        $cols_array = array();
        $vals_array = array();
        
        foreach($table_data as $this_column) {
            if($this_column['Field'] == 'id') continue;
            $tmp = $this->get_value($this_column['Field']);
            if($this_column['Field'] == 'date' && !$tmp) continue;
            $upd_statement = $this_column['Field'] . ' = "' . $tmp . '"';
            array_push($col_value,$upd_statement);
            array_push($cols_array,$this_column['Field']);
            array_push($vals_array,'"' . $tmp . '"');
        }

        $upd_sql .= implode(",",$col_value);
        $upd_sql .= " WHERE id = " . (int)$this->id;
        
        $insert_sql .= implode(",",$cols_array) . ") VALUES(" . implode(",",$vals_array) . ")";
        
        if($this->id == null || !is_int((int)$this->id) || $this->id < 0 || $this->table_name == null) {
            $db->runSQL($insert_sql);
            $this->id = $db->get_last_insert_id();
        } else
            $db->runSQL($upd_sql);
        $db->close();
    }
    
    public function get_associated_result($base_fk_field) {
        $base_field_name = $base_fk_field . '_id';
        if(!(int)$this->$base_field_name > 0)
            return null;

        require_once('class/db.php');
        require_once('class/object_type.php');
        $db2 = new Database();
        $class_name = str_replace(" ","",$db2->get_single_value('object_type','name','base_table_name',$base_fk_field));

        require_once('class/' . $base_fk_field . '.php');
        $associated_result = new $class_name($this->$base_field_name);
        
        return $associated_result;
    }

    public function get_referring_results($base_parent,$second_test=null) {
        if(!(int)$this->id > 0)
            return null;

        require_once('class/db.php');
        require_once('class/' . $base_parent . '.php');

        $results_array = array();
        $db2 = new Database();
        $sql_to_run = "SELECT id FROM " . $base_parent . " WHERE " . $this->table_name . "_id = " . $this->id;
        if($second_test != null && is_array($second_test) && count($second_test) == 2)
            $sql_to_run .= " AND " . $second_test[0] . " = '" . $second_test[1] . "'";
        $results_list = $db2->runSQL($sql_to_run);
        $class_name = str_replace(" ","",$db2->get_single_value('object_type','name','base_table_name',$base_parent));

        foreach($results_list as $this_result) {
            if(!(int)$this_result['id'] > 0)
                continue;
            $tmp_result = new $class_name($this_result['id']);
            array_push($results_array,$tmp_result);
        }
        
        return $results_array;
    }
    
    public function get_referring_results_by_link($base_parent,$link_table,$second_test=null) {
        $link_list = $this->get_referring_results($base_parent,$second_test);
        $results_list = array();
        foreach($link_list as $this_obj) {
            $tmp_obj = $this_obj->get_associated_result($link_table);
            array_push($results_list,$tmp_obj);
        }
        
        return $results_list;
    }
}

?>