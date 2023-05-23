$actualMonthYear = Get-Date -Format "yyyyMM"

#INFLATION_BRL
$urlBRLInf = "https://servicodados.ibge.gov.br/api/v3/agregados/1737/periodos/201612-" + $actualMonthYear + "/variaveis/63?localidades=BR"
$inputPath_IBRL = Invoke-RestMethod -uri $urlBRLInf
$outputPath_IBRL = "C:\Users\Student\OneDrive - Nova Scotia Community College\Applied_DA\CSV\BRL_Inflation.csv"

$inputPath_IBRL.resultados.series.serie | 
export-csv -path $outputPath_IBRL -NoTypeInformation


#INFLATION_CAD
$inputPath_ICAD = Invoke-RestMethod -uri 'https://www.bankofcanada.ca/valet/observations/INDINF_CPI_M/json'
$outputPath_ICAD = "C:\Users\Student\OneDrive - Nova Scotia Community College\Applied_DA\CSV\CAD_Inflation.csv"

$inputPath_ICAD.observations | Select-Object -Property @{Label="day";Expression={$_.d}},@{Label="value";Expression={$_.INDINF_CPI_M.v}} | 
export-csv -path $outputPath_ICAD -NoTypeInformation


#FX_CAD_BRL
$inputPath_CADBRL = Invoke-RestMethod -uri 'https://www.bankofcanada.ca/valet/observations/FXCADBRL/json'
$outputPath_CADBRL = "C:\Users\Student\OneDrive - Nova Scotia Community College\Applied_DA\CSV\FX_CAD_BRL.csv"

$inputPath_CADBRL.observations | Select-Object -Property @{Label="day";Expression={$_.d}},@{Label="value";Expression={$_.FXCADBRL.v}} | 
export-csv -path $outputPath_CADBRL -NoTypeInformation


#FX_BRL_CAD
#$inputPath_BRLCAD = Invoke-RestMethod -uri 'https://www.bankofcanada.ca/valet/observations/FXBRLCAD/json'
#$outputPath_BRLCAD = "C:\Users\Student\OneDrive - Nova Scotia Community College\Applied_DA\CSV\FX_BRL_CAD.csv"

#$inputPath_BRLCAD.observations | Select-Object -Property @{Label="day";Expression={$_.d}},@{Label="value";Expression={$_.FXBRLCAD.v}} | 
#export-csv -path $outputPath_BRLCAD -NoTypeInformation
