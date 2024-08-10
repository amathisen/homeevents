<?php

$base_obj = $specific_obj = $mode = null;

function get_initial_values($object_type_id=null,$object_id=null) {
    require_once('class/db.php');
    require_once('class/object_type.php');

    if($object_type_id == null) {
        $object_type_id = (isset($_GET['object_type_id']) && (int)$_GET['object_type_id'] > 0) ? $_GET['object_type_id']: null;
        if($object_type_id == null)
            $object_type_id = (isset($_POST['object_type_id']) && (int)$_POST['object_type_id'] > 0) ? $_POST['object_type_id']: null;
    }
    if($object_id == null) {
        $object_id = (isset($_GET['object_id']) && (int)$_GET['object_type_id'] > 0) ? $_GET['object_id']: null;
        if($object_id == null)
            $object_id = (isset($_POST['object_id']) && (int)$_POST['object_id'] > 0) ? $_POST['object_id']: null;
    }
    $db = new Database();

    if($object_type_id == null) {
        $object_type_id = $db->get_single_value('object_type','id','base_table_name','object_type');
    }

    global $base_obj,$specific_obj,$mode;

    $base_obj = new ObjectType($object_type_id);

    $mode = isset($_GET['mode']) ? $_GET['mode'] : null;
    if($mode == null)
        $mode = isset($_POST['mode']) ? $_POST['mode'] : null;
    if($mode != "edit")
        $mode = "view";

    if($object_id != null) {
        if(file_exists('class/' . $base_obj->base_table_name . '.php'))
            require_once('class/' . $base_obj->base_table_name . '.php');
        $class_name = $base_obj->table_name_to_class($base_obj->base_table_name);
        if(class_exists($class_name))
            $specific_obj = new $class_name($object_id);

    }

    $db->close();
}

function get_page_title($level1,$level2) {
    $this_title = '';
    if(isset($level1->name))
        $this_title .= $level1->name;
        
    if(isset($level2->name))
        $this_title .= " | " . $level2->name;
    if(isset($level2->title))
        $this_title .= " | " . $level2->title;
        
    return $this_title;
    
}

function write_data($base_obj,$specific_obj,$mode) {

    if($specific_obj == null) {
        require_once('class/base.php');
        $all_the_things = new Base();
        $all_the_things->set_value("table_name",$base_obj->base_table_name);
        $all_the_things = $all_the_things->get_all();
        
        
        echo "<table>";
        foreach($all_the_things as $this_thing) {
            echo "<tr>";
            echo "<td><a href = 'view.php?object_type_id=" . $base_obj->id . "&object_id=" . $this_thing['id'] . "&mode=edit'>Edit</a></td>";
            foreach($this_thing as $key => $value)
                echo "<td><b>" . $key . "</b></td><td>" . $value . "</td>";
            echo "<tr>";
        }
        echo "</table>";
    } else {
        if($mode == "edit") {
            echo "<table><form method='post'>";
            echo "<input type='hidden' name='edited' value='1' />";
            echo "<input type='hidden' name='mode' value='edit' />";
            echo "<input type='hidden' name='object_type_id' value='" . $base_obj->id . "' />";
            echo "<input type='hidden' name='object_id' value='" . $specific_obj->id . "' />";
            foreach($specific_obj as $key => $value) {
                echo "<tr><td><b>" . $key . "</b></td><td>";
                if($key != "id")
                    echo "<input type='text' value='" . $value . "' name='" . $key . "' />";
                else
                    echo $value;
                echo "</td></tr>";
            }
    
            echo "<tr><td colspan='2'><input type='submit' value='Update'></td></tr>";
            echo "</form><tr><td colspan='2'><a href = 'view.php?object_type_id=" . $base_obj->id;
            if(isset($specific_obj->id))
                echo "&object_id=" . $specific_obj->id;
            echo "&mode=view'>View</a></td></tr></table>";
        } else {
            echo "<table>";
            foreach($specific_obj as $key => $value) {
                echo "<tr><td><b>" . $key . "</b></td><td>" . $value . "</td></tr>";
            }
            echo "<tr><td colspan='2'><a href = 'view.php?object_type_id=" . $base_obj->id;
            if(isset($specific_obj->id))
                echo "&object_id=" . $specific_obj->id;
            echo "&mode=edit'>Edit</a></td></tr></table>";
        }
    
        echo "<br /><br /><a href = 'view.php?object_type_id=" . $base_obj->id . "'>View All " . $base_obj->name . "</a>";
    }
}

?>
