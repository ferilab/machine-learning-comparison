# All the methods are tested using the test set of mnist_27 and their accuracies are compared.
# At the end, an ensemble of all these methods is used based on majority vote and it accuracy is compared to the methods.

library(tidyverse)
library(gam)
library(caret)
load('rdas/mnist_27.rda')
load('rdas/train_all')
load('rdas/models')

predictions <- sapply(1:23, function(i){
  predict(train_all[i], mnist_27$test)
})

result_all <- matrix(unlist(predictions), nrow = 200)

Acc <- sapply(1:23, function(i){
  y_hat_tech <- predict(train_all[i], mnist_27$test)
  confusionMatrix(y_hat_tech[[1]], mnist_27$test$y)$overall["Accuracy"]
})
methods_acc <- tibble(models, Acc)
print(methods_acc, n=23)

# Now build an ensemble prediction by majority vote and compute its accuracy

m <- as.numeric(result_all)
m <- matrix(m, 200,23)
maj_vote <- as.data.frame(rowSums(m)) %>% rename(vote = `rowSums(m)`) %>% 
  mutate(vote = ifelse(vote < 106, 2, 7)) # for 7 to be in majority, it needs at least 12 votes (12x7+11x2=106)
temp <- as.list(maj_vote)
temp <- factor(temp[[1]])
ensemble_acc <- confusionMatrix(temp , mnist_27$test$y)$overall["Accuracy"]

methods_acc %>% ggplot(aes(models, Acc)) +
  geom_point() + 
  geom_abline(intercept = ensemble_acc, slope = 0, color = 'red') +
  ggtitle('Performance comparison: methods (dots) and majority vote (red line)') +
  xlab('Method') +
  ylab('Accuracy') +
  coord_flip() +
  ggsave('fig/methods_acc.png')
