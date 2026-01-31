-- =============================================
-- VIEWS FOR REPORTING
-- =============================================

-- View for producteur performance
CREATE VIEW view_producteur_performance AS
SELECT
    p.idproducteur,
    p.nom,
    p.prenom,
    p.zone,
    COUNT(c.id_collecte) as nb_collectes,
    COALESCE(SUM(c.quantite), 0) as quantite_totale,
    COALESCE(SUM(c.montant_total), 0) as montant_total
FROM producteurs p
LEFT JOIN collectes c ON p.idproducteur = c.idproducteur AND c.statut = 'validée'
GROUP BY p.idproducteur, p.nom, p.prenom, p.zone;

-- View for stock status
CREATE VIEW view_stock_status AS
SELECT
    p.id_produit,
    p.nom_produit,
    p.categorie,
    p.stock,
    p.stock_min,
    CASE
        WHEN p.stock = 0 THEN 'rupture'
        WHEN p.stock <= p.stock_min THEN 'alerte'
        ELSE 'normal'
    END as statut_stock,
    p.prix_unitaire
FROM produits p;

-- View for sales summary
CREATE VIEW view_ventes_summary AS
SELECT
    c.id_commande,
    c.date_commande,
    cl.nom || ' ' || cl.prenom as client,
    c.total_net,
    c.statut,
    f.statut_paiement
FROM commandes c
JOIN clients cl ON c.id_client = cl.id_client
LEFT JOIN factures f ON c.id_commande = f.id_commande;

-- New view for dashboard
CREATE VIEW view_dashboard_stats AS
SELECT
    EXTRACT(YEAR FROM c.date_commande) as annee,
    EXTRACT(MONTH FROM c.date_commande) as mois,
    COUNT(DISTINCT c.id_commande) as nb_commandes,
    SUM(c.total_net) as total_ventes,
    SUM(f.montant_total) as total_facture,
    SUM(CASE WHEN f.statut_paiement = 'payée' THEN f.montant_total ELSE 0 END) as total_paye
FROM commandes c
LEFT JOIN factures f ON c.id_commande = f.id_commande
GROUP BY EXTRACT(YEAR FROM c.date_commande), EXTRACT(MONTH FROM c.date_commande);

-- View for product sales
CREATE VIEW view_product_sales AS
SELECT
    p.id_produit,
    p.nom_produit,
    p.categorie,
    COUNT(lc.id_ligne) as nb_ventes,
    SUM(lc.quantite) as quantite_vendue,
    SUM(lc.sous_total) as chiffre_affaires,
    SUM(lc.total_ligne) as chiffre_affaires2
FROM produits p
LEFT JOIN ligne_commande lc ON p.id_produit = lc.id_produit
LEFT JOIN commandes c ON lc.id_commande = c.id_commande AND c.statut IN ('livrée', 'partiellement_livree')
GROUP BY p.id_produit, p.nom_produit, p.categorie;
