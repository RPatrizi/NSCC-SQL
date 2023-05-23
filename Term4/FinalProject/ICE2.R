
# Author: Rodrigo Borges
# Date: 2023-03-20
# Description: ICE 2, DATA3090 course, NSCC IT Data Analytics program


#Install packages and load libraries
install.packages("caret")
install.packages("ggplot2")
install.packages("lattice")
install.packages("corrgram")
install.packages("gridExtra")
install.packages("RODBC")
install.packages("car")
install.packages("forecast")
install.packages("mgcv")
library(mgcv)
library(forecast)
library(car)
library(caret)
library(corrgram)
library(RODBC)


#connect to SQL Server
dbconnection <-odbcDriverConnect('driver={SQL Server};server=ML-RefVm-361229;database=ExchangeRate;trusted_connection=true')


#load data
FX_rate <- sqlQuery(dbconnection,paste("SELECT * FROM ModelData;"))

View(FX_rate)


# Data Viz Install packages and load libraries
corrgram(FX_rate, order=TRUE) #include in Power BI


# scatter plot #include in Power BI
scatter.smooth(x=FX_rate$label, y=FX_rate$CAD_Inf_Value, main="CAD_Inflation ~ FX_CAD_BRL")  
# calculate correlation between them
cor(FX_rate$label, FX_rate$CAD_Inf_Value)

# scatter plot #include in Power BI
scatter.smooth(x=FX_rate$label, y=FX_rate$BRL_Inf_Value, main="BRL_Inflation ~ FX_CAD_BRL")
# calculate correlation between them
cor(FX_rate$label, FX_rate$BRL_Inf_Value)



#########################################
# Machine Learning
#########################################

# Create index using 80/20 split
index <- createDataPartition(FX_rate$label, p=0.8, list=FALSE)

# Subset training set with index
FX_rate.training <- FX_rate[index,]

# Subset test set with index
FX_rate.test <- FX_rate[-index,]


# Multiple linear regression model
mlModel1 <- train(label ~ BRL_Inf_Value + CAD_Inf_Value, data = FX_rate, method = "lm")
mlModel2 <- train(label ~ BRL_Inf_Value + CAD_Inf_Value + FX_CAD_BRL_Value, data = FX_rate, method = "lm")
# Printing the model object
print(mlModel1)
print(mlModel2)

# Checking model statistics
summary(mlModel1)
summary(mlModel2)

###############################################################
fitControl <- trainControl(method = "repeatedcv", 
                           number = 10,     # number of folds
                           repeats = 10)    # repeated ten times

# Simple linear regression model (lm means linear model)
model1LR <- train(label ~ BRL_Inf_Value + CAD_Inf_Value, data = FX_rate,method = "ridge", trControl = fitControl)

model1LR

model2LR <- train(label ~ FX_CAD_BRL_Value + BRL_Inf_Value + CAD_Inf_Value, data = FX_rate,method = "ridge", trControl = fitControl)

model2LR


############################
# PreProcess
############################

# Train Lasso
model1Lasso <- train(label ~ FX_CAD_BRL_Value + BRL_Inf_Value + CAD_Inf_Value,data = FX_rate, method = "ridge", trControl = fitControl,
                       preProcess = c('scale', 'center')) # default: no pre-processing

model1Lasso

model2Lasso <- train(label ~ FX_CAD_BRL_Value + BRL_Inf_Value + CAD_Inf_Value,data = FX_rate, method = "ridge", trControl = fitControl,
                       preProcess = "BoxCox") # default: no pre-processing

model2Lasso

model3Lasso <- train(label ~ FX_CAD_BRL_Value + BRL_Inf_Value + CAD_Inf_Value,data = FX_rate, method = "ridge", trControl = fitControl,
                       preProcess = "pca") # default: no pre-processing

model3Lasso


# Train Lasso
model4Lasso <- train(label ~ BRL_Inf_Value + CAD_Inf_Value,data = FX_rate, method = "ridge", trControl = fitControl,
                     preProcess = c('scale', 'center')) # default: no pre-processing

model4Lasso


model5Lasso <- train(label ~ BRL_Inf_Value + CAD_Inf_Value,data = FX_rate, method = "ridge", trControl = fitControl,
                     preProcess = "BoxCox") # default: no pre-processing

model5Lasso


model6Lasso <- train(label ~ BRL_Inf_Value + CAD_Inf_Value,data = FX_rate, method = "ridge", trControl = fitControl,
                     preProcess = "pca") # default: no pre-processing

model6Lasso


lambdaGrid <- expand.grid(lambda = 10^seq(10, -2, length=10))

model7Lasso.cv <- train(label ~ BRL_Inf_Value + CAD_Inf_Value,data = FX_rate, method = "ridge", trControl = fitControl,
                        preProcess = "BoxCox",tuneGrid = lambdaGrid,   # Test all the lambda values in the lambdaGrid dataframe
                        na.action = na.omit)   # Ignore NA values

model7Lasso.cv


# Train Random Forest

model_rf1 <- train(label ~ FX_CAD_BRL_Value + BRL_Inf_Value + CAD_Inf_Value,data = FX_rate, method = "rf", trControl = fitControl,
                  preProcess = c('scale', 'center')) 

model_rf1


model_rf2 <- train(label ~ BRL_Inf_Value + CAD_Inf_Value,data = FX_rate, method = "rf", trControl = fitControl,
                  preProcess = c('scale', 'center')) 

model_rf2


model_rf3 <- train(label ~ FX_CAD_BRL_Value + BRL_Inf_Value + CAD_Inf_Value,data = FX_rate, method = "rf", trControl = fitControl,
                   preProcess = "BoxCox") 

model_rf3


model_rf4 <- train(label ~ BRL_Inf_Value + CAD_Inf_Value,data = FX_rate, method = "rf", trControl = fitControl,
                   preProcess = "BoxCox") 

model_rf4


model_rf5 <- train(label ~ FX_CAD_BRL_Value + BRL_Inf_Value + CAD_Inf_Value,data = FX_rate, method = "rf", trControl = fitControl,
                   preProcess = "pca") 

model_rf5


model_rf6 <- train(label ~ BRL_Inf_Value + CAD_Inf_Value,data = FX_rate, method = "rf", trControl = fitControl,
                   preProcess = "pca") 

model_rf6


# Train GAM

model_gam1 <- train(label ~ FX_CAD_BRL_Value + BRL_Inf_Value + CAD_Inf_Value,data = FX_rate, method = "gamLoess", trControl = fitControl,
                        preProcess = c('scale', 'center'))

model_gam1


model_gam2 <- train(label ~ BRL_Inf_Value + CAD_Inf_Value,data = FX_rate, method = "gamLoess", trControl = fitControl,
                   preProcess = c('scale', 'center'))

model_gam2
