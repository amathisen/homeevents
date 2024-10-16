<?php

require_once('components/base_object.php');
require_once('class/blank.php');

$activity_object_id = get_form_value('activity_object_id');
$this_activity_object = new Blank("activity_object",$activity_object_id);

if(isset($this_activity_object->name))
    $page_title = $this_activity_object->name;
else
    $page_title = "???";

require_once('header.php');

if(!$this_activity_object || !isset($this_activity_object->id) || $this_activity_object->id != $activity_object_id) {
    echo "No such activity object.";
    require_once('footer.php');
    exit;
}

$event_activities_results_objects = $this_activity_object->get_referring_results('event_activities_results_objects');
$results_value_array = array();
$html_block = "<center><h1>" . $this_activity_object->name . "</h1></center><br />";

$html_block .= "<b>Games Played:</b> " . count($event_activities_results_objects) . "<br />";

foreach($event_activities_results_objects as $this_event_activities_results_object) {
    $event_activities_results = $this_event_activities_results_object->get_associated_result('event_activities_results');
    array_push($results_value_array,$event_activities_results->result_value);
}

$html_block .= "<b>Average Placement:</b> " . (array_sum($results_value_array) / count($event_activities_results_objects)) . "<br />";

echo $html_block;

require_once('footer.php'); ?>