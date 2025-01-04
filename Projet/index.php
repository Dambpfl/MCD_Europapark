<?php

use Controller\EuropaparkController;

spl_autoload_register(function ($class_name) {
    include $class_name . '.php';
});

$ctrlEuropapark = new EuropaparkController();

$id = isset($_GET['id']) ? (int)$_GET['id'] : null;

if(isset($_GET["action"])){
    switch ($_GET["action"]) {

        case "listAttractions" : $ctrlEuropapark->listAttractions(); break;
        case "listAvis" :  $ctrlEuropapark->listAvis($id); break;
    }
}

?>