# 🌿 Argan Cooperative Database Management System

## 📊 Overview

A comprehensive PostgreSQL database system for managing an Argan products cooperative in Morocco. This database handles the entire value chain from raw material collection to final product sales.

## 🚀 Quick Start

### Prerequisites
- PostgreSQL 16 or higher
- `psql` command-line tool
- `pgcrypto` extension

### Installation

```bash
# Clone or download the project files

# Make the deployment script executable
chmod +x deploy.sh

# Run the deployment
./deploy.sh
```
argan-db/
├── setup.sql              # Main orchestration script
├── deploy.sh              # Automated deployment script
├── README.md              # This documentation
│
├── schema/
│   ├── 01_tables.sql      # Table creation (16 tables)
│   ├── 02_constraints.sql # Foreign keys & check constraints
│   └── 03_indexes.sql     # Performance indexes
│
├── views/
│   └── 01_views.sql       # Reporting views (5 views)
│
├── functions/
│   └── 01_functions.sql   # Stored functions (4 functions)
│
├── triggers/
│   └── 01_triggers.sql    # Automatic triggers (6 triggers)
│
├── data/
│   └── 01_seed.sql        # Sample data with realistic values
│
└── security/
    └── 01_roles.sql       # User roles, permissions & RLS

## 🔐 Security Features

### Role-Based Access Control
admin - Full system access
gestionnaire - Business operations manager
caissier - Cashier/financial operations
collecteur - Field collection agent
client - Customer self-service portal

### Data Protection
Password encryption using bcrypt (pgcrypto)
Row Level Security (RLS) on sensitive tables
Application user with limited privileges
Automatic audit trails via modification timestamps

## 📈 Business Intelligence

### Built-in Reporting Views

view_producteur_performance - Producer productivity metrics
view_stock_status - Inventory levels with alert system
view_ventes_summary - Sales overview with payment status
view_dashboard_stats - Monthly KPIs for dashboard
view_product_sales - Product performance analytics

### Key Performance Indicators

Monthly revenue and growth rates
Producer collection volumes and quality
Inventory turnover ratios
Payment collection efficiency
Product category performance

## 🔄 Automation Features$

### Automatic Triggers

Stock Updates - Real-time inventory tracking
Producer Totals - Automatic collection aggregation
Modification Timestamps - Audit trail on all changes
Last Updated - Track inventory changes

### Generated Columns

Automatic calculations for totals, discounts, and VAT
Derived metrics like montant_total, total_net, sous_total
Computed values that stay consistent with business rules

## 🛠️ Administration

### Database Backup
```bash
pg_dump -U postgres -d argan -F c -b -v -f argan_backup.dump
```
### Database Restore
```bash
pg_restore -U postgres -d argan -v argan_backup.dump
```
### Monitor Database Size
```bash
SELECT 
    schemaname,
    tablename,
    pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) as total_size
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size(schemaname||'.'||tablename) DESC;
```

## 🔧 Troubleshooting

### Common Issues

### 1. Extension pgcrypto not found
```bash
CREATE EXTENSION IF NOT EXISTS pgcrypto;
```
### 2. Permission denied errors
```bash
GRANT ALL PRIVILEGES ON DATABASE argan TO postgres;
```

### 3. Duplicate key violations

Check sample data for duplicates
Reset sequences if needed

### 4. Connection issues

Verify PostgreSQL service is running
Check firewall settings
Confirm database exists

## 📄 License
This database schema is provided for educational and demonstration purposes. Modify as needed for your specific requirements.

