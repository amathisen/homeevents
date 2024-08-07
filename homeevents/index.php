<?php

$page_title = 'Home';
require_once('class/db.php');
require_once('header.php');
require_once('class/user.php');


$tmp = new User(2);
print_r($tmp);
echo '<br>';
//$tmp->add_note('hi');
?>


<?php require_once('footer.php'); ?>