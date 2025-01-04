<?php ob_start(); ?>


<h1>Liste des attractions</h1>

   
<body>
    <div class="attraction-container">
        <?php foreach ($listAttractions as $listAttraction) { ?>
            <div class="attraction">           
                <a href="index.php?action=listAvis&id=<?= $listAttraction['id_attraction'] ?>">
                    <p class="nom"><?= $listAttraction['nom']; ?></p>
                    <p class="duree">Durée : <?= $listAttraction['dureeMin']; ?> min</p>
                    <p class="capacite">Capacité : <?= $listAttraction['capaciteMax']; ?> personnes</p>
                    <p class="intensite">Intensité : <?= $listAttraction['nomIntensite']; ?></p>
                    <p class="categorie">Catégorie : <?= $listAttraction['nomCategorie']; ?></p>
                    <p class="nom"><?= $listAttraction['description']; ?></p>
                </a>
            </div>
        <?php } ?>
    </div>    
</body>


<?php 
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>