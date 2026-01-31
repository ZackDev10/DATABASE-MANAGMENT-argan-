-- =============================================
-- INDEXES FOR PERFORMANCE
-- =============================================

-- Indexes for producteurs table
CREATE INDEX idx_producteurs_nom ON producteurs(nom);
CREATE INDEX idx_producteurs_prenom ON producteurs(prenom);
CREATE INDEX idx_producteurs_telephone ON producteurs(telephone);
CREATE INDEX idx_producteurs_statut ON producteurs(statut);

-- Indexes for utilisateurs table
CREATE INDEX idx_utilisateurs_login ON utilisateurs(login);
CREATE INDEX idx_utilisateurs_role ON utilisateurs(role);
CREATE INDEX idx_utilisateurs_statut ON utilisateurs(statut);

-- Indexes for collectes table
CREATE INDEX idx_collectes_date ON collectes(date_collecte);
CREATE INDEX idx_collectes_producteur ON collectes(idproducteur);
CREATE INDEX idx_collectes_type ON collectes(type);
CREATE INDEX idx_collectes_statut ON collectes(statut);

-- Indexes for clients table
CREATE INDEX idx_clients_nom ON clients(nom);
CREATE INDEX idx_clients_prenom ON clients(prenom);
CREATE INDEX idx_clients_telephone ON clients(telephone);
CREATE INDEX idx_clients_type ON clients(type_client);
CREATE INDEX idx_clients_statut ON clients(statut);

-- Indexes for produits table
CREATE INDEX idx_produits_nom ON produits(nom_produit);
CREATE INDEX idx_produits_categorie ON produits(categorie);
CREATE INDEX idx_produits_statut ON produits(statut);
CREATE INDEX idx_produits_stock ON produits(stock);

-- Indexes for commandes table
CREATE INDEX idx_commandes_client ON commandes(id_client);
CREATE INDEX idx_commandes_date ON commandes(date_commande);
CREATE INDEX idx_commandes_statut ON commandes(statut);
CREATE INDEX idx_commandes_reference ON commandes(reference_commande);

-- Indexes for ligne_commande table
CREATE INDEX idx_ligne_commande_commande ON ligne_commande(id_commande);
CREATE INDEX idx_ligne_commande_produit ON ligne_commande(id_produit);

-- Indexes for factures table
CREATE INDEX idx_factures_commande ON factures(id_commande);
CREATE INDEX idx_factures_statut ON factures(statut_paiement);
CREATE INDEX idx_factures_numero ON factures(numero_facture);
CREATE INDEX idx_factures_date ON factures(date_facture);

-- Indexes for paiements table
CREATE INDEX idx_paiements_facture ON paiements(id_facture);
CREATE INDEX idx_paiements_date ON paiements(date_paiement);
CREATE INDEX idx_paiements_mode ON paiements(mode_paiement);

-- Indexes for mouvements_stock table
CREATE INDEX idx_mouvements_stock_produit ON mouvements_stock(id_produit);
CREATE INDEX idx_mouvements_stock_date ON mouvements_stock(date_mouvement);
CREATE INDEX idx_mouvements_stock_type ON mouvements_stock(type_mouvement);

-- Indexes for raw_materials table
CREATE INDEX idx_raw_materials_type ON raw_materials(type);
CREATE INDEX idx_raw_materials_status ON raw_materials(status);
CREATE INDEX idx_raw_materials_supplier ON raw_materials(supplier);
CREATE INDEX idx_raw_materials_date_added ON raw_materials(date_added);

-- Indexes for new tables
CREATE INDEX idx_transformation_date ON transformation(date_transformation);
CREATE INDEX idx_transformation_statut ON transformation(statut);
CREATE INDEX idx_transformation_produit ON transformation(id_produit);

CREATE INDEX idx_depense_date ON depense(date_depense);
CREATE INDEX idx_depense_categorie ON depense(categorie);
CREATE INDEX idx_depense_mode_paiement ON depense(mode_paiement);

CREATE INDEX idx_employees_name ON employees(full_name);
CREATE INDEX idx_employees_department ON employees(department);
CREATE INDEX idx_employees_status ON employees(status);
CREATE INDEX idx_employees_job_title ON employees(job_title);
