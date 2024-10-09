<?php

require_once('components/base_object.php');
require_once('class/event.php');
require_once('class/location.php');
require_once('class/event_activities_results.php');

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

$this_location = new Location($this_event->location_id);
$users_list = $this_event->get_users();
$event_activities_list = $this_event->get_event_activities();

echo "<center><h1>" . $this_event->title . " - " . $this_event->date . "</h1>";
echo "<h2>" . $this_location->name . "</h2><h3>";
foreach($users_list as $this_user)
    echo $this_user['name'] . " ";
echo "</h3></center>";

foreach($event_activities_list as $this_activity) {
    $activity_name = $db_tmp->get_single_value('activity','name','id',$this_activity['activity_id']);
    echo $this_activity['name'] . ' - ' . $activity_name . "<br>";
    echo "<table border='1'>";
    $activity_object_type_id = $db_tmp->get_single_value('activity_object_type','id','activity_id',$this_activity['activity_id']);

    foreach($users_list as $this_user) {
        $tmp_sql = "SELECT id,result_value FROM event_activities_results WHERE event_activities_id = " . $this_activity['id'] . " AND user_id = " . $this_user['id'];
        $score = $db_tmp->get_first_result($tmp_sql);
        $score_value = isset($score['result_value']) ? $score['result_value'] : '';
        $display_name = $this_user['name'];
        if((int)$activity_object_type_id > 0) {
            $tmp_sql = "SELECT ao.name FROM event_activities_results_objects aro INNER JOIN activity_object ao ON aro.activity_object_id = ao.id WHERE aro.event_activities_results_id = " . $score['id'];
            $extra_name = $db_tmp->get_first_result($tmp_sql);
            $extra_name = isset($extra_name['name']) ? " (" . $extra_name['name'] . ")": '';
            $display_name .= $extra_name;
        }
            
        echo "<tr><td>" . $display_name . "</td><td>" . $score_value . "</td></tr>";
    }
    echo "</table><br />";
}

?>

<?php require_once('footer.php'); ?>