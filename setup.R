# This code installs and loads the necessary packages and libraries, then saves the dataset in rda format.

### Specific packages to initialize R: the necessary packages 
# You may need to install the following packages 
# (or more, depending on your already-installed ones).
# And we need to check out all (specially these algorithms) one by one to make 
# sure if they all work or need anything to be installed first:
# "kknn", "gam", "rf", "wsrf", "Rborist","avNNet", "gbm", "adaboost"
### you may skip this if you have them already installed on you computer.

# install.packages('e1071')
# install.packages("GAMBoost")
# install.packages("mboost")
# install.packages('kknn')
# install.packages("LiblineaR")

# Libraries to load

library(e1071)
library(GAMBoost)
library(mboost)
library(gam)
library(kknn)
library(LiblineaR)

### General libraries to load
# And these are the general ones that you need to call anyway

library(tidyverse)
library(dslabs)
library(caret)
library(randomForest)
library(rpart)
library(Rborist)

mnist_27 <- data(mnist_27) %>%
save(mnist_27, file = 'rdas/mnist_27.rda')

models <- c("glm", "lda", "naive_bayes", "svmLinear", "gamboost",
            "gamLoess", "qda", "knn", "kknn", "loclda", "gam", "rf",
            "ranger","wsrf", "Rborist", "avNNet", "mlp", "monmlp", "gbm",
            "adaboost", "svmRadial", "svmRadialCost", "svmRadialSigma")
save(models, file = 'rdas/models')



