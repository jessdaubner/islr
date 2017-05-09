# Lab: Cross-Validation and the Bootstrap
library(ISLR)
library(boot)

# set seed of R's random number generator so that results are reproducible 
set.seed(1)
# create train and validation set with 50% of data, respectively
train = sample(392, 196)
lm.fit = lm(mpg ~ horsepower, data=Auto, subset=train)
mean((Auto$mpg - predict(lm.fit, Auto))[-train]^2)

# Fit linear model with quadratic and cubic terms
lm.fit2 = lm(mpg ~ poly(horsepower,2), data=Auto, subset=train)
mean((Auto$mpg - predict(lm.fit2, Auto))[-train]^2)
lm.fit3 = lm(mpg ~ poly(horsepower,3), data=Auto, subset=train)
mean((Auto$mpg - predict(lm.fit3, Auto))[-train]^2)

# LOOVC is automatically computed using glm() and cv.glm()
# glm() without family specified is equivalent to lm
glm.fit = glm(mpg ~ horsepower, data=Auto)
coef(glm.fit)
cv.err = cv.glm(Auto, glm.fit)
cv.err$delta
