<?php

$page_title = 'Home';

require_once('header.php');
require_once('class/blank.php');
require_once('class/db.php');
require_once('components/base_object.php');

$db3 = new Database();
$tables = $db3->get_schema();


echo "<table>";

foreach($tables as $this_table) {
    echo "<tr><td><a href = 'view.php?object_type=" . $this_table . "'>" . $this_table . "</a></td><td><a href = 'view.php?mode=new&object_type=" . $this_table . "'>Add New</td></tr>";
}
echo "</table>";

$all_events = new Blank('event');
$all_events = $all_events->get_all(sort_by:"date");
echo "<br /><hr><br /><table>";
foreach($all_events as $this_event) {
    echo "<tr><td>" . get_href($this_event) . "</td><td>" . $this_event->date . "</td></tr>";
}
echo "</table>";

$all_users = new Blank('users');
$all_users = $all_users->get_all(sort_by:"name");
echo "<br /><hr><br /><table>";
foreach($all_users as $this_user) {
    echo "<tr><td>" . get_href($this_user) . "</td></tr>";
}
echo "</table>";

$all_activity_objects = new Blank('activity_object');
$all_activity_objects = $all_activity_objects->get_all(sort_by:"name");
echo "<br /><hr><br /><table>";
foreach($all_activity_objects as $this_activity_object) {
    echo "<tr><td>" . get_href($this_activity_object) . "</td></tr>";
}
echo "</table>";

require_once('footer.php'); ?>