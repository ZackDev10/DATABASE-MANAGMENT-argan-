-- =============================================
-- TRIGGER DEFINITIONS
-- =============================================

-- Triggers for produits table
CREATE TRIGGER trigger_update_produit_modification
    BEFORE UPDATE ON produits
    FOR EACH ROW
    EXECUTE FUNCTION update_modification_timestamp();

-- Triggers for producteurs table
CREATE TRIGGER trigger_update_producteur_modification
    BEFORE UPDATE ON producteurs
    FOR EACH ROW
    EXECUTE FUNCTION update_modification_timestamp();

-- Triggers for raw_materials table
CREATE TRIGGER trigger_update_raw_materials_timestamp
    BEFORE UPDATE ON raw_materials
    FOR EACH ROW
    EXECUTE FUNCTION update_last_updated_timestamp();

-- Triggers for employees table
CREATE TRIGGER trigger_update_employees_timestamp
    BEFORE UPDATE ON employees
    FOR EACH ROW
    EXECUTE FUNCTION update_last_updated_timestamp();

-- Trigger to update product stock
CREATE TRIGGER trigger_update_product_stock
    AFTER INSERT ON mouvements_stock
    FOR EACH ROW
    EXECUTE FUNCTION update_product_stock();

-- Trigger to update producteur total quantity
CREATE TRIGGER trigger_update_producteur_quantite_total
    AFTER INSERT ON collectes
    FOR EACH ROW
    EXECUTE FUNCTION update_producteur_quantite_total();
