<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <title>lot</title>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
  <h1>Déjà clôturée</h1>

  <?php
    // Récupération de l'identifiant de la facture
    $idFacture = $_GET["idFacture"];

    // Affiche un message de confirmation
    echo "<p>La facture n°$idFacture a déjà été clôturée.</p>";
  ?>

  <p><a href="index.php?action=accueil">Retour à l'accueil</a></p>
</body>
</html>
