package Projet;

import java.sql.*;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

public class Saisiepoids extends JFrame {
    private Connection conn;
    private int idLot; // ID du lot sélectionné sur la première page
    private List<JTextField> weightFields; // Liste des champs de texte pour saisir les poids des bacs

    public Saisiepoids(Connection conn, int idLot) {
        this.conn = conn;
        this.idLot = idLot;
        this.weightFields = new ArrayList<>();

        // Configuration de la fenêtre
        setTitle("Saisie des poids des bacs");
        setSize(400, 300);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        // Créer un panneau pour les champs de texte
        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(0, 2)); // Organiser les composants en deux colonnes

        // Récupérer les bacs compris dans le lot sélectionné
        try {
            Statement stmt = conn.createStatement();
            // Requête SQL pour récupérer les bacs dans le lot sélectionné
            ResultSet rs = stmt.executeQuery("SELECT DISTINCT idBac, nomLot FROM lot WHERE idLot = " + idLot);

            // Créer une ligne par bac avec un champ de texte pour saisir le poids
            int bacNumber = 1;
            while (rs.next()) {
                int idBac = rs.getInt("idBac");

                // Ajouter un label et un champ de texte pour chaque bac
                JLabel label = new JLabel("Bac " + bacNumber + ":");
                JTextField textField = new JTextField(10);
                weightFields.add(textField); // Ajouter le champ de texte à la liste

                panel.add(label);
                panel.add(textField);
                bacNumber++;
            }

            // Fermer les ressources
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Ajouter un bouton de soumission
        JButton submitButton = new JButton("Soumettre");
        submitButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                handleSubmit();
            }
        });
        panel.add(submitButton);

        // Ajouter le panneau à la fenêtre
        add(panel, BorderLayout.CENTER);
    }

    private void handleSubmit() {
        // Récupérer les poids saisis et enregistrer les données dans la base de données
        List<Integer> missingWeights = new ArrayList<>(); // Liste pour stocker les numéros de bac avec des poids manquants

        // Vérifier les champs de texte
        for (int i = 0; i < weightFields.size(); i++) {
            JTextField textField = weightFields.get(i);
            String weightText = textField.getText().trim();

            // Vérifier si le champ de texte est vide
            if (weightText.isEmpty()) {
                // Ajouter le numéro de bac à la liste des poids manquants
                missingWeights.add(i + 1); // Numéro de bac (1-indexed)
            }
        }

        // Vérifier s'il y a des poids manquants
        if (!missingWeights.isEmpty()) {
            // Construire un message d'erreur spécifiant les bacs avec des poids manquants
            StringBuilder errorMessage = new StringBuilder("Le/les poids n'a/n'ont pas été saisis pour le/less bac(s) suivant(s) : ");
            for (Integer bacNumber : missingWeights) {
                errorMessage.append("Bac ").append(bacNumber).append(", ");
            }

            // Supprimer la dernière virgule et l'espace
            errorMessage.setLength(errorMessage.length() - 2);

            // Afficher le message d'erreur
            JOptionPane.showMessageDialog(this, errorMessage.toString(), "Erreur", JOptionPane.ERROR_MESSAGE);

            // Arrêter le processus de soumission
            return;
        }

        // Aucun poids manquant, continuer avec la soumission
        try {
            Statement stmt = conn.createStatement();

            // Enregistrer les poids saisis dans la base de données
            for (int i = 0; i < weightFields.size(); i++) {
                JTextField textField = weightFields.get(i);
                double weight = Double.parseDouble(textField.getText());

                // Requête SQL pour mettre à jour le poids du bac dans le lot
                stmt.executeUpdate("UPDATE lot SET poidsBrutLot = " + weight +
                                   " WHERE idLot = " + idLot + " AND idBac = " + (i + 1));
            }

            // Fermer la déclaration
            stmt.close();

            // Afficher un message de succès
            JOptionPane.showMessageDialog(this, "Les poids ont été enregistrés avec succès.");
            dispose(); // Fermer la fenêtre
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(this, "Erreur lors de l'enregistrement des poids.");
        }
    }

    public static void main(String[] args) {
        // Exemple d'utilisation de la classe Saisiepoids
        try {
            // Initialiser la connexion à la base de données
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bddcriee", "root", "");

            // Exemple de lot sélectionné
            int selectedLot = 1;

            // Lancer la page Saisiepoids
            SwingUtilities.invokeLater(() -> {
                Saisiepoids app = new Saisiepoids(conn, selectedLot);
                app.setVisible(true);
            });
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
