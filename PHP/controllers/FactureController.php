<?php

class FactureController {
    // Code pour récupérer la liste des factures depuis la base de données
    private function obtenirFacturesDepuisLaBaseDeDonnees() {
        // Connexion à la base de données
        $bdd = new PDO("mysql:host=localhost;dbname=bddcriee;charset=utf8", "root", "");

        // Récupération de la liste des factures
        $sql = "SELECT * FROM facture";
        $stmt = $bdd->prepare($sql);
        $stmt->execute();

        // Retourne les données en tant qu'objets de la classe Facture
        return $stmt->fetchAll(PDO::FETCH_CLASS, 'Facture');
    }

    // Méthode pour supprimer la facture
    private function cloturationFacture($idFacture) {
        // Connexion à la base de données
        $bdd = new PDO("mysql:host=localhost;dbname=bddcriee;charset=utf8", "root", "");
    
        // Mettre à jour le statut de la facture
        $sql = "UPDATE `facture` SET `StatusFacture` = 'Cloture' WHERE `idFacture` = ?";
        $stmt = $bdd->prepare($sql);
        $stmt->execute(array($idFacture));
    }
    

    public function listerFactures() {
        // Code pour récupérer la liste des factures depuis la base de données
        $factures = $this->obtenirFacturesDepuisLaBaseDeDonnees();

        // Instancier la vue et lui transmettre les données
        require_once 'views/v_liste-facture.php';
    }

    public function cloturerFacture($idFacture) {
        // Récupère les factures depuis la base de données
        $factures = $this->obtenirFacturesDepuisLaBaseDeDonnees();

        // Affiche les données pour le débogage
        //var_dump($factures);

        // Vérifie si l'ID de la facture est valide
        $factureTrouvee = false;
        foreach ($factures as $facture) {
            if ($facture->getIdFacture() == $idFacture) {
                $factureTrouvee = true;
                $statutFacture = strtoupper($facture->getStatusFacture());

                // Vérifie l'état de la facture
                echo "<p>Statut de la facture n°$idFacture : $statutFacture</p>";

                if ($statutFacture === "PAYER") {
                    $this->cloturationFacture($idFacture);
                    // Redirige vers la page de confirmation
                    header('Location: index.php?action=confirmation&idFacture=' . $idFacture);
                } elseif ($statutFacture === "EN COURS") {
                    // Facture en cours
                    header('Location: index.php?action=erreur&idFacture=' . $idFacture);
                } elseif ($statutFacture === "CLOTURE") {
                    header('Location: index.php?action=dejacloture&idFacture=' . $idFacture);
                } else {
                    // Statut inattendu
                    echo "<p>Erreur : Statut inattendu : $statutFacture</p>";
                }
                break; // Sort de la boucle dès qu'une facture correspond à l'ID
            }
        }

        if (!$factureTrouvee) {
            echo "<p>Erreur : ID de facture invalide : $idFacture</p>";
        }
    }
}
