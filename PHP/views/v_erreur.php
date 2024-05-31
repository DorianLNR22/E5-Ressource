<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>lot</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <h1>Erreur</h1>

    <?php
        if (isset($_GET["erreur"])) {
            $erreur = $_GET["erreur"];

            // Affiche un message d'erreur spécifique
            if ($erreur == 1) {
                echo "<p>La facture n'est pas payée.</p>";
            } else {
                echo "<p>Une erreur s'est produite.</p>";
            }
        }
    ?>
<p>La facture n'est pas payée</p>
<p><a href="index.php?action=accueil">Retour à l'accueil</a></p>
</body>
</html>