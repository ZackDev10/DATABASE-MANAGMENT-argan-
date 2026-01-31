-- =============================================
-- FOREIGN KEY CONSTRAINTS
-- =============================================

-- Collectes foreign keys
ALTER TABLE collectes
ADD FOREIGN KEY (idproducteur) REFERENCES producteurs(idproducteur) ON DELETE RESTRICT;

ALTER TABLE collectes
ADD FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur);

-- Collecte-Produit foreign keys
ALTER TABLE collecte_produit
ADD FOREIGN KEY (id_collecte) REFERENCES collectes(id_collecte) ON DELETE CASCADE;

ALTER TABLE collecte_produit
ADD FOREIGN KEY (id_produit) REFERENCES produits(id_produit) ON DELETE CASCADE;

-- Commandes foreign keys
ALTER TABLE commandes
ADD FOREIGN KEY (id_client) REFERENCES clients(id_client);

ALTER TABLE commandes
ADD FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur);

-- LigneCommande foreign keys
ALTER TABLE ligne_commande
ADD FOREIGN KEY (id_commande) REFERENCES commandes(id_commande) ON DELETE CASCADE;

ALTER TABLE ligne_commande
ADD FOREIGN KEY (id_produit) REFERENCES produits(id_produit);

-- Factures foreign keys
ALTER TABLE factures
ADD FOREIGN KEY (id_commande) REFERENCES commandes(id_commande);

-- Paiements foreign keys
ALTER TABLE paiements
ADD FOREIGN KEY (id_facture) REFERENCES factures(id_facture);

ALTER TABLE paiements
ADD FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur);

-- Mouvements Stock foreign keys
ALTER TABLE mouvements_stock
ADD FOREIGN KEY (id_produit) REFERENCES produits(id_produit);

-- Transformation foreign keys
ALTER TABLE transformation
ADD FOREIGN KEY (id_produit) REFERENCES produits(id_produit);

-- =============================================
-- CHECK CONSTRAINTS
-- =============================================

-- Producteurs check constraints
ALTER TABLE producteurs
ADD CONSTRAINT chk_producteur_statut
CHECK (statut IN ('actif', 'inactif', 'suspendu'));

-- Utilisateurs check constraints
ALTER TABLE utilisateurs
ADD CONSTRAINT chk_utilisateur_role
CHECK (role IN ('admin', 'gestionnaire', 'caissier', 'client', 'collecteur'));

ALTER TABLE utilisateurs
ADD CONSTRAINT chk_utilisateur_statut
CHECK (statut IN ('actif', 'inactif'));

-- Collectes check constraints
ALTER TABLE collectes
ADD CONSTRAINT chk_collecte_quantite
CHECK (quantite > 0);

ALTER TABLE collectes
ADD CONSTRAINT chk_collecte_type
CHECK (type IN ('Rose', 'Argan', 'Safran', 'Amande', 'Miel', 'Aker Fassi', 'Fenugrec', 'Riz', 'Vanille', 'Aloe vera', 'Nigelle', 'autres'));

ALTER TABLE collectes
ADD CONSTRAINT chk_collecte_qualite
CHECK (qualite IN ('excellente', 'bonne', 'moyenne', 'mauvaise'));

ALTER TABLE collectes
ADD CONSTRAINT chk_collecte_prix_unitaire
CHECK (prix_unitaire >= 0);

ALTER TABLE collectes
ADD CONSTRAINT chk_collecte_statut
CHECK (statut IN ('validée', 'en_attente', 'rejetée'));

-- Clients check constraints
ALTER TABLE clients
ADD CONSTRAINT chk_clients_type
CHECK (type_client IN ('particulier', 'entreprise', 'revendeur', 'grossiste'));

ALTER TABLE clients
ADD CONSTRAINT chk_clients_statut
CHECK (statut IN ('actif', 'inactif'));

-- Produits check constraints
ALTER TABLE produits
ADD CONSTRAINT chk_produits_categorie
CHECK (categorie IN ('Eau de rose', 'Huile argan cosmétique', 'Huile argan alimentaire', 'Amlou', 'Savon à huile argan', 'Savon au safran',
    'Savon à la nigelle', 'Savon beldi au safran', 'Savon beldi à argan', 'Gel aloe vera', 'Shampoing à la nigelle', 'Masque pour le visage', 'Crème exfoliante traditionnelle (Tbrima)','autres'));

ALTER TABLE produits
ADD CONSTRAINT chk_produits_prix_unitaire
CHECK (prix_unitaire >= 0);

ALTER TABLE produits
ADD CONSTRAINT chk_produits_stock_min
CHECK (stock_min >= 0);

ALTER TABLE produits
ADD CONSTRAINT chk_produits_stock
CHECK (stock >= 0);

ALTER TABLE produits
ADD CONSTRAINT chk_produits_statut
CHECK (statut IN ('disponible', 'rupture', 'archivé'));

-- Commandes check constraints
ALTER TABLE commandes
ADD CONSTRAINT chk_commandes_total
CHECK (total >= 0);

ALTER TABLE commandes
ADD CONSTRAINT chk_commandes_remise
CHECK (remise >= 0);

ALTER TABLE commandes
ADD CONSTRAINT chk_commandes_statut
CHECK (statut IN ('en_attente', 'confirmée', 'en_preparation', 'livrée', 'annulée', 'partiellement_livree'));

ALTER TABLE commandes
ADD CONSTRAINT chk_commandes_mode_paiement
CHECK (mode_paiement IN ('espèces', 'chèque', 'virement', 'carte', 'crédit'));

-- LigneCommande check constraints
ALTER TABLE ligne_commande
ADD CONSTRAINT chk_ligne_commande_quantite
CHECK (quantite > 0);

ALTER TABLE ligne_commande
ADD CONSTRAINT chk_ligne_commande_prix_unitaire
CHECK (prix_unitaire >= 0);

ALTER TABLE ligne_commande
ADD CONSTRAINT chk_ligne_commande_remise_ligne
CHECK (remise_ligne >= 0);

-- Factures check constraints
ALTER TABLE factures
ADD CONSTRAINT chk_factures_montant_total
CHECK (montant_total >= 0);

ALTER TABLE factures
ADD CONSTRAINT chk_factures_tva
CHECK (tva >= 0 AND tva <= 100);

ALTER TABLE factures
ADD CONSTRAINT chk_factures_statut_paiement
CHECK (statut_paiement IN ('impayée', 'partiellement_payée', 'payée'));

-- Paiements check constraints
ALTER TABLE paiements
ADD CONSTRAINT chk_paiements_montant
CHECK (montant > 0);

ALTER TABLE paiements
ADD CONSTRAINT chk_paiements_mode_paiement
CHECK (mode_paiement IN ('carte', 'espèces', 'virement', 'chèque'));

ALTER TABLE paiements
ADD CONSTRAINT chk_paiements_statut
CHECK (statut IN ('validé', 'en_attente', 'rejeté'));

-- Mouvements Stock check constraints
ALTER TABLE mouvements_stock
ADD CONSTRAINT chk_mouvements_stock_type
CHECK (type_mouvement IN ('entree', 'sortie', 'ajustement'));

-- Collecte-Produit check constraints
ALTER TABLE collecte_produit
ADD CONSTRAINT chk_collecte_produit_quantite
CHECK (quantite_utilisee >= 0);

-- Raw Materials check constraints
ALTER TABLE raw_materials
ADD CONSTRAINT chk_raw_materials_type
CHECK (type IN ('lait', 'huile', 'miel', 'amandes', 'autres'));

ALTER TABLE raw_materials
ADD CONSTRAINT chk_raw_materials_status
CHECK (status IN ('disponible', 'epuise', 'en_commande', 'inactif'));

-- Transformation check constraints
ALTER TABLE transformation
ADD CONSTRAINT chk_transformation_statut
CHECK (statut IN ('en_cours', 'terminée', 'annulée'));

-- Dépenses check constraints
ALTER TABLE depense
ADD CONSTRAINT chk_depense_montant
CHECK (montant >= 0);

ALTER TABLE depense
ADD CONSTRAINT chk_depense_categorie
CHECK (categorie IN ('salaires', 'matériel', 'transport', 'entretien', 'autres'));

ALTER TABLE depense
ADD CONSTRAINT chk_depense_mode_paiement
CHECK (mode_paiement IN ('espèces', 'chèque', 'virement', 'carte'));

-- Employees check constraints
ALTER TABLE employees
ADD CONSTRAINT chk_employees_status
CHECK (status IN ('active', 'inactive', 'suspended'));
