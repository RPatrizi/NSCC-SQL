# Author: Rodrigo Borges
# Date: 2023-04-10
# Description: ICE 4, DATA3090 course, NSCC IT Data Analytics program


#Install packages and load libraries

# Package names
packages <- c("ggplot2", "RODBC", "car", "caret", "corrgram", "gridExtra", "forecast")

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# Packages loading
invisible(lapply(packages, library, character.only = TRUE))


#connect to SQL Server
dbconnection <-odbcDriverConnect('driver={SQL Server};server=ML-RefVm-361229;database=ExchangeRate;trusted_connection=true')


#load data
FX_Pred_rate <- sqlQuery(dbconnection,paste("SELECT * FROM PredictionData;"))
FX_Pred_rate=FX_Pred_rate[,4:7]


#re-Running model
model_gam = readRDS("C://Users//Student//OneDrive - Nova Scotia Community College//Applied_DA//PredictiveModel//model_gam.rds")

rmse = as.data.frame(model_gam$results$RMSE[2])

names(rmse) <- c("RMSE")

predictions <- predict(model_gam, FX_Pred_rate[,1:3])

myPred= as.data.frame(cbind(FX_Pred_rate[,1:3],predictions))
