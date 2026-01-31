-- =============================================
-- SAMPLE DATA INSERTION
-- =============================================

-- 1. Insert 20 utilisateurs
INSERT INTO utilisateurs (login, mot_de_passe, nom, prenom, role, email, telephone, statut) VALUES
('admin', crypt('admin123', gen_salt('bf')), 'System', 'Administrateur', 'admin', 'admin@argantifaout.com', '+212600000001', 'actif'),
('manager', crypt('manager123', gen_salt('bf')), 'Coopérative', 'Manager', 'gestionnaire', 'manager@argantifaout.com', '+212600000002', 'actif'),
('caissier1', crypt('caissier123', gen_salt('bf')), 'Principal', 'Caissier', 'caissier', 'caissier@argantifaout.com', '+212600000003', 'actif'),
('collecteur1', crypt('collect123', gen_salt('bf')), 'Ahmed', 'Collecteur', 'collecteur', 'collecteur1@argantifaout.com', '+212600000005', 'actif'),
('client1', crypt('client123', gen_salt('bf')), 'Client', 'Premium', 'client', 'client1@argantifaout.com', '+212600000007', 'actif'),
('quality1', crypt('quality123', gen_salt('bf')), 'Samira', 'Qualité', 'gestionnaire', 'quality@argantifaout.com', '+212600000009', 'actif'),
('prod1', crypt('prod123', gen_salt('bf')), 'Karim', 'Production', 'gestionnaire', 'prod@argantifaout.com', '+212600000010', 'actif'),
('supervisor', crypt('super123', gen_salt('bf')), 'Superviseur', 'General', 'gestionnaire', 'super@argantifaout.com', '+212600000011', 'actif'),
('accountant', crypt('account123', gen_salt('bf')), 'Comptable', 'Finance', 'gestionnaire', 'account@argantifaout.com', '+212600000012', 'actif'),
('sales1', crypt('sales123', gen_salt('bf')), 'Commercial', 'Ventes', 'gestionnaire', 'sales@argantifaout.com', '+212600000013', 'actif'),
('warehouse', crypt('ware123', gen_salt('bf')), 'Entrepôt', 'Manager', 'gestionnaire', 'warehouse@argantifaout.com', '+212600000014', 'actif'),
('tech1', crypt('tech123', gen_salt('bf')), 'Technicien', 'Maintenance', 'gestionnaire', 'tech@argantifaout.com', '+212600000015', 'actif'),
('driver1', crypt('driver123', gen_salt('bf')), 'Chauffeur', 'Livraison', 'collecteur', 'driver@argantifaout.com', '+212600000016', 'actif'),
('intern1', crypt('intern123', gen_salt('bf')), 'Stagiaire', 'Production', 'gestionnaire', 'intern@argantifaout.com', '+212600000018', 'actif'),
('backup', crypt('backup123', gen_salt('bf')), 'Backup', 'Administrateur', 'admin', 'backup@argantifaout.com', '+212600000020', 'actif');

-- 2. Insert 20 producteurs
INSERT INTO producteurs (nom, prenom, adresse, telephone, email, cin, zone, statut) VALUES
('Alaoui', 'Fatima', 'Douar Tifnit, Commune Rural Sidi Bibi', '+212611111111', 'fatima.alaoui@email.com', 'AB123456', 'Sidi Bibi', 'actif'),
('Bennani', 'Khadija', 'Douar Ait Milk, Commune Sidi Ifni', '+212622222222', 'khadija.bennani@email.com', 'CD789012', 'Sidi Ifni', 'actif'),
('Chakir', 'Mohamed', 'Douar Imi Mqourn, Commune Tiznit', '+212633333333', 'mohamed.chakir@email.com', 'EF345678', 'Tiznit', 'actif'),
('Daoudi', 'Amina', 'Douar Tafraout, Commune Tiznit', '+212644444444', 'amina.daoudi@email.com', 'GH901234', 'Tiznit', 'actif'),
('El Fassi', 'Hassan', 'Douar Ait Baha, Commune Ait Baha', '+212655555555', 'hassan.elfassi@email.com', 'IJ567890', 'Ait Baha', 'actif'),
('Farsi', 'Zineb', 'Douar Taliouine, Commune Taliouine', '+212666666666', 'zineb.farsi@email.com', 'KL123456', 'Taliouine', 'actif'),
('Ghazi', 'Rachid', 'Douar Biougra, Commune Biougra', '+212677777777', 'rachid.ghazi@email.com', 'MN789012', 'Biougra', 'actif'),
('Hassani', 'Samira', 'Douar Inezgane, Commune Inezgane', '+212688888888', 'samira.hassani@email.com', 'OP345678', 'Inezgane', 'actif'),
('Idrissi', 'Khalid', 'Douar Agadir, Commune Agadir', '+212699999999', 'khalid.idrissi@email.com', 'QR901234', 'Agadir', 'actif'),
('Jabri', 'Nadia', 'Douar Taroudant, Commune Taroudant', '+212611111112', 'nadia.jabri@email.com', 'ST567890', 'Taroudant', 'actif'),
('Kabbaj', 'Omar', 'Douar Essaouira, Commune Essaouira', '+212622222223', 'omar.kabbaj@email.com', 'UV123456', 'Essaouira', 'actif'),
('Lahlou', 'Laila', 'Douar Safi, Commune Safi', '+212633333334', 'laila.lahlou@email.com', 'WX789012', 'Safi', 'actif'),
('Mansouri', 'Youssef', 'Douar Marrakech, Commune Marrakech', '+212644444445', 'youssef.mansouri@email.com', 'YZ345678', 'Marrakech', 'actif'),
('Naciri', 'Saida', 'Douar Casablanca, Commune Casablanca', '+212655555556', 'saida.naciri@email.com', 'AB901235', 'Casablanca', 'actif'),
('Ouazzani', 'Ahmed', 'Douar Rabat, Commune Rabat', '+212666666667', 'ahmed.ouazzani@email.com', 'CD567891', 'Rabat', 'actif'),
('Rahmani', 'Fatima', 'Douar Fès, Commune Fès', '+212677777778', 'fatima.rahmani@email.com', 'EF123457', 'Fès', 'actif'),
('Saidi', 'Mohamed', 'Douar Meknès, Commune Meknès', '+212688888889', 'mohamed.saidi@email.com', 'GH789013', 'Meknès', 'actif'),
('Tazi', 'Khadija', 'Douar Tanger, Commune Tanger', '+212699999990', 'khadija.tazi@email.com', 'IJ345679', 'Tanger', 'actif'),
('Zaidi', 'Abdellah', 'Douar Oujda, Commune Oujda', '+212611111113', 'abdellah.zaidi@email.com', 'KL901235', 'Oujda', 'actif'),
('Zouhair', 'Meriem', 'Douar Laayoune, Commune Laayoune', '+212622222224', 'meriem.zouhair@email.com', 'MN567891', 'Laayoune', 'actif');

-- 3. Insert 20 clients
INSERT INTO clients (nom, prenom, adresse, telephone, email, type_client, credit_max) VALUES
('El Fassi', 'Ahmed', '123 Avenue Hassan II, Casablanca', '+212644444444', 'ahmed.elfassi@entreprise.com', 'entreprise', 50000.00),
('Mansouri', 'Amina', '45 Rue Mohammed V, Agadir', '+212655555555', 'amina.mansouri@particulier.com', 'particulier', 5000.00),
('Tijani', 'Hassan', '78 Boulevard Mohammed VI, Marrakech', '+212666666666', 'hassan.tijani@grossiste.com', 'grossiste', 100000.00),
('Benjelloun', 'Karim', '90 Avenue des FAR, Rabat', '+212677777777', 'karim.benjelloun@entreprise.com', 'entreprise', 75000.00),
('Cherkaoui', 'Fatima', '12 Rue Palestine, Tanger', '+212688888888', 'fatima.cherkaoui@particulier.com', 'particulier', 3000.00),
('Daoudi', 'Youssef', '34 Boulevard Anfa, Casablanca', '+212699999999', 'youssef.daoudi@revendeur.com', 'revendeur', 25000.00),
('El Khayat', 'Samira', '56 Rue Ibn Tachfine, Marrakech', '+212611111114', 'samira.elkhayat@particulier.com', 'particulier', 2000.00),
('Fikri', 'Mohamed', '78 Avenue Moulay Hassan, Rabat', '+212622222225', 'mohamed.fikri@grossiste.com', 'grossiste', 150000.00),
('Gharbi', 'Nadia', '90 Rue Atlas, Agadir', '+212633333336', 'nadia.gharbi@entreprise.com', 'entreprise', 40000.00),
('Hamidi', 'Khalid', '12 Boulevard Mohammed V, Fès', '+212644444447', 'khalid.hamidi@particulier.com', 'particulier', 1000.00),
('Idrissi', 'Leila', '34 Rue de la Liberté, Tanger', '+212655555558', 'leila.idrissi@revendeur.com', 'revendeur', 18000.00),
('Jabri', 'Omar', '56 Avenue Hassan I, Casablanca', '+212666666669', 'omar.jabri@grossiste.com', 'grossiste', 200000.00),
('Kettani', 'Rachida', '78 Rue de Paris, Rabat', '+212677777770', 'rachida.kettani@particulier.com', 'particulier', 1500.00),
('Lahlou', 'Hicham', '90 Boulevard Zerktouni, Casablanca', '+212688888871', 'hicham.lahlou@entreprise.com', 'entreprise', 60000.00),
('Mernissi', 'Zineb', '12 Rue de Fès, Marrakech', '+212699999972', 'zineb.mernissi@particulier.com', 'particulier', 2500.00),
('Naciri', 'Adil', '34 Avenue Mohamed VI, Agadir', '+212611111115', 'adil.naciri@revendeur.com', 'revendeur', 22000.00),
('Ouahabi', 'Sanae', '56 Rue de la Plage, Essaouira', '+212622222226', 'sanae.ouahabi@particulier.com', 'particulier', 800.00),
('Rifai', 'Hamid', '78 Boulevard des Almohades, Rabat', '+212633333337', 'hamid.rifai@grossiste.com', 'grossiste', 175000.00),
('Saidi', 'Naima', '90 Rue Ibn Zohr, Agadir', '+212644444448', 'naima.saidi@entreprise.com', 'entreprise', 35000.00),
('Talbi', 'Driss', '12 Avenue Al Massira, Casablanca', '+212655555559', 'driss.talbi@particulier.com', 'particulier', 1200.00);

-- 4. Insert 20 produits
INSERT INTO produits (nom_produit, prix_unitaire, prix_achat, description, categorie, unite_mesure, stock_min, stock, statut) VALUES
('Huile d''Argan Alimentaire', 250.00, 180.00, 'Huile d''argan pure qualité alimentaire', 'huile', 'litre', 10, 50, 'disponible'),
('Huile d''Argan Cosmétique', 300.00, 220.00, 'Huile d''argan pour soins cosmétiques', 'huile', 'litre', 5, 30, 'disponible'),
('Amandes d''Argan', 150.00, 100.00, 'Amandes d''argan torréfiées', 'amandes', 'kg', 20, 100, 'disponible'),
('Miel d''Arganier', 120.00, 80.00, 'Miel pur de fleurs d''arganier', 'miel', 'kg', 15, 60, 'disponible'),
('Savon à l''Huile d''Argan', 45.00, 25.00, 'Savon naturel à l''huile d''argan', 'autres', 'unité', 50, 200, 'disponible'),
('Crème Visage Argan', 85.00, 50.00, 'Crème hydratante à l''huile d''argan', 'autres', 'tube', 30, 120, 'disponible'),
('Shampoing Argan', 65.00, 35.00, 'Shampoing revitalisant à l''argan', 'autres', 'bouteille', 40, 150, 'disponible'),
('Masque Capillaire Argan', 75.00, 40.00, 'Masque réparateur à l''huile d''argan', 'autres', 'pot', 25, 80, 'disponible'),
('Huile d''Argan Bio Certifiée', 350.00, 250.00, 'Huile d''argan biologique certifiée', 'huile', 'litre', 8, 25, 'disponible'),
('Amandes Crues Bio', 180.00, 120.00, 'Amandes d''argan crues biologiques', 'amandes', 'kg', 15, 75, 'disponible'),
('Miel Bio d''Arganier', 140.00, 90.00, 'Miel biologique de fleurs d''arganier', 'miel', 'kg', 12, 50, 'disponible'),
('Huile Massage Argan', 280.00, 190.00, 'Huile de massage à l''argan', 'huile', 'litre', 10, 35, 'disponible'),
('Poudre d''Amandes Argan', 130.00, 85.00, 'Poudre d''amandes d''argan pour pâtisserie', 'amandes', 'kg', 18, 90, 'disponible'),
('Lait Corporel Argan', 95.00, 55.00, 'Lait corporel à l''huile d''argan', 'autres', 'bouteille', 35, 110, 'disponible'),
('Sérum Visage Argan', 120.00, 70.00, 'Sérum concentré à l''huile d''argan', 'autres', 'flacon', 20, 65, 'disponible'),
('Gel Douche Argan', 55.00, 30.00, 'Gel douche parfumé à l''argan', 'autres', 'bouteille', 45, 180, 'disponible'),
('Baume à Lèvres Argan', 25.00, 12.00, 'Baume nourrissant à l''huile d''argan', 'autres', 'tube', 60, 250, 'disponible'),
('Huile d''Argan Vierge Extra', 320.00, 230.00, 'Huile d''argan vierge extra première pression', 'huile', 'litre', 6, 20, 'disponible'),
('Amandes Grillées Salées', 160.00, 105.00, 'Amandes d''argan grillées et salées', 'amandes', 'kg', 22, 95, 'disponible'),
('Miel Crémeux Arganier', 130.00, 85.00, 'Miel crémeux de fleurs d''arganier', 'miel', 'kg', 14, 55, 'disponible');

-- 5. Insert 20 collectes
INSERT INTO collectes (idproducteur, id_utilisateur, date_collecte, quantite, type, qualite, prix_unitaire, statut) VALUES
(1, 5, '2024-01-15', 50.00, 'amandes', 'excellente', 80.00, 'validée'),
(2, 5, '2024-01-16', 35.00, 'amandes', 'bonne', 75.00, 'validée'),
(3, 5, '2024-01-17', 40.00, 'amandes', 'excellente', 85.00, 'validée'),
(4, 6, '2024-01-18', 45.00, 'amandes', 'moyenne', 70.00, 'validée'),
(5, 6, '2024-01-19', 55.00, 'amandes', 'excellente', 90.00, 'validée'),
(6, 5, '2024-01-20', 30.00, 'miel', 'bonne', 60.00, 'validée'),
(7, 6, '2024-01-21', 25.00, 'miel', 'excellente', 75.00, 'validée'),
(8, 5, '2024-01-22', 60.00, 'amandes', 'bonne', 78.00, 'validée'),
(9, 6, '2024-01-23', 42.00, 'amandes', 'moyenne', 72.00, 'validée'),
(10, 5, '2024-01-24', 38.00, 'miel', 'excellente', 80.00, 'validée'),
(11, 6, '2024-01-25', 47.00, 'amandes', 'bonne', 76.00, 'validée'),
(12, 5, '2024-01-26', 52.00, 'amandes', 'excellente', 88.00, 'validée'),
(13, 6, '2024-01-27', 33.00, 'miel', 'moyenne', 65.00, 'validée'),
(14, 5, '2024-01-28', 28.00, 'miel', 'bonne', 70.00, 'validée'),
(15, 6, '2024-01-29', 65.00, 'amandes', 'excellente', 95.00, 'validée'),
(16, 5, '2024-01-30', 40.00, 'amandes', 'bonne', 77.00, 'validée'),
(17, 6, '2024-01-31', 36.00, 'miel', 'excellente', 85.00, 'validée'),
(18, 5, '2024-02-01', 44.00, 'amandes', 'moyenne', 73.00, 'validée'),
(19, 6, '2024-02-02', 58.00, 'amandes', 'excellente', 92.00, 'validée'),
(20, 5, '2024-02-03', 32.00, 'miel', 'bonne', 68.00, 'validée');

-- 6. Insert 10 raw_materials
INSERT INTO raw_materials (name, type, quantity, unit, price_per_unit, supplier, status) VALUES
('Amandes brutes', 'amandes', 500.00, 'kg', 80.00, 'Producteurs locaux', 'disponible'),
('Noix d''argan', 'autres', 300.00, 'kg', 60.00, 'Coopérative Tifnit', 'disponible'),
('Miel brut', 'miel', 200.00, 'kg', 70.00, 'Apiculteurs région', 'disponible'),
('Cire d''abeille', 'autres', 150.00, 'kg', 120.00, 'Apiculteurs région', 'disponible'),
('Huile d''argan brute', 'huile', 400.00, 'litre', 150.00, 'Coopérative Tiznit', 'disponible'),
('Amandes bio brutes', 'amandes', 250.00, 'kg', 100.00, 'Producteurs bio', 'disponible'),
('Miel bio brut', 'miel', 180.00, 'kg', 90.00, 'Apiculteurs bio', 'disponible'),
('Noix d''argan bio', 'autres', 220.00, 'kg', 75.00, 'Coopérative bio', 'disponible'),
('Huile cosmétique brute', 'huile', 350.00, 'litre', 180.00, 'Fournisseur spécialisé', 'disponible'),
('Essence naturelle', 'autres', 120.00, 'litre', 200.00, 'Distributeur agréé', 'disponible');

-- 7. Insert 10 employees
INSERT INTO employees (full_name, job_title, department, email, phone, hire_date, salary, status, cin) VALUES
('Karim El Amrani', 'Responsable Production', 'Production', 'karim@argantifaout.com', '+212677777777', '2023-01-15', 8000.00, 'active', 'PA123456'),
('Samira Benali', 'Responsable Qualité', 'Qualité', 'samira@argantifaout.com', '+212688888888', '2023-02-20', 7500.00, 'active', 'QA789012'),
('Youssef Idrissi', 'Technicien Transformation', 'Production', 'youssef@argantifaout.com', '+212699999999', '2023-03-10', 6000.00, 'active', 'TC345678'),
('Fatima Zahra Alaoui', 'Contrôleur Qualité', 'Qualité', 'fatima@argantifaout.com', '+212611111116', '2023-04-05', 5500.00, 'active', 'CQ901234'),
('Ahmed Bouziane', 'Magasinier', 'Logistique', 'ahmed@argantifaout.com', '+212622222227', '2023-05-12', 5000.00, 'active', 'MG567890'),
('Nadia El Fassi', 'Comptable', 'Finance', 'nadia@argantifaout.com', '+212633333338', '2023-06-18', 7000.00, 'active', 'CP123456'),
('Mohamed Chraibi', 'Commercial', 'Ventes', 'mohamed@argantifaout.com', '+212644444449', '2023-07-22', 6500.00, 'active', 'CM789012'),
('Khadija Mansouri', 'Secrétaire', 'Administration', 'khadija@argantifaout.com', '+212655555560', '2023-08-30', 5200.00, 'active', 'SC345678'),
('Hassan Tazi', 'Chauffeur Livreur', 'Logistique', 'hassan@argantifaout.com', '+212666666671', '2023-09-14', 4800.00, 'active', 'CH901234'),
('Leila Naciri', 'Responsable Achats', 'Achats', 'leila@argantifaout.com', '+212677777782', '2023-10-25', 7200.00, 'active', 'RA567890');

-- 8. Insert 10 transformation records
INSERT INTO transformation (description, date_transformation, cout, statut, id_produit, quantite_utilisee, quantite_produite, taux_rendement) VALUES
('Transformation amandes en huile alimentaire', '2024-01-18', 500.00, 'terminée', 1, 100.00, 25.00, 25.00),
('Production huile cosmétique', '2024-01-19', 600.00, 'terminée', 2, 80.00, 20.00, 25.00),
('Torréfaction amandes', '2024-01-20', 300.00, 'terminée', 3, 120.00, 110.00, 91.67),
('Filtration miel', '2024-01-21', 200.00, 'terminée', 4, 50.00, 48.00, 96.00),
('Fabrication savons', '2024-01-22', 400.00, 'terminée', 5, 30.00, 200.00, 666.67),
('Production crème visage', '2024-01-23', 450.00, 'terminée', 6, 25.00, 120.00, 480.00),
('Fabrication shampoing', '2024-01-24', 350.00, 'terminée', 7, 20.00, 150.00, 750.00),
('Production masque capillaire', '2024-01-25', 380.00, 'terminée', 8, 18.00, 80.00, 444.44),
('Transformation bio huile alimentaire', '2024-01-26', 550.00, 'terminée', 9, 90.00, 22.00, 24.44),
('Torréfaction amandes bio', '2024-01-27', 320.00, 'terminée', 10, 100.00, 92.00, 92.00);

-- 9. Insert 10 depense records
INSERT INTO depense (description, montant, date_depense, categorie, mode_paiement, beneficiaire, responsable) VALUES
('Achat matériel emballage', 2500.00, '2024-01-10', 'matériel', 'virement', 'Fournisseur Emballage SARL', 'Karim El Amrani'),
('Frais transport collecte', 800.00, '2024-01-12', 'transport', 'espèces', 'Chauffeur Mohamed', 'Hassan Tazi'),
('Salaires janvier', 22000.00, '2024-01-31', 'salaires', 'virement', 'Personnel coopérative', 'Nadia El Fassi'),
('Achat matières premières', 15000.00, '2024-01-05', 'matériel', 'virement', 'Producteurs locaux', 'Leila Naciri'),
('Entretien machines', 1200.00, '2024-01-15', 'entretien', 'chèque', 'Techni-Service SARL', 'Karim El Amrani'),
('Frais électricité', 850.00, '2024-01-20', 'autres', 'virement', 'ONE', 'Karim El Amrani'),
('Achat carburant', 600.00, '2024-01-08', 'transport', 'espèces', 'Station Shell', 'Hassan Tazi'),
('Formation personnel', 3000.00, '2024-01-25', 'autres', 'virement', 'Centre Formation', 'Samira Benali'),
('Achat uniformes', 1500.00, '2024-01-18', 'matériel', 'chèque', 'Textile Pro', 'Khadija Mansouri'),
('Frais eau', 450.00, '2024-01-22', 'autres', 'virement', 'RADE', 'Karim El Amrani');

-- 10. Insert 10 commandes
INSERT INTO commandes (reference_commande, id_client, id_utilisateur, date_commande, total, remise, statut, mode_paiement, date_livraison) VALUES
('CMD-2024-0001', 1, 3, '2024-01-05 10:30:00', 1500.00, 100.00, 'livrée', 'virement', '2024-01-06'),
('CMD-2024-0002', 2, 3, '2024-01-06 14:15:00', 750.00, 50.00, 'livrée', 'espèces', '2024-01-07'),
('CMD-2024-0003', 3, 4, '2024-01-07 11:00:00', 3500.00, 200.00, 'livrée', 'chèque', '2024-01-08'),
('CMD-2024-0004', 4, 3, '2024-01-08 09:45:00', 1200.00, 0.00, 'livrée', 'virement', '2024-01-09'),
('CMD-2024-0005', 5, 4, '2024-01-09 16:20:00', 850.00, 30.00, 'livrée', 'espèces', '2024-01-10'),
('CMD-2024-0006', 6, 3, '2024-01-10 13:10:00', 2200.00, 150.00, 'livrée', 'carte', '2024-01-11'),
('CMD-2024-0007', 7, 4, '2024-01-11 10:00:00', 650.00, 0.00, 'livrée', 'espèces', '2024-01-12'),
('CMD-2024-0008', 8, 3, '2024-01-12 15:30:00', 4800.00, 300.00, 'livrée', 'virement', '2024-01-13'),
('CMD-2024-0009', 9, 4, '2024-01-13 11:45:00', 1700.00, 100.00, 'livrée', 'chèque', '2024-01-14'),
('CMD-2024-0010', 10, 3, '2024-01-14 14:00:00', 450.00, 0.00, 'livrée', 'espèces', '2024-01-15');

-- 11. Insert ligne_commande records for the first 5 commandes
INSERT INTO ligne_commande (id_commande, id_produit, quantite, prix_unitaire, remise_ligne) VALUES
(1, 1, 2, 250.00, 0), (1, 3, 5, 150.00, 50.00),
(2, 2, 1, 300.00, 0), (2, 5, 10, 45.00, 0),
(3, 1, 10, 250.00, 100.00), (3, 2, 5, 300.00, 50.00),
(4, 3, 8, 150.00, 0), (4, 4, 2, 120.00, 0),
(5, 5, 15, 45.00, 15.00), (5, 6, 2, 85.00, 0);

-- 12. Insert factures for the first 5 commandes
INSERT INTO factures (numero_facture, id_commande, date_facture, montant_total, tva, statut_paiement, date_echeance) VALUES
('FACT-2024-0001', 1, '2024-01-05', 1400.00, 20.00, 'payée', '2024-02-05'),
('FACT-2024-0002', 2, '2024-01-06', 700.00, 20.00, 'payée', '2024-02-06'),
('FACT-2024-0003', 3, '2024-01-07', 3300.00, 20.00, 'payée', '2024-02-07'),
('FACT-2024-0004', 4, '2024-01-08', 1200.00, 20.00, 'payée', '2024-02-08'),
('FACT-2024-0005', 5, '2024-01-09', 820.00, 20.00, 'payée', '2024-02-09');

-- 13. Insert paiements for the first 3 factures
INSERT INTO paiements (id_facture, id_utilisateur, montant, date_paiement, mode_paiement, reference, statut) VALUES
(1, 3, 1400.00, '2024-01-05 11:00:00', 'virement', 'VIR001', 'validé'),
(2, 3, 700.00, '2024-01-06 15:00:00', 'espèces', 'CASH001', 'validé'),
(3, 4, 3300.00, '2024-01-07 12:00:00', 'chèque', 'CHQ001', 'validé');

-- 14. Insert mouvements_stock for production
INSERT INTO mouvements_stock (id_produit, type_mouvement, quantite, reference, notes) VALUES
(1, 'entree', 25.00, 'transformation', 'Production huile alimentaire'),
(2, 'entree', 20.00, 'transformation', 'Production huile cosmétique'),
(3, 'entree', 110.00, 'transformation', 'Torréfaction amandes'),
(4, 'entree', 48.00, 'transformation', 'Filtration miel'),
(5, 'entree', 200.00, 'transformation', 'Fabrication savons');

-- 15. Insert some collecte_produit relationships
INSERT INTO collecte_produit (id_collecte, id_produit, quantite_utilisee, rendement) VALUES
(1, 3, 50.00, 0.92),
(2, 3, 35.00, 0.91),
(3, 3, 40.00, 0.93),
(4, 3, 45.00, 0.90),
(5, 3, 55.00, 0.94);
