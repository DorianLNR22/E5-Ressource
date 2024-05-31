<?php

class Facture {
    private $idFacture;
    private $montantFacture;
    private $statusFacture;  // Ajout de cette ligne

    public function __construct() {
        // Initialise la propriété statusFacture avec la valeur de StatusFacture
        $this->statusFacture = $this->StatusFacture;
    }

    public function getIdFacture() {
        return $this->idFacture;
    }

    public function getMontantFacture() {
        return $this->montantFacture;
    }

    public function getStatusFacture() {
        return $this->statusFacture;
    }

    // ... (autres méthodes)
}
