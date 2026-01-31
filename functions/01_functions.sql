-- =============================================
-- YEAR AND MONTH FUNCTIONS
-- =============================================

-- year function for timestamp
CREATE OR REPLACE FUNCTION year(timestamp) RETURNS integer AS $$
    SELECT EXTRACT(YEAR FROM $1)::integer;
$$ LANGUAGE SQL IMMUTABLE;

-- year function for date
CREATE OR REPLACE FUNCTION year(date) RETURNS integer AS $$
    SELECT EXTRACT(YEAR FROM $1)::integer;
$$ LANGUAGE SQL IMMUTABLE;

-- month function for timestamp
CREATE OR REPLACE FUNCTION month(timestamp) RETURNS integer AS $$
    SELECT EXTRACT(MONTH FROM $1)::integer;
$$ LANGUAGE SQL IMMUTABLE;

-- month function for date
CREATE OR REPLACE FUNCTION month(date) RETURNS integer AS $$
    SELECT EXTRACT(MONTH FROM $1)::integer;
$$ LANGUAGE SQL IMMUTABLE;

-- =============================================
-- TRIGGER FUNCTIONS
-- =============================================

-- Function to update modification timestamp
CREATE OR REPLACE FUNCTION update_modification_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.date_modification = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Function to update last_updated timestamp
CREATE OR REPLACE FUNCTION update_last_updated_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.last_updated = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Function to update product stock
CREATE OR REPLACE FUNCTION update_product_stock()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.type_mouvement = 'entree' THEN
        UPDATE produits
        SET stock = stock + NEW.quantite
        WHERE id_produit = NEW.id_produit;
    ELSIF NEW.type_mouvement = 'sortie' THEN
        UPDATE produits
        SET stock = stock - NEW.quantite
        WHERE id_produit = NEW.id_produit;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Function to update producteur total quantity
CREATE OR REPLACE FUNCTION update_producteur_quantite_total()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.statut = 'validée' THEN
        UPDATE producteurs
        SET quantite_total = quantite_total + NEW.quantite
        WHERE idproducteur = NEW.idproducteur;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
