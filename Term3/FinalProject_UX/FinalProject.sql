CREATE DATABASE Drugs;
Go

USE Drugs;
Go

CREATE TABLE Company (
    [city_name] varchar(255),
    [company_code] varchar(255),
    [company_name] varchar(255),
    [company_type] varchar(255),
    [country_name] varchar(255),
    [post_office_box] varchar(255),
    [postal_code] varchar(255),
    [province_name] varchar(255),
    [street_name] varchar(255),
    [suite_number] varchar(255),
	CONSTRAINT [PK_Company] PRIMARY KEY (company_name) 
);
Go

CREATE TABLE [Route] (
    [drug_code] varchar(255),
    [route_of_administration_code] varchar(255),
    [route_of_administration_name] varchar(255),
	CONSTRAINT [PK_Route] PRIMARY KEY (drug_code, route_of_administration_code)
);
Go

CREATE TABLE Veterinary_Species (
    [drug_code] varchar(255),
    [vet_species_name] varchar(255),
	CONSTRAINT [PK_Veterinaty_Species] PRIMARY KEY (drug_code, vet_species_name)
);
Go

CREATE TABLE Drug_Product (
    [drug_code] varchar(255),
    [class_name] varchar(255),
    [drug_identification_number] varchar(255),
    [brand_name] varchar(255),
    [descriptor] varchar(255),
    [number_of_ais] int,
    [ai_group_no] varchar(255),
    [company_name] varchar(255),
    [last_update_date] date
	CONSTRAINT [PK_Drug_Product] PRIMARY KEY (drug_code)
);
Go

CREATE TABLE Active_Ingredients (
    [drug_code] varchar(255),
    [dosage_unit] varchar(255),
    [dosage_value] float,
    [ingredient_name] varchar(255),
    [strength] float,
    [strength_unit] varchar(255)
	CONSTRAINT [PK_Active_Ingredients] PRIMARY KEY (drug_code, ingredient_name, strength)
);
Go

CREATE TABLE [Status] (
    [drug_code] varchar(255),
    [status] varchar(255),
    [history_date] date,
    [original_market_date] varchar(255),
    [external_status_code] varchar(255),
    [expiration_date] varchar(255),
    [lot_number] varchar(255)
	CONSTRAINT [PK_Status] PRIMARY KEY (drug_code)
);
Go

CREATE TABLE [Form] (
    [drug_code] varchar(255),
    [pharmaceutical_form_code] varchar(255),
    [pharmaceutical_form_name] varchar(255),
	CONSTRAINT [PK_Form] PRIMARY KEY (drug_code, pharmaceutical_form_code)
);
Go

CREATE TABLE Schedule (
    [drug_code] varchar(255),
    [schedule_name] varchar(255),
	CONSTRAINT [PK_Schedule] PRIMARY KEY (drug_code, schedule_name)
);
Go

CREATE TABLE Therapeutic_Class (
    [drug_code] varchar(255),
    [tc_atc_number] varchar(255),
    [tc_atc] varchar(255),
    [tc_ahfs_number] varchar(255),
    [tc_ahfs] varchar(255)
	CONSTRAINT [PK_Active_Therapeutic_Class] PRIMARY KEY (drug_code)
);
Go

CREATE TABLE Packaging (
    [drug_code] varchar(255),
    [upc] varchar(255),
    [package_size_unit] varchar(255),
    [package_type] varchar(255),
    [package_size] varchar(255),
    [product_information] varchar(255)
	CONSTRAINT [PK_Active_Packaging] PRIMARY KEY (drug_code)
);
Go

ALTER TABLE Drug_Product
ADD CONSTRAINT FK_Company_Drug_Product FOREIGN KEY (company_name) REFERENCES Company(company_name) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [Route]
ADD CONSTRAINT FK_Drug_Product_Route FOREIGN KEY (drug_code) REFERENCES Drug_Product(drug_code) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [Status]
ADD CONSTRAINT FK_Drug_Product_Status FOREIGN KEY (drug_code) REFERENCES Drug_Product(drug_code) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Active_Ingredients
ADD CONSTRAINT FK_Drug_Product_Active_Ingredients FOREIGN KEY (drug_code) REFERENCES Drug_Product(drug_code) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Veterinary_Species
ADD CONSTRAINT FK_Drug_Product_Veterinary_Species FOREIGN KEY (drug_code) REFERENCES Drug_Product(drug_code) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [Form]
ADD CONSTRAINT FK_Drug_Product_Form FOREIGN KEY (drug_code) REFERENCES Drug_Product(drug_code) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Schedule
ADD CONSTRAINT FK_Drug_Product_Schedule FOREIGN KEY (drug_code) REFERENCES Drug_Product(drug_code) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Therapeutic_Class
ADD CONSTRAINT FK_Drug_Product_Therapeutic_Class FOREIGN KEY (drug_code) REFERENCES Drug_Product(drug_code) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Packaging
ADD CONSTRAINT FK_Drug_Product_Packaging FOREIGN KEY (drug_code) REFERENCES Drug_Product(drug_code) ON UPDATE CASCADE ON DELETE CASCADE;
Go

