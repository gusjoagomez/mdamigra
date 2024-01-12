<?php

$OWNER = 1;
require_once './lib/migrarlib.php';
$start = microtime(true);

$tasks = array();

mb_internal_encoding('UTF-8');
mb_http_output('UTF-8');

echo "\n migrando datos... \n"; 
require_once './migrar_001_cargos.php';


$end = microtime(true);
$seconds = secondsToTime($end - $start);
echo "\n\n\n Time elapsed: {$seconds} seconds. \n\n";
die("*** FIN ***");
////------------------------------------------------------------------------


