<?php

require_once('components/base_object.php');
require_once('class/event.php');


$event_id = get_form_value('event_id');
$this_event = new Event($event_id);
$db_tmp = new Database();

if(isset($this_event->title))
    $page_title = $this_event->title . " | " . $this_event->date;
    
require_once('header.php');

if(!$this_event || !isset($this_event->id) || $this_event->id != $event_id) {
    echo "No such event";
    exit;
}

$this_location = $this_event->get_location();
$users_list = $this_event->get_users();
$event_activities_list = $this_event->get_event_activities();

echo "<center><h1>" . $this_event->title . " - " . $this_event->date . "</h1>";
echo "<h2>" . $this_location->name . "</h2><h3>";
foreach($users_list as $this_user)
    echo $this_user->name . " ";
echo "</h3></center>";

foreach($event_activities_list as $this_activity) {
    $activity = $this_activity->get_activity();
    echo $this_activity->name . ' - ' . $activity->name . "<br>";
    echo "<table border='1'>";

    foreach($users_list as $this_user) {
        $this_result = $this_activity->get_results($this_user->id);
        if(!isset($this_result->id))
            continue;
        $score_value = isset($this_result->result_value) ? $this_result->result_value : '';
        $display_name = $this_user->name;
        $results_object = $this_result->get_results_object();
        if(isset($results_object->id) && (int)$results_object->id > 0) {
            $activity_object = $results_object->get_activity_object();
            $extra_name = isset($activity_object->name) ? " (" . $activity_object->name . ")": '';
            $display_name .= $extra_name;
        }
            
        echo "<tr><td>" . $display_name . "</td><td>" . $score_value . "</td></tr>";
    }
    echo "</table><br />";
}

require_once('footer.php'); ?>