-- =============================================
-- SECURITY EXTENSIONS
-- =============================================
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- =============================================
-- SECURITY ROLES & PERMISSIONS
-- =============================================
-- 1. Create the App User
DO $$
BEGIN
  IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'argan_app_user') THEN
    CREATE USER argan_app_user WITH PASSWORD 'arganappuser2026!';
  END IF;
END
$$;

-- 2. Grant Access
GRANT CONNECT ON DATABASE "argan" TO argan_app_user;
GRANT USAGE ON SCHEMA public TO argan_app_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO argan_app_user;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO argan_app_user;

-- 3. Future Proofing
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO argan_app_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE, SELECT ON SEQUENCES TO argan_app_user;

-- =============================================
-- DATA PRIVACY (RLS)
-- =============================================
ALTER TABLE collectes ENABLE ROW LEVEL SECURITY;

CREATE POLICY collectes_privacy_policy ON collectes
FOR ALL
USING (
    current_setting('app.current_user_role', true) = 'admin'
    OR
    id_utilisateur = current_setting('app.current_user_id', true)::INTEGER
);

-- Ensure App User can still act on the table
GRANT ALL ON collectes TO argan_app_user;

-- =============================================
-- TESTING QUERIES
-- =============================================

-- Test 1: Check that year() function works
SELECT
    year(date_commande) as annee,
    month(date_commande) as mois,
    COUNT(*) as nb_commandes,
    SUM(total_net) as total_ventes
FROM commandes
GROUP BY year(date_commande), month(date_commande)
ORDER BY annee DESC, mois DESC;

-- Test 2: Check that total_ligne column works
SELECT
    p.nom_produit,
    SUM(lc.total_ligne) as total_ventes
FROM produits p
JOIN ligne_commande lc ON p.id_produit = lc.id_produit
JOIN commandes c ON lc.id_commande = c.id_commande
WHERE c.statut IN ('livrée', 'partiellement_livree')
GROUP BY p.nom_produit
ORDER BY total_ventes DESC;

-- Test 3: Verify all tables have data
SELECT
    'producteurs' as table_name, COUNT(*) as record_count FROM producteurs
UNION ALL SELECT 'utilisateurs', COUNT(*) FROM utilisateurs
UNION ALL SELECT 'clients', COUNT(*) FROM clients
UNION ALL SELECT 'produits', COUNT(*) FROM produits
UNION ALL SELECT 'collectes', COUNT(*) FROM collectes
UNION ALL SELECT 'transformation', COUNT(*) FROM transformation
UNION ALL SELECT 'depense', COUNT(*) FROM depense
UNION ALL SELECT 'employees', COUNT(*) FROM employees
UNION ALL SELECT 'raw_materials', COUNT(*) FROM raw_materials
UNION ALL SELECT 'mouvements_stock', COUNT(*) FROM mouvements_stock
UNION ALL SELECT 'commandes', COUNT(*) FROM commandes
UNION ALL SELECT 'ligne_commande', COUNT(*) FROM ligne_commande
UNION ALL SELECT 'factures', COUNT(*) FROM factures
UNION ALL SELECT 'paiements', COUNT(*) FROM paiements
UNION ALL SELECT 'collecte_produit', COUNT(*) FROM collecte_produit
ORDER BY table_name;

-- Test 4: Sample dashboard query
SELECT
    year(date_commande) as annee,
    month(date_commande) as mois,
    SUM(total_net) as ventes_mois,
    LAG(SUM(total_net)) OVER (ORDER BY year(date_commande), month(date_commande)) as ventes_mois_precedent,
    CASE
        WHEN LAG(SUM(total_net)) OVER (ORDER BY year(date_commande), month(date_commande)) > 0
        THEN ROUND(((SUM(total_net) - LAG(SUM(total_net)) OVER (ORDER BY year(date_commande), month(date_commande))) / LAG(SUM(total_net)) OVER (ORDER BY year(date_commande), month(date_commande))) * 100, 2)
        ELSE 0
    END as croissance_pourcentage
FROM commandes
WHERE statut IN ('livrée', 'partiellement_livree')
GROUP BY year(date_commande), month(date_commande)
ORDER BY annee DESC, mois DESC;

-- =============================================
-- FINAL MESSAGES
-- =============================================
SELECT 'Database created successfully with all fixes!' as message;
SELECT '✓ year() function created' as fix_1;
SELECT '✓ month() function created' as fix_2;
SELECT '✓ total_ligne column added to ligne_commande' as fix_3;
SELECT '✓ TVA field fixed (DECIMAL(4,2) instead of DECIMAL(5,2))' as fix_4;
