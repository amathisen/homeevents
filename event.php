<?php

require_once('components/base_object.php');
require_once('class/blank.php');

$event_id = get_form_value('event_id');
$this_event = new Blank("event",$event_id);

if(isset($this_event->title))
    $page_title = $this_event->title . " | " . $this_event->date;
else
    $page_title = "???";

require_once('header.php');

if(!$this_event || !isset($this_event->id) || $this_event->id != $event_id) {
    echo "No such event.";
    require_once('footer.php');
    exit;
}

$this_location = $this_event->get_associated_result('location');
$event_activities_list = $this_event->get_referring_results('event_activities');
$users_list = $this_event->get_referring_results_by_link('event_users','user');
$user_ids = array();
$missing_results = array();
echo "<center><h1>" . $this_event->title . " - " . $this_event->date . "</h1>";
echo "<h2>" . $this_location->name . "</h2><h3>";

foreach($users_list as $this_user) {
    echo get_href($this_user) . "&nbsp";
    array_push($user_ids,$this_user->id);
}
echo "</h3></center>";

foreach($event_activities_list as $this_activity) {
    $activity = $this_activity->get_associated_result('activity');
    echo $this_activity->name . ' - ' . $activity->name . "<br>";
    echo "<table border='1'>";

    foreach($users_list as $this_user) {
        $this_result = $this_activity->get_referring_results('event_activities_results',array('user_id',$this_user->id));
        if(isset($this_result[0]))
            $this_result = $this_result[0];
        if(!isset($this_result->id)) {
            array_push($missing_results,array($this_activity->id,$this_user->id));
            continue;
        }
        $score_value = isset($this_result->result_value) ? $this_result->result_value : '';
        $display_name = get_href($this_user);
        $results_object = $this_result->get_referring_results('event_activities_results_objects');
        if(isset($results_object[0]))
            $results_object = $results_object[0];
        if(isset($results_object->id) && (int)$results_object->id > 0) {
            $activity_object = new Blank('activity_object',$results_object->activity_object_id);
            $extra_name = isset($activity_object->name) ? " (" . get_href($activity_object) . ")": '';
            $display_name .= $extra_name;
        }
            
        echo "<tr><td>" . $display_name . "</td><td>" . $score_value . "</td></tr>";
    }
    echo "</table><br />";
}

echo "<br /><hr /><br />";

$other_users = new Blank('user');
if(count($users_list))
    $other_users = $other_users->get_all(limit_by:"id NOT IN (" . implode(",",$user_ids) . ")");
else
    $other_users = $other_users->get_all();

if(count($other_users)) {
    echo "<form name='event_add_user' method='POST' action='processor.php'>";
    echo "<input type='hidden' name='event_id' value='" . $this_event->id . "' />";
    echo "<input type='hidden' name='action' value='add_user_to_event' />";
    echo "<select name='user_id' id='user_id'>";
    foreach($other_users as $this_user)
        echo "<option value='" . $this_user->id . "'>" . $this_user->name . "</option>";
    echo "</select>";
    echo "&nbsp;<input type='submit' value='Add User'>";
    echo "</form><br />";
}

$activities = new Blank('activity');
$activities = $activities->get_all();
echo "<form name='event_add_activity' method='POST' action='processor.php'>";
echo "<input type='hidden' name='event_id' value='" . $this_event->id . "' />";
echo "<input type='text' name='name' id='name' />";
echo "<input type='hidden' name='action' value='add_activity_to_event' />";
echo "&nbsp;<select name='activity_id' id='activity_id'>";
foreach($activities as $this_activity)
    echo "<option value='" . $this_activity->id . "'>" . $this_activity->name . "</option>";
echo "</select>";
echo "&nbsp;<input type='submit' value='Add Event Activity'>";
echo "</form>";

echo "<br /><hr /><br />";
echo "<h3>Missing Results</h2>";
echo "Hide Mulligan<input type='checkbox' onchange='change_visibility(\"Mulligan_row\")'>";
echo "<table border='1'>";
foreach($missing_results as $this_result) {
    $this_event_activity = new Blank('event_activities',$this_result[0]);
    $this_activity = $this_event_activity->get_associated_result('activity');
    $this_activity_object_type = $this_activity->get_referring_results('activity_object_type');
    $this_user = new Blank('user',$this_result[1]);
    echo "<tr class='" . $this_activity->name . "_row'><td>" . $this_event_activity->name . "</td><td>" . $this_activity->name . "</td><td>" . $this_user->name . "</td>";
    echo "<td>";
    echo "<form name='results_form' method='POST' action='processor.php'>";
    echo "<input type='hidden' name='user_id' value='" . $this_user->id . "' />";
    echo "<input type='hidden' name='event_activities_id' value='" . $this_event_activity->id . "' />";
    echo "<input type='hidden' name='action' value='add_user_result_to_event' />";
    if(count($this_activity_object_type)) {
        $this_activity_object_type = $this_activity_object_type[0];
        $activity_objects = $this_activity_object_type->get_referring_results('activity_object');
        echo "<select name='activity_object_id'>";
        foreach($activity_objects as $this_activity_object) {
            echo "<option value='" . $this_activity_object->id . "'>" . $this_activity_object->name . "</option>";
        }
    }
    echo "<input type='text' size='5' name='result_value' />";
    echo "&nbsp;<input type='submit' value='Add Result' />";
    echo "</form>";
    echo "</td></tr>";
}
echo "</table>";

require_once('footer.php'); ?>