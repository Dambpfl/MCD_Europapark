<?php ob_start(); ?>


<h1>Liste des avis</h1>

   
<body>
    <div class="avis-container">
        <?php foreach ($listAvis as $avis) { ?>
            <div class="avis">           
                    <p class="visiteur"><?= $avis['nomVisiteur']; ?></p>
                    <p class="dateAvis"><?= $avis['dateAvis']; ?></p>
                    <p class="commentaire"><?= $avis['commentaire']; ?></p>
                    <p class="note"><?= $avis['note']; ?>/10</p>
            </div>
        <?php } ?>
    </div>    
</body>


<?php 
$contenu = ob_get_clean(); 
require_once "view/template.php";
?>