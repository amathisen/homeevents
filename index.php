<?php

$page_title = 'Home';

require_once('header.php');
require_once('class/object_type.php');
require_once('class/event.php');
require_once('class/user.php');

$all_objects = new ObjectType();
$all_objects = $all_objects->get_all(sort_by:"name");
echo "<table>";

foreach($all_objects as $this_object) {
    echo "<tr><td><a href = 'view.php?object_type_id=" . $this_object->id . "'>" . $this_object->name . "</a></td><td><a href = 'view.php?mode=new&object_type_id=" . $this_object->id . "'>Add New</td></tr>";
}
echo "</table>";

$all_events = new Event();
$all_events = $all_events->get_all(sort_by:"date");
echo "<br /><hr><br /><table>";
foreach($all_events as $this_event) {
    echo "<tr><td><a href = 'event.php?event_id=" . $this_event->id . "'>" . $this_event->title . "</a></td><td>" . $this_event->date . "</td></tr>";
}
echo "</table>";

$all_users = new User();
$all_users = $all_users->get_all(sort_by:"name");
echo "<br /><hr><br /><table>";
foreach($all_users as $this_user) {
    echo "<tr><td><a href = 'user.php?user_id=" . $this_user->id . "'>" . $this_user->name . "</a></td></tr>";
}
echo "</table>";

require_once('footer.php'); ?>