-- =============================================
-- Argan Database Setup Script
-- =============================================

-- Execute schema components
\i schema/01_tables.sql
\i schema/02_constraints.sql
\i schema/03_indexes.sql

-- Execute views
\i views/01_views.sql

-- Execute functions
\i functions/01_functions.sql

-- Execute triggers
\i triggers/01_triggers.sql

-- Load initial data
\i data/01_seed.sql

-- Apply security settings
\i security/01_roles.sql

SELECT 'Argan database setup completed successfully!' as message;
