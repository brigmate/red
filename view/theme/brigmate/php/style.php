<?php

require_once('view/theme/redbasic/php/style.php');

$x = @file_get_contents('view/theme/brigmate/css/style.css');
echo str_replace(array_keys($options), array_values($options), $x);



