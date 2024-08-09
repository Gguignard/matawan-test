# Matawan services test techniques

## Pré-requis

- Postgresql 16.4 (https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)
- Java 21 (https://oracle.com/java/technologies/downloads/#java21)

## Installation

1. Cloner le projet
2. Modifier le fichier application.properties pour configurer l a base de données
3. Importer le projet dans votre IDE et le lancer via l'IDE (run BackendApplication.java) ou via la ligne de commande "java BackendApplication.java"
4. L'application est accessible via l'url http://localhost:8080

## Utilisation

Une collection Postman pour utiliser les 2 API est disponible à la racine du projet.

## Choix technique

Pas spécialement de choix technique particulier.
Jakarta pour la validation des DTO, 
Liquibase pour la gestion des scripts SQL (préférence par rapport à flyway par retour d'expérience sur des projets).


