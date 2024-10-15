<?php

$page_title = 'Home';

require_once('header.php');
require_once('class/blank.php');
require_once('class/db.php');

$testObj = new Blank('user',9);
$testAssoc = $testObj->get_referring_results_by_link('event_users','event');
print_r($testObj);
echo "<br>";
print_r($testAssoc);
echo "<br>";
$db3 = new Database();
$tables = $db3->get_schema();

echo "<br /><hr><br /><table>";
echo "<table>";

foreach($tables as $this_table) {
    echo "<tr><td><a href = 'view.php?object_type=" . $this_table . "'>" . $this_table . "</a></td><td><a href = 'view.php?mode=new&object_type=" . $this_table . "'>Add New</td></tr>";
}
echo "</table>";

$all_events = new Blank('event');
$all_events = $all_events->get_all(sort_by:"date");
echo "<br /><hr><br /><table>";
foreach($all_events as $this_event) {
    echo "<tr><td><a href = 'event.php?event_id=" . $this_event->id . "'>" . $this_event->title . "</a></td><td>" . $this_event->date . "</td></tr>";
}
echo "</table>";

$all_users = new Blank('user');
$all_users = $all_users->get_all(sort_by:"name");
echo "<br /><hr><br /><table>";
foreach($all_users as $this_user) {
    echo "<tr><td><a href = 'user.php?user_id=" . $this_user->id . "'>" . $this_user->name . "</a></td></tr>";
}
echo "</table>";

require_once('footer.php'); ?>