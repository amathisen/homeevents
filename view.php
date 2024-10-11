<?php

require_once('components/base_object.php');

get_initial_values();

$page_title = 'View ' . get_page_title($base_obj,$specific_obj);
require_once('header.php');

if(!isset($specific_obj->id)) {
    echo "No things yet :(";
    require_once('footer.php');
    exit;
}

if($specific_obj->id  == 0 && $mode != "new") {
    $db2 = new Database();
    $class_name = str_replace(" ","",$base_obj->name);
    require_once('class/' . $base_obj->base_table_name . '.php');
    $base_class = new $class_name();
    $table_data = $db2->get_schema($base_class->get_value('table_name'));
    $all_objects = $base_class->get_all();
    echo "<table>";

    foreach($all_objects as $this_object) {
        echo "<tr>";
        echo "<td><a href = 'view.php?object_type_id=" . $base_obj->id . "&object_id=" . $this_object->id . "&mode=edit'>Edit</a></td>";
        echo "<td><a href = 'view.php?object_type_id=" . $base_obj->id . "&object_id=" . $this_object->id . "&mode=view'>View</a></td>";
        foreach($table_data as $this_field) {
            $new_html = $this_object->write_form_field($this_field['Field']);
            echo "<td>" . $new_html[0] . "</td><td>" . $new_html[1] . "</td>";
        }
        echo "</tr>";
    }
    echo "</table><a href = 'view.php?mode=new&object_type_id=" . $base_obj->id . "'>Add New</a>";
} else {
    write_data($base_obj,$specific_obj,$mode,$edited);
}

?>

<?php require_once('footer.php'); ?>