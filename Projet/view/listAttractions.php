<?php ob_start(); ?>


<h1>TOUTES LES ATTRACTIONS</h1>

   
<body>
    <div class="attraction-container">
        <?php foreach ($listAttractions as $listAttraction) { ?>
            <div class="attraction">           
                <a href="index.php?action=detailsAttraction&id=<?= $listAttraction['id_attraction'] ?>">
                    <?= $listAttraction['nom']; ?></a>
                <p class="nom"><?= $listAttraction['description']; ?> (<?= $listAttraction['duree']; ?>)</p> 
            </div> 
        <?php } ?>
    </div>    
</body>


<?php 
$contenu = ob_get_clean(); 
require_once "template.php";
?>