<?php ob_start(); ?>


<h1>Liste des avis</h1>

   
<body>
    <div class="avis-container">
        <?php foreach ($listAvis as $avis) { ?>
            <div class="avis">           
                    <p class="visiteur"><?= $avis['nomVisiteur']; ?></p>
                    <p class="visiteur"><?= $avis['commentaire']; ?></p>
                    <p class="visiteur"><?= $avis['note']; ?>/10</p>
                    <p class="visiteur"><?= $avis['dateAvis']; ?></p>

            </div>
        <?php } ?>
    </div>    
</body>


<?php 
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>