-- afficher la liste des attractions d'Europa Park (nom attraction, durée, intensité, catégorie, capacité maximum, description)
SELECT a.nom, a.description, a.capaciteMax, a.duree,
c.nomCategorie
FROM attraction a 
INNER JOIN categorie c ON a.id_categorie = c.id_categorie

-- afficher la liste des avis : visiteur, attraction, date/heure, commentaire et note
SELECT CONCAT(v.prenom, ' ', v.nom),
a.commentaire, a.note, a.dateAvis,
a2.nom
FROM visiteur v
INNER JOIN avis a ON v.id_visiteur = a.id_visiteur
INNER JOIN attraction a2 ON a.id_attraction = a2.id_attraction