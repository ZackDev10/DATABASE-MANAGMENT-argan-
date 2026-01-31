-- =============================================
-- TABLE CREATION
-- =============================================

-- Clean up existing objects if they exist
DROP VIEW IF EXISTS view_dashboard_stats CASCADE;
DROP VIEW IF EXISTS view_product_sales CASCADE;
DROP VIEW IF EXISTS view_producteur_performance CASCADE;
DROP VIEW IF EXISTS view_stock_status CASCADE;
DROP VIEW IF EXISTS view_ventes_summary CASCADE;

-- Drop triggers and functions
DROP TRIGGER IF EXISTS trigger_update_produit_modification ON produits;
DROP TRIGGER IF EXISTS trigger_update_producteur_modification ON producteurs;
DROP TRIGGER IF EXISTS trigger_update_raw_materials_timestamp ON raw_materials;
DROP TRIGGER IF EXISTS trigger_update_employees_timestamp ON employees;
DROP TRIGGER IF EXISTS trigger_update_product_stock ON mouvements_stock;
DROP TRIGGER IF EXISTS trigger_update_producteur_quantite_total ON collectes;

DROP FUNCTION IF EXISTS update_modification_timestamp() CASCADE;
DROP FUNCTION IF EXISTS update_last_updated_timestamp() CASCADE;
DROP FUNCTION IF EXISTS update_product_stock() CASCADE;
DROP FUNCTION IF EXISTS update_producteur_quantite_total() CASCADE;

-- Drop tables in reverse order of dependencies
DROP TABLE IF EXISTS paiements CASCADE;
DROP TABLE IF EXISTS factures CASCADE;
DROP TABLE IF EXISTS ligne_commande CASCADE;
DROP TABLE IF EXISTS commandes CASCADE;
DROP TABLE IF EXISTS mouvements_stock CASCADE;
DROP TABLE IF EXISTS collecte_produit CASCADE;
DROP TABLE IF EXISTS collectes CASCADE;
DROP TABLE IF EXISTS transformation CASCADE;
DROP TABLE IF EXISTS depense CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS raw_materials CASCADE;
DROP TABLE IF EXISTS produits CASCADE;
DROP TABLE IF EXISTS clients CASCADE;
DROP TABLE IF EXISTS utilisateurs CASCADE;
DROP TABLE IF EXISTS producteurs CASCADE;

-- =============================================
-- CREATE TABLES
-- =============================================

-- Table Producteurs
CREATE TABLE producteurs (
    idproducteur SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    adresse TEXT NOT NULL,
    telephone VARCHAR(20) NOT NULL,
    email VARCHAR(255),
    cin VARCHAR(20) UNIQUE,
    zone VARCHAR(255),
    quantite_total DECIMAL(10,2) DEFAULT 0.00,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_modification TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    statut VARCHAR(20) DEFAULT 'actif'
);

-- Table Utilisateurs
CREATE TABLE utilisateurs (
    id_utilisateur SERIAL PRIMARY KEY,
    login VARCHAR(255) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL,
    email VARCHAR(255),
    telephone VARCHAR(20),
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dernier_login TIMESTAMP,
    statut VARCHAR(20) DEFAULT 'actif'
);

-- Table Collectes
CREATE TABLE collectes (
    id_collecte SERIAL PRIMARY KEY,
    idproducteur INTEGER NOT NULL,
    id_utilisateur INTEGER NOT NULL,
    date_collecte DATE NOT NULL,
    heure_collecte TIME DEFAULT CURRENT_TIME,
    quantite DECIMAL(10,2) NOT NULL,
    type VARCHAR(20),
    qualite VARCHAR(20),
    prix_unitaire DECIMAL(10,2),
    montant_total DECIMAL(10,2) GENERATED ALWAYS AS (quantite * prix_unitaire) STORED,
    statut VARCHAR(20) DEFAULT 'validée',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table Clients
CREATE TABLE clients (
    id_client SERIAL PRIMARY KEY,
    nom TEXT NOT NULL,
    prenom TEXT NOT NULL,
    adresse TEXT NOT NULL,
    telephone TEXT NOT NULL,
    email TEXT,
    type_client TEXT DEFAULT 'particulier',
    credit_max DECIMAL(10,2) DEFAULT 0.00,
    solde_du DECIMAL(10,2) DEFAULT 0.00,
    date_inscription DATE DEFAULT CURRENT_DATE,
    statut TEXT DEFAULT 'actif'
);

-- Table Produits
CREATE TABLE produits (
    id_produit SERIAL PRIMARY KEY,
    nom_produit TEXT NOT NULL,
    prix_unitaire DECIMAL(10,2) NOT NULL,
    prix_achat DECIMAL(10,2) DEFAULT 0,
    description TEXT,
    categorie TEXT,
    unite_mesure TEXT DEFAULT 'kg',
    stock_min INTEGER DEFAULT 0,
    stock INTEGER DEFAULT 0,
    statut TEXT DEFAULT 'disponible',
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_modification TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table Commandes
CREATE TABLE commandes (
    id_commande SERIAL PRIMARY KEY,
    reference_commande TEXT UNIQUE,
    id_client INTEGER NOT NULL,
    id_utilisateur INTEGER NOT NULL,
    date_commande TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    remise DECIMAL(10,2) DEFAULT 0,
    total_net DECIMAL(10,2) GENERATED ALWAYS AS (total - remise) STORED,
    statut TEXT DEFAULT 'en_attente',
    mode_paiement TEXT,
    date_livraison DATE,
    adresse_livraison TEXT,
    notes TEXT
);

-- Table LigneCommande
CREATE TABLE ligne_commande (
    id_ligne SERIAL PRIMARY KEY,
    id_commande INTEGER NOT NULL,
    id_produit INTEGER NOT NULL,
    quantite INTEGER NOT NULL,
    prix_unitaire DECIMAL(10,2) NOT NULL,
    remise_ligne DECIMAL(10,2) DEFAULT 0,
    sous_total DECIMAL(10,2) GENERATED ALWAYS AS (quantite * prix_unitaire - remise_ligne) STORED,
    total_ligne DECIMAL(10,2) GENERATED ALWAYS AS (quantite * prix_unitaire - remise_ligne) STORED
);

-- Table Factures
CREATE TABLE factures (
    id_facture SERIAL PRIMARY KEY,
    numero_facture TEXT UNIQUE NOT NULL,
    id_commande INTEGER NOT NULL UNIQUE,
    date_facture DATE DEFAULT CURRENT_DATE,
    montant_total DECIMAL(10,2) NOT NULL,
    tva DECIMAL(4,2) DEFAULT 20.00,
    montant_tva DECIMAL(10,2) GENERATED ALWAYS AS (montant_total * tva / 100) STORED,
    total_ttc DECIMAL(10,2) GENERATED ALWAYS AS (montant_total * (1 + tva / 100)) STORED,
    statut_paiement TEXT DEFAULT 'impayée',
    date_echeance DATE,
    notes TEXT
);

-- Table Paiements
CREATE TABLE paiements (
    id_paiement SERIAL PRIMARY KEY,
    id_facture INTEGER NOT NULL,
    id_utilisateur INTEGER NOT NULL,
    montant DECIMAL(10,2) NOT NULL,
    date_paiement TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    mode_paiement TEXT NOT NULL,
    reference TEXT,
    statut TEXT DEFAULT 'validé',
    notes TEXT
);

-- Table Stock Movements
CREATE TABLE mouvements_stock (
    id_mouvement SERIAL PRIMARY KEY,
    id_produit INTEGER NOT NULL,
    type_mouvement TEXT,
    quantite DECIMAL(10,2) NOT NULL,
    date_mouvement TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    reference TEXT,
    id_reference INTEGER,
    notes TEXT
);

-- Table de liaison many-to-many Collecte-Produit
CREATE TABLE collecte_produit (
    id_collecte INTEGER NOT NULL,
    id_produit INTEGER NOT NULL,
    quantite_utilisee DECIMAL(10,2) NOT NULL,
    rendement DECIMAL(10,2),
    date_transformation DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (id_collecte, id_produit)
);

-- Table for Raw Materials
CREATE TABLE raw_materials (
    id_raw_material SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(50),
    quantity DECIMAL(10,2) DEFAULT 0.00,
    unit VARCHAR(50) DEFAULT 'kg',
    price_per_unit DECIMAL(10,2) DEFAULT 0.00,
    supplier VARCHAR(255),
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'disponible'
);

-- Table Transformations
CREATE TABLE transformation (
    id_transformation SERIAL PRIMARY KEY,
    description TEXT NOT NULL,
    date_transformation DATE DEFAULT CURRENT_DATE,
    cout DECIMAL(10,2) DEFAULT 0,
    statut VARCHAR(50) DEFAULT 'en_cours',
    id_produit INTEGER,
    quantite_utilisee DECIMAL(10,2),
    quantite_produite DECIMAL(10,2),
    taux_rendement DECIMAL(5,2),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table Dépenses
CREATE TABLE depense (
    id_depense SERIAL PRIMARY KEY,
    description TEXT NOT NULL,
    montant DECIMAL(10,2) NOT NULL,
    date_depense DATE DEFAULT CURRENT_DATE,
    categorie VARCHAR(100),
    mode_paiement VARCHAR(50),
    beneficiaire VARCHAR(255),
    responsable VARCHAR(255),
    notes TEXT,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table Employees
CREATE TABLE employees (
    id_employee SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    job_title VARCHAR(100),
    department VARCHAR(100),
    email VARCHAR(255),
    phone VARCHAR(20),
    hire_date DATE,
    salary DECIMAL(10,2),
    status VARCHAR(20) DEFAULT 'active',
    address TEXT,
    cin VARCHAR(20) UNIQUE,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
