<?php

require_once('components/base_object.php');

get_initial_values();

$page_title = 'View ' . get_page_title($base_obj,$specific_obj);
require_once('header.php');

write_data($base_obj,$specific_obj,$mode);

?>

<?php require_once('footer.php'); ?>