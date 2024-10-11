<?php

require_once('components/base_object.php');
require_once('class/user.php');

$user_id = get_form_value('user_id');
$this_user = new User($user_id);

isset($this_user->name) ? $page_title = "User " . $this_user->name : $page_title = "User ??";
require_once('header.php');

if(!$this_user || !isset($this_user->id) || $this_user->id != $user_id) {
    echo "No such user.";
    require_once('footer.php');
    exit;
}

echo "<center><h1>" . $this_user->name . "</h1></center>";

$events = $this_user->get_referring_results_by_link('event_users','event');
foreach($events as $this_event) {
    $loopcount = 0;
    echo "<table name='user_events_table_" . $this_event->id . "' border='1'>";
    echo "<tr><td><a href = 'event.php?event_id=" . $this_event->id . "'>" . $this_event->title . "</a></td><td>" . $this_event->date . "</td></tr>";
    $event_activities = $this_event->get_referring_results('event_activities');
    foreach($event_activities as $this_activity) {
        ($loopcount % 2) ? $bgcolor = "82CFDF" : $bgcolor = "FFFFFF";
        $activity = $this_activity->get_associated_result('activity');
        $result = $this_activity->get_referring_results('event_activities_results',array('user_id',$this_user->id));
        if(isset($result[0]->result_value)) {
            $result_value = $result[0]->result_value;
            $results_object = $result[0]->get_referring_results_by_link('event_activities_results_objects','activity_object');
            isset($results_object[0]->name) ? $results_object_name = $results_object[0]->name : $results_object_name = null;
        } else {
            $result_value = "--";
            $results_object_name = null;
        }
        echo "<tr style='background-color: " . $bgcolor . ";'><td>" . $this_activity->name . "</td><td>" . $activity->name . "</td><td>" . $result_value . "</td></tr>";
        if($results_object_name != null)
            echo "<tr style='background-color: " . $bgcolor . ";'><td>&nbsp;</td><td>" . $results_object_name . "</td></tr>";
        $loopcount++;
    }
    echo "</table><br /><br />";
}

require_once('footer.php'); ?>