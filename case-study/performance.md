# 🚀 Performance Analysis & Optimization
# Argan Database Performance Case Study

## 📊 Executive Summary

This document analyzes the performance characteristics of the Argan Cooperative Database and provides optimization recommendations. The database handles ~50,000 annual transactions with peak loads during collection seasons.

## Quick Performance Checklist

### ✅ Immediate Actions (5 minutes)

```bash
-- Check slow queries
SELECT query, calls, total_time, mean_time
FROM pg_stat_statements
ORDER BY total_time DESC LIMIT 10;

-- Check index usage
SELECT tablename, indexname, idx_scan
FROM pg_stat_user_indexes
WHERE idx_scan < 1000;
```

### Essential Indexes (Postgres Added by default)

```bash
-- 1. Most important indexes for speed
CREATE INDEX idx_commandes_statut_date ON commandes(statut, date_commande);
CREATE INDEX idx_collectes_producteur_date ON collectes(idproducteur, date_collecte);
CREATE INDEX idx_ligne_commande_produit_commande ON ligne_commande(id_produit, id_commande);
CREATE INDEX idx_factures_statut_date ON factures(statut_paiement, date_facture);

-- 2. Add if missing (check first)
CREATE INDEX IF NOT EXISTS idx_produits_categorie_stock ON produits(categorie, stock);
CREATE INDEX IF NOT EXISTS idx_clients_type_statut ON clients(type_client, statut);
CREATE INDEX IF NOT EXISTS idx_producteurs_zone_statut ON producteurs(zone, statut);
```

## Fast Queries Template

### 1. Dashboard Queries (< 100ms)

```bash
-- Today's sales (fast with index)
SELECT SUM(total_net) as today_sales
FROM commandes
WHERE date_commande::date = CURRENT_DATE
  AND statut = 'livrée';

-- Low stock alert
SELECT nom_produit, stock, stock_min
FROM produits
WHERE stock <= stock_min
  AND statut = 'disponible';

-- Pending collections
SELECT COUNT(*) as pending_collectes
FROM collectes
WHERE statut = 'en_attente'
  AND date_collecte >= CURRENT_DATE - INTERVAL '7 days';
```

### 2. Report Queries (< 500ms)

```bash
-- Monthly sales (use date range)
SELECT
    EXTRACT(MONTH FROM date_commande) as month,
    COUNT(*) as orders,
    SUM(total_net) as revenue
FROM commandes
WHERE date_commande >= '2024-01-01'
  AND date_commande < '2024-02-01'
  AND statut IN ('livrée', 'partiellement_livree')
GROUP BY EXTRACT(MONTH FROM date_commande);

-- Producer performance (limit results)
SELECT
    p.nom, p.prenom,
    SUM(c.quantite) as total_collected
FROM producteurs p
JOIN collectes c ON p.idproducteur = c.idproducteur
WHERE c.date_collecte >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY p.idproducteur, p.nom, p.prenom
ORDER BY total_collected DESC
LIMIT 20;
```

## Slow Query Fixes

### ❌ BEFORE (Slow)

```bash
SELECT * FROM produits
WHERE description ILIKE '%huile%';
```

### ✅ AFTER (Fast)

```bash
-- Add this index first:
CREATE INDEX idx_produits_search ON produits
USING gin(to_tsvector('french', nom_produit || ' ' || description));

-- Then use:
SELECT * FROM produits
WHERE to_tsvector('french', nom_produit || ' ' || description)
      @@ to_tsquery('french', 'huile');
```

## Performance Monitoring

### Daily Check (1 minute)

```bash
-- Table sizes
SELECT
    tablename,
    pg_size_pretty(pg_total_relation_size(tablename)) as size
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size(tablename) DESC
LIMIT 5;

-- Cache hit ratio (should be > 95%)
SELECT
    sum(heap_blks_hit) / (sum(heap_blks_hit) + sum(heap_blks_read)) as ratio
FROM pg_statio_user_tables;
```

## Maintenance Commands

### Weekly (Run on Sunday)

```bash
-- Update statistics (helps query planner)
ANALYZE;

-- Check for dead rows
SELECT schemaname, tablename, n_dead_tup
FROM pg_stat_user_tables
WHERE n_dead_tup > 1000;
```

### Monthly (First of month)

```bash
-- Rebuild bloated indexes
REINDEX TABLE commandes;
REINDEX TABLE collectes;

-- Check partition needs (if > 100k rows)
SELECT
    tablename,
    n_live_tup as rows
FROM pg_stat_user_tables
WHERE n_live_tup > 100000
ORDER BY n_live_tup DESC;
```

## Essential Tools

1. **pg_stat_statements** - Find slow queries
2. **EXPLAIN ANALYZE** - Understand query plans
3. **pgBadger** - Log analysis (optional)
4. **pgHero** - Web dashboard (recommended)
