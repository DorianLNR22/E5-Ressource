<?php

// Inclure les classes et initialisations nécessaires
require_once 'models/Facture.php';
require_once 'controllers/FactureController.php';

// Instancier le contrôleur approprié en fonction de l'action demandée
if (isset($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = 'accueil';
}

$factureController = new FactureController();

// Gérer les différentes actions
switch ($action) {
    case 'accueil':
        require_once 'views/v_accueil.php';
        break;
    case 'listeFactures':
        $factureController->listerFactures();
        break;
    case 'cloturerFacture':
        if (isset($_GET['idFacture'])) {
            $factureController->cloturerFacture($_GET['idFacture']);
        }
        break;
    case 'confirmation':
        require_once 'views/v_confirmation.php';
        break;
    case 'erreur':
        require_once 'views/v_erreur.php';
        break;
    case 'dejacloture':
        require_once 'views/v_dejacloture.php';
        break;
    default:
        echo "Action non reconnue.";
}

?>