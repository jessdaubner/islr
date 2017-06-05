# Understanding and Applying Logistic Regression

## Overview
* Given causes/explanatory or independent variables/features predict _probability_ of effect/dependent variable
* Forecasting and classifying are important applications of linear regression
* Examples:
....* survival rate of titanic passengers based on gender, passenger class, age
....* classifying email as spam or financial activity as fraud 
....* forecasting market increase or decrease on next trading day based on oil prices, gdp growth, interest rates 
* Logistic regression uses the S-curve to estimate probabilities
* Logistic regression curve involves finding the "best fit" to the S-curve:
....* Logit function: p(y) =  1 / 1 + e<sup>-(Ax + Bx<sub>i</sub>)</sup> 
....* A is the intercept
....* B is the regression coefficient
....* _e_ is a constant term 2.71828, the base of the natural logarithm  

## Logistic Regression vs. Linear Regression
1. Objective of regression is to find the intercept and beta coefficients that "best fit" the data
....* in linear regression the line of "best fit" minimizes the variances of residuals (difference between actual and predicted values of y)
....* in logistic regression, maximizes the likelihood of the data 
2. In linear regression, y must be continuous whereas in logistic regression y is a categorical variable
3. Assumption of linearity
....* in linear regression, the relationship between the independent and dependent variables are assumed to be linear
....* in logistic regression, the relationship between the independent and dependent variables can be made linear by log transformation (e.g., ln(p(y<sub>i</sub>) / 1 - p(y<sub>i</sub>)) = A + Bx<sub>i</sub>)  
4. Both solve regression problem using cookie-cutter solvers
....* Linear regression uses least squares
....* Logistic regression uses maximum likelihood estimation
5. Residuals 
....* _Residuals_ or error terms of a regression line are the difference between actual and fitted values of the dependent variable, e<sub>i</sub> = y<sub>i</sub> - y^<sub>i</sub> (e.g., solving y = Ax + Bx<sub>i</sub> or p(y) = 1 / 1 + e<sup>-(Ax + Bx<sub>i</sub>)</sup> with A and B as constants is impossible so we add the term e<sub>i</sub>)
....* Linear regression minimizes the values of the residuals or error terms (e<sub>1</sub>...e<sub>n</sub>) and assumes that the residuals are normally distributed
....* Not possible for logistic regression residuals to be normally distributed since residuals can only have values of 0 (correctly predicted) or 1 (incorrectly predicted). Uses maximum likelihood estimation.
6. Unlike linear regression, no standard R-squared is defined for logistic regression
....* No direct way to calculate R-squared for linear regression
....* Several pseudo-R-squared calculations exist that are similar in philosophy to linear regression R-squared

## Logistic Regression vs. Rules-Based Classifiers
* Rules-based apporach would take into account the definition, taxonomy (set of rules for classification) prepared by human experts 
* ML-based systems are dynamic not static
* Experts are not required
* Training samples (corpus) are required

## Logistic Regression Assumptions
1. 
2.
3.
4.
5.

## Odds with Logistic Regression
* Logistic regression takes its name from the fact that the log of the odds of the probabilities are linearly related to the explanatory variables
* the log of the odds of a particular event can be explained linearly (e.g., ln(p(y_i) / 1 - p(y_i)) = A + Bx_i)
* Logit function: logit(p) = A + Bx_i, where logit(p) = ln(p / 1 - p) 
### S-Curve/Logarithmic Function
* Linear regression line: y = A + Bx + e
* Logistic regression curve: p(y) = 1 / 1 + e<sup>-(A+Bx_i)</sup>

## Solving Logistic Regression Problem 
### S-Curve
* Logistic regression fits an S-curve between probabilities and causes
#### Why use S-curve?
* S-curves have a standard mathematical form that is easy to estimate (e.g. find the "best" values of parameters A and B)
* Shape of an S-curve resembles that of a binary (0/1) step-function
* Flattens out at both ends, exactly as probabilities do
* Shape of S-curve coincides with our intuitive understanidng of how probablities are altered by causes
* _Tipping Point_: A point in time when a group, or a large unumber of group members, rapidly and dramatically chages its behavior by widely adopting a previously rare practice (e.g., diffusion of new technology or innovation)
* Diffusion of innovation: adopters vs. market share percentage follows an S-curve, initially only innovators adopt technology until penetration hits about 16% ("going viral threshold") then usuage picks up  
* S-curves are widely studied and well understood in business
* S-curve function flattens at ends, has a ceiling of 1 and floor of 0 (not satisfied using a linear function), binary categorical variables do not work well with
* S-curve is only "S-shaped" if A and B are _positive_
....* If x is negative infinity, p(y) = 0 and if x = positive infinity, p(y) = 1
* S-curve flips (backwards S) if A and B are _negative_
....* If x is negative infinity, p(y) = 1 and if x = positive infinity, p(y) = 0
* In the middle of the S-curve, the probabilities of outcome changes rapidly with eveery change in value of the independent variable, especially around p(y) = 0.5

Two equivalent methods of fitting S-curves are commonly used:
### Maximum Likelihood Estimation (MLE)
* Solve the S-curve equation by finding the best possible values of the constants A and B use MLE
* Thought experiment: flip a coin several times, where p(heads) = p<sub>i</sub> is and p(tails) = 1 - p<sub>i</sub>
....* Results are independent so probability of outcomes can be multiplied so overall likelihood of getting these results are p<sub>1</sub> * p(1-p<sub>2</sub>) * ...
....* Simplified this can be written as 
* MLE is a simple optimization problem
* MLE is used to solve the logistic regression problem; it enables us to determine constants A and B, which maximize the likelihood of getting a results like those encountered in the data
* RECALL: Log of a product is the sum of the logs, ln(xy) = ln(x) + ln(y)


### Logit Function
* Logistic regression can be solved via _linear regression on the logit function_ (log of the odds function)
* Logit function: ln(p) / ln(1-p), term used to describe the log of the odds
* ln(p(yi) / 1-p(yi)) = A + Bxi -> making relationship linear by log transformation
* Odds(p) = p / 1-p
* In logistic regression, p = 1 / 1 + e-(A+Bx) so odds(p) = e^ A + Bx
logit(p) = A + Bx, where ln(Odds(p)) = ln(p) - ln(1-p) is called the logit function
* Logit is linear = logit(p) = A + Bx (transformed logistic regression to linear regression) so that the regression line logi(p) = A + Bx
* Methods of least squares is mathematically equivalent to maximum likelihood estimation
* Method of moments can also be used to estimate linear regression and in some situations will yield different answers

## Binomial and Multinomial Logistic Regression
Binomial logistic regression (two categorical outcomes) is easily extended to multinomial logistic regression (more than two categorical outcomes)
* Run multiple logistic regressions for each category and assign the label with the highest probability

## Linear Regression in Practice
Predicting whether Google stocks price returns will increase for a given month
### Never Regress Non-Stationary Data
* Smoothly trending data (i.e., exponential, polynomial relationships) will lead to poor quality regression models
* Take first differences of smooth data converting either to returns (y^<sub>12</sub> = (y<sub>2</sub> - y<sub>1</sub>) / y<sub>1</sub>) or log differences (y^<sub>12</sub> = log<sub>y2</sub> - log<sub>y1</sub>
Python vs. R
* standard errors and p-values
### Python
* Add a column of 1s to the x-variables. Required in Python for regression (statsmodels excludes intercept by default, unlike glm in R)
* `Nan` stands for not a number
* numpy arrays are the standard input for statsmodel functions
```python
dataFrame.pct_change() # returns a new data frame with the % changes of adjacent data points method in order to get back the returns.
* in R, negative indices represent rows and columns to be excluded
* in Python, negative indices represent represent elements measured from the end of the data
....* Backward indices: index -1 to index -n
....* Forward indices: index 0 to index n-1
* R does not use zero-based indexing, Python does
* pandas is essentially an implementation of the R dataframe abstraction
