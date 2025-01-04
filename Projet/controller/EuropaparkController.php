<?php

namespace Controller;
use Model\Connect;

class EuropaparkController {

    public function listAttractions() {

        $pdo = Connect::seConnecter();
        $requete = $pdo->query(
            "SELECT a.nom, a.description, a.capaciteMax, ROUND(a.duree/60, 2) AS dureeMin,
             a.id_attraction, c.nomCategorie, i.nomIntensite
             FROM attraction a 
             INNER JOIN categorie c ON a.id_categorie = c.id_categorie
             INNER JOIN intensite i ON a.id_intensite = i.id_intensite");
        $listAttractions = $requete->fetchAll();
        require "view/listAttractions.php";
    }

    public function listAvis($id) {

        $pdo = Connect::seConnecter();
        $requete = $pdo->prepare(
            "SELECT CONCAT(v.prenom, ' ', v.nom) AS nomVisiteur,
            a.commentaire, a.note,
            DATE_FORMAT(a.dateAvis, '%d/%m/%Y à %Hh%i') AS dateAvis,
            a2.nom
            FROM visiteur v
            INNER JOIN avis a ON v.id_visiteur = a.id_visiteur
            INNER JOIN attraction a2 ON a.id_attraction = a2.id_attraction
            WHERE a.id_attraction = :id");
        $requete->execute(["id" => $id]);
        $listAvis = $requete->fetchAll();
        require "view/listAvis.php";
    }
}