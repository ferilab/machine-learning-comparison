# This code trains all he defined methods (in setup.R) with their default parameters using
# the train set of mnist_27 

load('rdas/mnist_27.rda')
load('rdas/models')

train_all <- map(models, function(method){
  train(y ~ x_1 + x_2, data = mnist_27$train, method = method)
})
save(train_all, file = 'rdas/train_all')
