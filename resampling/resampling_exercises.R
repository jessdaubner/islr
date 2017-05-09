install.packages('ISLR')
library(ISLR)

model = glm(default ~ income + balance, family='binomial', data=Default)
train, test = randomSample()

