<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>lot</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
  <h1>Clôture de vente</h1>

  <?php foreach ($factures as $facture) : ?>
    <p><b>Facture n°<?php echo $facture->getIdFacture(); ?>:</b> <?php echo $facture->getStatusFacture(); ?></p>
    <a href="index.php?action=cloturerFacture&idFacture=<?php echo $facture->getIdFacture(); ?>">Clôturer</a>
  <?php endforeach; ?>
</body>
</html>
