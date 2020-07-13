library(Boruta)
setwd("C:/Data")
traindata <- read.csv("Dataset.csv", header = T, stringsAsFactors = F)
str(traindata)
summary(traindata)
set.seed(123)
boruta.train <- Boruta(ParameterY~.-ID, data = traindata, doTrace = 2)
print(boruta.train)
plot(boruta.train, xlab = "", xaxt = "n")
lz<-lapply(1:ncol(boruta.train$ImpHistory),function(i)
  boruta.train$ImpHistory[is.finite(boruta.train$ImpHistory[,i]),i])
names(lz) <- colnames(boruta.train$ImpHistory)
Labels <- sort(sapply(lz,median))
axis(side = 1,las=2,labels = names(Labels),at = 1:ncol(boruta.train$ImpHistory), cex.axis = 1.0)
final.boruta <- TentativeRoughFix(boruta.train)
print(final.boruta)
getSelectedAttributes(final.boruta, withTentative = F)
boruta.df <- attStats(final.boruta)
class(boruta.df)
print(boruta.df)


library(caret)
library(randomForest)
set.seed(123)
control <- rfeControl(functions=rfFuncs, method="cv", number=10)
rfe.train <- rfe(traindata[,2:7], traindata[,8], sizes=1:7, rfeControl=control)
rfe.train
plot(rfe.train, type=c("g", "o"), cex = 1.0, col = 1:6)
predictors(rfe.train)


library(caret)
setwd("C:/Data")
traindata <- read.csv("Dataset.csv", header = T, stringsAsFactors = F)
str(traindata)
summary(traindata)
library(TH.data)
rPartMod <- train( ParameterY ~., data=traindata, method="rpart")
rpartImp <- varImp(rPartMod)
print(rpartImp)
plot(rpartImp, top = 5, main='Variable Importance')



library(relaimpo)
setwd("C:/Data")
traindata <- read.csv("Dataset.csv", header = T, stringsAsFactors = F)
str(traindata)
# Build linear regression model
model_formula = ParameterY ~ ParameterA + ParameterB + ParameterC + ParameterD + ParameterE + ParameterF
lmMod <- lm(model_formula, data=traindata)
# calculate relative importance
relImportance <- calc.relimp(lmMod, type = "lmg", rela = F)
# Sort
cat('Relative Importances: \n')
sort(round(relImportance$lmg, 3), decreasing=TRUE)
bootsub <- boot.relimp(ParameterY ~ ParameterA + ParameterB + ParameterC + ParameterD + ParameterE + ParameterF, data=traindata,
                       b = 1000, type = 'lmg', rank = TRUE, diff = TRUE)
plot(booteval.relimp(bootsub, level=.95))
