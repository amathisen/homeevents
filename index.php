<?php

$page_title = 'Home';
require_once('class/db.php');
require_once('header.php');
require_once('class/object_type.php');


$all_objects = new ObjectType();
$all_objects = $all_objects->get_all();

echo "<table>";

foreach($all_objects as $this_object) {
    echo "<tr><td><a href = 'view.php?object_type_id=" . $this_object['id'] . "'>" . $this_object['name'] . "</a></td><td><a href = 'view.php?mode=new&object_type_id=" . $this_object['id'] . "'>Add New</td></tr>";
}
?>

</table>

<?php require_once('footer.php'); ?>