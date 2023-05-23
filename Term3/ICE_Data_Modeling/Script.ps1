# dd-mm-yyyy
#[string]$DT="2017-09-01"
param ([string]$DT)
Write-Host($DT)

Write-Host("https://api.opencovid.ca/timeseries?stat=all&geo=pt&pt_names=canonical&after=$DT")
$data= Invoke-RestMethod -uri "https://api.opencovid.ca/timeseries?stat=all&geo=pt&pt_names=canonical&after=$DT"   


##09-01-2022"
#$data.active | export-csv -path C:\Users\Student\Desktop\Code\DataIn\Covid\activecases.csv –NoTypeInformation 
$data.data.cases | export-csv -path C:\Users\Student\Desktop\BDM\ICE3\CSV\cases.csv –NoTypeInformation
$data.data.vaccine_administration_dose_3 | export-csv -path C:\Users\Student\Desktop\BDM\ICE3\CSV\fullyvaccined.csv –NoTypeInformation
$data.data.deaths | export-csv -path C:\Users\Student\Desktop\BDM\ICE3\CSV\mortality.csv –NoTypeInformation
#$data.recovered | export-csv -path C:\Users\Student\Desktop\Code\DataIn\Covid\recovered.csv –NoTypeInformation
#$data.testing | export-csv -path C:\Users\Student\Desktop\Code\DataIn\Covid\testing.csv –NoTypeInformation
