#DRUG_PRODUCT
$inputPath_DP = Invoke-RestMethod -uri 'https://health-products.canada.ca/api/drug/drugproduct/?lang=en&type=json'
$outputPath_DP = "C:\Users\Student\Desktop\FinalProject\CSV\DRUG_PRODUCT.csv"

$inputPath_DP | Select-Object drug_code, class_name, drug_identification_number, brand_name, descriptor, number_of_ais, ai_group_no, company_name, last_update_date  |
ConvertTo-Csv -NoTypeInformation | Set-Content $outputPath_DP


#ACTIVE_INGREDIENTS
$inputPath_AI = Invoke-RestMethod -uri 'https://health-products.canada.ca/api/drug/activeingredient/?lang=en&type=json'
$outputPath_AI = "C:\Users\Student\Desktop\FinalProject\CSV\ACTIVE_INGREDIENTS.csv"

$inputPath_AI | Select-Object dosage_unit, dosage_value, drug_code, ingredient_name, strength, strength_unit  |
ConvertTo-Csv -NoTypeInformation | Set-Content $outputPath_AI


#VETERINARY_SPECIES
$inputPath_VS = Invoke-RestMethod -uri 'https://health-products.canada.ca/api/drug/veterinaryspecies/?lang=en&type=json'
$outputPath_VS = "C:\Users\Student\Desktop\FinalProject\CSV\VETERINARY_SPECIES.csv"

$inputPath_VS | Select-Object drug_code, vet_species_name  |
ConvertTo-Csv -NoTypeInformation | Set-Content $outputPath_VS


#COMPANY
$inputPath_CO = Invoke-RestMethod -uri 'https://health-products.canada.ca/api/drug/company/?lang=en&type=json'
$outputPath_CO = "C:\Users\Student\Desktop\FinalProject\CSV\COMPANY.csv"

$inputPath_CO | Select-Object city_name, company_code, company_name, company_type, country_name, post_office_box, postal_code, province_name, street_name, suite_number  |
ConvertTo-Csv -NoTypeInformation | Set-Content $outputPath_CO


#ROUTE
$inputPath_RO = Invoke-RestMethod -uri 'https://health-products.canada.ca/api/drug/route/?lang=en&type=json'
$outputPath_RO = "C:\Users\Student\Desktop\FinalProject\CSV\ROUTE.csv"

$inputPath_RO | Select-Object drug_code, route_of_administration_code, route_of_administration_name  |
ConvertTo-Csv -NoTypeInformation | Set-Content $outputPath_RO


#STATUS
$inputPath_ST = Invoke-RestMethod -uri 'https://health-products.canada.ca/api/drug/status/?lang=en&type=json'
$outputPath_ST = "C:\Users\Student\Desktop\FinalProject\CSV\STATUS.csv"

$inputPath_ST | Select-Object drug_code, status, history_date, original_market_date, external_status_code, expiration_date, lot_number  |
ConvertTo-Csv -NoTypeInformation | Set-Content $outputPath_ST


#THERAPEUTIC_CLASS
$inputPath_TC = Invoke-RestMethod -uri 'https://health-products.canada.ca/api/drug/therapeuticclass/?lang=en&type=json'
$outputPath_TC = "C:\Users\Student\Desktop\FinalProject\CSV\THERAPEUTIC_CLASS.csv"

$inputPath_TC | Select-Object drug_code, tc_atc_number, tc_atc, tc_ahfs_number, tc_ahfs  |
ConvertTo-Csv -NoTypeInformation | Set-Content $outputPath_TC


#SCHEDULE
$inputPath_SC = Invoke-RestMethod -uri 'https://health-products.canada.ca/api/drug/schedule/?lang=en&type=json'
$outputPath_SC = "C:\Users\Student\Desktop\FinalProject\CSV\SCHEDULE.csv"

$inputPath_SC | Select-Object drug_code, schedule_name  |
ConvertTo-Csv -NoTypeInformation | Set-Content $outputPath_SC


#PHARMACEUTICALSTD
$inputPath_PS = Invoke-RestMethod -uri 'https://health-products.canada.ca/api/drug/pharmaceuticalstd/?type=json'
$outputPath_PS = "C:\Users\Student\Desktop\FinalProject\CSV\PHARMACEUTICALSTD.csv"

$inputPath_PS | Select-Object drug_code, pharmaceutical_std  |
ConvertTo-Csv -NoTypeInformation | Set-Content $outputPath_PS


#PACKAGING
$inputPath_PA = Invoke-RestMethod -uri 'https://health-products.canada.ca/api/drug/packaging/?type=json'
$outputPath_PA = "C:\Users\Student\Desktop\FinalProject\CSV\PACKAGING.csv"

$inputPath_PA | Select-Object drug_code, upc, package_size_unit, package_type, package_size, product_information  |
ConvertTo-Csv -NoTypeInformation | Set-Content $outputPath_PA


#FORM
$inputPath_FO = Invoke-RestMethod -uri 'https://health-products.canada.ca/api/drug/form/?lang=en&type=json'
$outputPath_FO = "C:\Users\Student\Desktop\FinalProject\CSV\FORM.csv"

$inputPath_FO | Select-Object drug_code, pharmaceutical_form_code, pharmaceutical_form_name  |
ConvertTo-Csv -NoTypeInformation | Set-Content $outputPath_FO


