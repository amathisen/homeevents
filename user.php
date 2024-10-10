<?php

require_once('components/base_object.php');
require_once('class/user.php');

$user_id = get_form_value('user_id');
$this_user = new User($user_id);

if(isset($this_user->name))
    $page_title = "User " . $this_user->name;
else
    $page_title = "User ??";

require_once('header.php');

if(!$this_user || !isset($this_user->id) || $this_user->id != $user_id) {
    echo "No such user.";
    require_once('footer.php');
    exit;
}

$event_list = $this_user->get_referring_results('event_users');
$events = array();
foreach($event_list as $this_event) {
    $tmp_event = $this_event->get_associated_result('event');
    array_push($events,$tmp_event);
}

echo "<center><h1>" . $this_user->name . "</h1></center>";
echo "<table name='user_events_table'>";
foreach($events as $this_event) {
    echo "<tr><td><a href = 'event.php?event_id=" . $this_event->id . "'>" . $this_event->title . "</a></td><td>" . $this_event->date . "</td></tr>";
}
echo "</table>";
require_once('footer.php'); ?>