<?php

require_once('components/base_object.php');
require_once('class/blank.php');

get_initial_values();

$page_title = 'View ' . get_page_title($base_obj,$specific_obj);
require_once('header.php');


if($specific_obj->id  == 0 && $mode != "new") {
    $all_objects = $base_obj->get_all();
    $db2 = new Database();
    $table_data = $db2->get_schema($base_obj->get_value('table_name'));
    echo "<table>";

    foreach($all_objects as $this_object) {
        echo "<tr>";
        echo "<td><a href = 'view.php?object_type=" . $this_object->get_value('table_name') . "&object_id=" . $this_object->id . "&mode=edit'>Edit</a></td>";
        echo "<td><a href = 'view.php?object_type=" . $this_object->get_value('table_name') . "&object_id=" . $this_object->id . "&mode=view'>View</a></td>";
        foreach($table_data as $this_field) {
            $new_html = $this_object->write_form_field($this_field['Field']);
            echo "<td>" . $new_html[0] . "</td><td>" . $new_html[1] . "</td>";
        }
        echo "</tr>";
    }
    echo "</table><a href = 'view.php?mode=new&object_type=" . $base_obj->get_value('table_name') . "'>Add New</a>";
} else {
    write_data($base_obj,$specific_obj,$mode,$edited);
}

require_once('footer.php'); ?>