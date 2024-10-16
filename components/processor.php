<?php

global $process_data;

$process_data = array();
$process_data['requestor'] = explode("/",substr(parse_url($_SERVER['HTTP_REFERER'], PHP_URL_PATH),1));
$next_page = $_SERVER['HTTP_REFERER'];
$form_data = array();
$form_data_old = array();
foreach($_POST as $key=>$value)
    $form_data[$key] = $value;
foreach($_GET as $key=>$value)
    $form_data[$key] = $value;
$process_data['form_data_new'] = $form_data;
    
$from_string = explode("&",parse_url($_SERVER['HTTP_REFERER'], PHP_URL_QUERY));

foreach($from_string as $this_form_field) {
    $tmp = explode("=",$this_form_field);
    $form_data_old[$tmp[0]] = $tmp[1];
}
$process_data['form_data_old'] = $form_data_old;

if(isset($process_data['form_data_new']['action'])) {
    //echo $_SERVER['SCRIPT_NAME'];
    $docRoot = str_replace($_SERVER['SCRIPT_NAME'], '', __FILE__);
    echo __FILE__;
    require_once('/homeevents/class/blank.php');
    
    switch($process_data['form_data_new']['action']) {
        case 'add_user_to_event':
            $event_user = new Blank('event_users');
            $event_user->event_id = $process_data['form_data_new']['event_id'];
            $event_user->user_id = $process_data['form_data_new']['user_id'];
            $event_user->save();
        break;
        default:
    }
}

echo '<meta http-equiv="Refresh" content="0; url=\'' . $next_page . '\'" />';

?>