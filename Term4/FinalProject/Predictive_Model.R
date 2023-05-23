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
FX_rate <- sqlQuery(dbconnection,paste("SELECT * FROM ModelData;"))

View(FX_rate)


# corrgram #include in Power BI
corrgram(FX_rate, order=TRUE) 


# scatter plot #include in Power BI
scatter.smooth(x=FX_rate$label, y=FX_rate$CAD_Inf_Value, main="CAD_Inflation ~ FX_CAD_BRL")  
# calculate correlation between them
cor(FX_rate$label, FX_rate$CAD_Inf_Value)

# scatter plot #include in Power BI
scatter.smooth(x=FX_rate$label, y=FX_rate$BRL_Inf_Value, main="BRL_Inflation ~ FX_CAD_BRL")
# calculate correlation between them
cor(FX_rate$label, FX_rate$BRL_Inf_Value)


FX_rate=FX_rate[,4:7]

#summ = as.data.frame(summary(FX_rate))


# Create index using 80/20 split
index <- createDataPartition(FX_rate$label, p=0.8, list=FALSE)

# Subset training set with index
train <- FX_rate[index,]

# Subset test set with index
test <- FX_rate[-index,]


###############################################################
fitControl <- trainControl(method = "repeatedcv", 
                           number = 10,     # number of folds
                           repeats = 10)    # repeated ten times


#predictive model
model_gam <- train(label ~ BRL_Inf_Value + CAD_Inf_Value + FX_CAD_BRL_Value,data = train, method = "gam", trControl = fitControl,
                    preProcess = c('scale', 'center'))

model_gam

rmse = as.data.frame(model_gam$results$RMSE[2])


#save to disk
saveRDS(model_gam, "C://Users//Student//OneDrive - Nova Scotia Community College//Applied_DA//PredictiveModel//model_gam.rds")


#re-Running model
model_gam.New = readRDS("C://Users//Student//OneDrive - Nova Scotia Community College//Applied_DA//PredictiveModel//model_gam.rds")

