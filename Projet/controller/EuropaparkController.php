<?php

namespace Controller;
use Model\Connect;

class EuropaparkController {

    public function listAttractions() {

        $pdo = Connect::seConnecter();
        $requete = $pdo->query(
            "SELECT a.nom, a.description, a.capaciteMax, a.duree, a.id_attraction,
             c.nomCategorie
             FROM attraction a 
             INNER JOIN categorie c ON a.id_categorie = c.id_categorie");
        $listAttractions = $requete->fetchAll();
        require "view/listAttractions.php";
    }
}