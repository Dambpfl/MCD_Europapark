<?php

use Controller\EuropaparkController;

spl_autoload_register(function ($class_name) {
    include $class_name . '.php';
});

$ctrlEuropapark = new EuropaparkController();

// verifie et recupere l'id via l'url
$id = isset($_GET['id']) ? (int)$_GET['id'] : null;

// listAttractions = page de base
$action = isset($_GET['action']) ? $_GET['action'] : 'listAttractions';

switch ($action) {

    case "listAttractions" : $ctrlEuropapark->listAttractions(); break;
    case "listAvis" :  $ctrlEuropapark->listAvis($id); break;

}


?>