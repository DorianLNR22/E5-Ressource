package Projet;

import java.sql.*;
import javax.swing.*;
import java.awt.*;

public class SelecLot extends JFrame {
    private Connection conn;

    public SelecLot(Connection conn) {
        this.conn = conn;

        // Configuration de la fenêtre
        setTitle("Sélectionnez un lot");
        setSize(400, 300);
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        // Créer un panneau pour les boutons
        JPanel buttonPanel = new JPanel();
        buttonPanel.setLayout(new GridLayout(0, 1)); // Organiser les boutons verticalement

        // Récupérer les lots de la base de données dans l'ordre croissant par ID de lot
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT idLot, nomLot FROM lot ORDER BY idLot ASC");

            // Créer un bouton pour chaque lot
            while (rs.next()) {
                int idLot = rs.getInt("idLot");
                String nomLot = rs.getString("nomLot");

                // Créer un bouton nommé "Lot x"
                JButton button = new JButton("Lot " + idLot);

                // Ajouter un ActionListener au bouton pour ouvrir la page Saisiepoids
                button.addActionListener(e -> openSaisiepoidsPage(idLot));

                // Ajouter le bouton au panneau
                buttonPanel.add(button);
            }

            // Fermer les ressources
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Ajouter le panneau à la fenêtre
        add(buttonPanel, BorderLayout.CENTER);
    }

    private void openSaisiepoidsPage(int idLot) {
        // Ouvrir la page Saisiepoids et lui passer l'ID du lot sélectionné
        Saisiepoids saisiepoidsPage = new Saisiepoids(conn, idLot);
        saisiepoidsPage.setVisible(true);
    }

    public static void main(String[] args) {
        // Initialiser la connexion à la base de données
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bddcriee", "root", "");

            // Lancer l'application
            SwingUtilities.invokeLater(() -> {
                SelecLot app = new SelecLot(conn);
                app.setVisible(true);
            });
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}