<?php

require_once('components/base_object.php');
require_once('class/blank.php');

$user_id = get_form_value('user_id');
$this_user = new Blank("user",$user_id);

isset($this_user->name) ? $page_title = "User " . $this_user->name : $page_title = "User ??";
require_once('header.php');

if(!$this_user || !isset($this_user->id) || $this_user->id != $user_id) {
    echo "No such user.";
    require_once('footer.php');
    exit;
}

echo "<center><h1>" . $this_user->name . "</h1></center>";

$events = $this_user->get_referring_results_by_link('event_users','event');
$event_html = array();
$stats_html = array();
$results_tracker = array();
$results_objects_tracker = array();
array_push($stats_html,"<b>Events Attended:</b> " . count($events) . "<br /><br />");

foreach($events as $this_event) {
    $loopcount = 0;
    $this_html = "<table name='user_events_table_" . $this_event->id . "' border='1'>";
    $this_html .= "<tr><td>" . get_href($this_event) . "</td><td>" . $this_event->date . "</td></tr>";
    $event_activities = $this_event->get_referring_results('event_activities');
    foreach($event_activities as $this_activity) {
        ($loopcount % 2) ? $bgcolor = "82CFDF" : $bgcolor = "FFFFFF";
        $activity = $this_activity->get_associated_result('activity');
        $result = $this_activity->get_referring_results('event_activities_results',array('user_id',$this_user->id));
        if(isset($result[0]->result_value)) {
            $result_value = $result[0]->result_value;
            $results_object = $result[0]->get_referring_results_by_link('event_activities_results_objects','activity_object');
            if(isset($results_object[0]->name)) {
                $results_object_name = get_href($results_object[0]);
                if(!isset($results_objects_tracker["activity_object_" . $results_object[0]->id])) {
                    $results_objects_tracker["activity_object_" . $results_object[0]->id] = array();
                    array_push($results_objects_tracker["activity_object_" . $results_object[0]->id],get_href($results_object[0]));
                    array_push($results_objects_tracker["activity_object_" . $results_object[0]->id],-1);
                }
                array_push($results_objects_tracker["activity_object_" . $results_object[0]->id],$result_value);
            } else
                $results_object_name = null;
            if(!isset($results_tracker["activity_" . $activity->id])) {
                $results_tracker["activity_" . $activity->id] = array();
                array_push($results_tracker["activity_" . $activity->id],$activity->name);
                array_push($results_tracker["activity_" . $activity->id],$activity->id);
            }
            array_push($results_tracker["activity_" . $activity->id],$result_value);
        } else {
            $result_value = "--";
            $results_object_name = null;
        }
        $this_html .=  "<tr style='background-color: " . $bgcolor . ";'><td>" . $this_activity->name . "</td><td>" . $activity->name . "</td><td>" . $result_value . "</td></tr>";
        if($results_object_name != null)
            $this_html .=  "<tr style='background-color: " . $bgcolor . ";'><td>&nbsp;</td><td>" . $results_object_name . "</td></tr>";
        $loopcount++;
    }
    $this_html .=  "</table><br /><br />";
    array_push($event_html,$this_html);
}

foreach(array($results_tracker,$results_objects_tracker) as $results) {
    foreach($results as $this_results_set) {
        $this_activity_name = array_shift($this_results_set);
        $this_activity_id = array_shift($this_results_set);
        $this_results_html = "<b>" . $this_activity_name . ":</b><br />";
        switch($this_activity_id) {
            case GOFIRSTDICEID:
            case GOFIRSTDICEREROLLID:
                $this_results_html .= "&nbsp;&nbsp;Times rolled: " . count($this_results_set) . "<br />";
                $this_results_html .= "&nbsp;&nbsp;Average Roll: " . (array_sum($this_results_set) / count($this_results_set)) . "<br />";
            break;
            case MULLIGANID:
                $this_results_html .= "&nbsp;&nbsp;Times mulliganed: " . array_sum($this_results_set) . "<br />";
            break;
            case MTGCOMMANDERID:
            case ACTIVITYOBJECTID:
                $this_results_html .= "&nbsp;&nbsp;Games Played: " . count($this_results_set) . "<br />";
                $this_results_html .= "&nbsp;&nbsp;Average Placement: " . (array_sum($this_results_set) / count($this_results_set)) . "<br />";
            break;
            default:
        }
        array_push($stats_html,$this_results_html . "<br />");
    }
    array_push($stats_html,"<hr /><br />");
}

foreach(array($stats_html,$event_html) as $html_block) {
    foreach($html_block as $this_html) {
        echo $this_html;
    }
}

require_once('footer.php'); ?>