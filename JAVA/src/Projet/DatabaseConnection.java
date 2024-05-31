package Projet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    public static void main(String[] args) {
        // Informations de connexion
        String url = "jdbc:mysql://localhost:3306/bddcriee"; // Remplacez par votre URL de base de données
        String username = "root"; // Remplacez par votre nom d'utilisateur
        String password = ""; // Remplacez par votre mot de passe

        try {
            // Charger le pilote JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Établir la connexion
            Connection conn = DriverManager.getConnection(url, username, password);
            System.out.println("Connexion à la base de données établie avec succès !");
            
            // Vous pouvez maintenant interagir avec la base de données

            // Fermer la connexion
            conn.close();
            System.out.println("Connexion fermée.");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}

