<?php

$base_obj = $specific_obj = $mode = $edited = null;

function get_initial_values($object_type=null,$object_id=null) {
    require_once('class/blank.php');

    $object_type = get_form_value('object_type');
    $object_id = get_form_value('object_id');

    global $base_obj,$specific_obj,$mode,$edited;

    $base_obj = new Blank($object_type);
    $specific_obj = new Blank($object_type,(int)$object_id);

    $mode = get_form_value('mode');
    if($mode != "edit" && $mode != "new" && $mode != "delete")
        $mode = "view";

    $edited = get_form_value('edited');

    if(isset($specific_obj->id) && (int)$specific_obj->id > 0 && get_form_value('delete') === 'delete_me') {
        $specific_obj->save("DELETE");
        $specific_obj = new Blank($specific_obj->get_value("table_name"));
    }
}

function get_page_title($level1,$level2) {
    $this_title = '';
    if($level1->get_value("table_name"))
        $this_title .= ucfirst($level1->get_value("table_name"));
        
    if($level2->get_value("name"))
        $this_title .= " | " . ucfirst($level2->get_value("name"));
    if($level2->get_value("title"))
        $this_title .= " | " . ucfirst($level2->get_value("title"));
        
    return $this_title;
    
}

function get_form_value($value_name) {
    
    $value = isset($_GET[$value_name]) ? $_GET[$value_name] : null;

    if($value == null)
        $value = isset($_POST[$value_name]) ? $_POST[$value_name] : null;

    return $value;
}

function write_fk_select($field_name,$default_value=null) {
    $class_name = substr($field_name, 0, -3);
    $select_html = "<select name='" . $field_name . "' id='" . $field_name . "'>";
    require_once('class/blank.php');
    
    $all_the_things = new Blank($class_name);
    $all_the_things = $all_the_things->get_all();
    $test_cols = array("name","title","event_activities_id");
    
    foreach($all_the_things as $this_thing) {
        foreach($test_cols as $this_col) {
            if(isset($this_thing->$this_col)) {
                $select_html .= "<option value='" . $this_thing->id . "'";
                if($this_thing->id == $default_value)
                    $select_html .= " SELECTED";
                $select_html .= ">" . $this_thing->$this_col . " (" . $this_thing->id . ")</option>";
            }
        }
    }
    
    $select_html .= "</select>";
    return $select_html;
}

function write_data($base_obj,$specific_obj,$mode,$edited=null) {
    if($mode != "new" && ($specific_obj == null || !isset($specific_obj->id) || (int)$specific_obj->id <= 0)) {

    } else {
        if($mode == "edit" || $mode == "new") {
            $mode == "edit" ? $button_text = "Update" : $button_text = "Create New";
            
            if(isset($edited) && $edited == 1) {
                foreach($specific_obj as $key => $value) {
                    $tmp = get_form_value($key);
                    if($tmp != null)
                        $specific_obj->set_value($key,$tmp);
                }
                $specific_obj->save();
            }
            
            echo "<table><form method='post'>";
            echo "<input type='hidden' name='edited' value='1' />";
            echo "<input type='hidden' name='mode' value='edit' />";
            echo "<input type='hidden' name='object_type_id' value='" . $base_obj->id . "' />";
            echo "<input type='hidden' name='object_id' value='" . $specific_obj->id . "' />";
            foreach($specific_obj as $key => $value) {
                echo "<tr><td><b>" . $key . "</b></td><td>";
                if($key != "id") {
                    if(str_ends_with($key,"_id"))
                        echo write_fk_select($key,$value);
                    else
                        echo "<input type='text' value='" . $value . "' name='" . $key . "' />";
                } else
                    echo $value;
                echo "</td></tr>";
            }
    
            echo "<tr><td colspan='2'><input type='submit' value='" . $button_text . "'></td></tr>";
            echo "</form></table>";
            
            if($mode == "edit") {
                echo "<form method='post'>";
                echo "<input type='hidden' name='object_type_id' value='" . $base_obj->id . "' />";
                echo "<input type='hidden' name='object_id' value='" . $specific_obj->id . "' />";
                echo "<input type='hidden' name='delete' value='delete_me' />";
                echo "<input type='submit' value='Delete'>";
                echo "</form>";
            }
        } else {
            echo "<table>";
            foreach($specific_obj as $key => $value) {
                if(str_ends_with($key,"_id")) {
                    $value .= " (" . $specific_obj->get_fk_value($key) . ")";
                }
                echo "<tr><td><b>" . $key . "</b></td><td>" . $value . "</td></tr>";
            }
           echo "</table>";
        }
    
        echo "<br /><br /><a href = 'view.php?object_type=" . $base_obj->get_value('table_name') . "'>View All " . $base_obj->get_value('table_name') . "</a>";
    }
}

?>
