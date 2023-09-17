#Credit Card Fraud Detection On Sample Dataset

# Install Packages 
# install.packages("ranger")
# install.packages("caret")
# install.packages("caTools")

# Importing Libraries     

library(ranger)
library(caret)
library(data.table)

#Lets Load the Dataset for analysis
data = read.csv("creditcard.csv")

# Explore the data
data.table(data)

#Doing random summary statistical for better understanding of data
summary(data)
table(data$Class)
names(data)

#Summary of amount
summary(data$Amount)
sd(data$Amount)
IQR(data$Amount)
var(data$Amount)

#Manipulation
data$Amount = scale(data$Amount) #Normalization

#Removing time from data
data2=data[,-c(1)]
head(data2)

set.seed(12)
library(caTools)

sample_data = sample.split(data2$Class,SplitRatio = 0.80)
train_data = subset(data2,sample_data == TRUE)
test_data = subset(data2, sample_data == FALSE)


dim(train_data)
dim(test_data)

#Fit Logic on data
Logistic_Model = glm(Class~.,test_data,family = binomial())
summary(Logistic_Model)


plot(Logistic_Model)

Logistic_Model1 = glm(Class~.,train_data,family=binomial())
summary(Logistic_Model1)

plot(Logistic_Model1)

# We need ROC curve
library(pROC)
lr.predict = predict(Logistic_Model1,test_data,probability = TRUE)
auc.gb = roc(train_data$Class,lr.predict,plot=TRUE,col="green")


#So we have almost 90% accuracy
# Fit a decision Tree
library(rpart)
library(rpart.plot)

desicion_model = rpart(Class~.,data, method = "class")
predicated_val= predict(desicion_model,data, type = "class")
probability = predict(desicion_model,data,type ="prob") # Spelling typo i had made
rpart.plot(desicion_model)

#Doing small NN
library(neuralnet)
NN_model = neuralnet::neuralnet(Class~.,train_data,linear.output = FALSE)
plot(NN_model)

predNN =compute(NN_model,test_data)
resultNN = predNN$net.result
resultNN =ifelse(resultNN>0.6,1,0)

