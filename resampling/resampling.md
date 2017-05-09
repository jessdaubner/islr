# Resampling Methods
* Goal: Assess the quality of model predictions 
* Resampling is the process of repeatedly drawing samples from a training set and refitting a model on each sample for the purpose of obtaining more information about the fitted model.
* Examining the differences in evaluation metric variability between training samples can provide better insight on model performance than fitting the model on only one training sample
* Cross-validation and bootstrapping are the most common resampling methods
* _Model selection_ is the process of selecting the proper level of flexibility for a model
* _Model assessment_ is the process of evaluating model performance 
* Cross-validation is used to estimate the test error associated with a model
* Bootstrap is most commonly used to calculate a measure of accuracy of a parameter estimate or of a model

## Cross-Validation
* _Test error rate_ is the average error rate of the model calculated on observations unseen by the trained model 
* _Train error rate_ is the average error rate of the model calculated on the training set; can drastically underestimate test error rate
* Cross-validation methods estimate the test error rate by holding out a subset of the training data from the model fitting process, and then making predictions on the held-out data
* When working with real-world data we can never know the _true_ test error rate, but with simulated data we can determine the accuracy of cross-validations methods
#### Cross-Validation Use Cases
1. Determine how well a model performs on unseen data (test error rate matters)
2. Identify the model or algorithmm that produces the lowest test error rate (the location of the point on the minimum estimated test error curve matters more than the actual estimated value) 

### Validation Set Approach
* The validation set approach simply involves randomly dividing available data points into a training set and _validation set_ or _hold-out set_. Model is fit on the training set and the fit model is then used to predict the response variable on the hold-out set
* Train-test split is 50-50
* The validation set error rate provides an estimate of the test set error rate
* MSE is usually used for regression problems

#### Disadvantages
1. Validation estimate of the test error rate can vary significantly depending on the random split.
2. Model fit typically improve when given access to more data; thus, the validation set error rate may overestimate the actual test set error rate for the model fit on the entire data set.

### Leave-One-Out Cross-Validation (LOOCV)
* LOOCV splits the set of observations into two parts, but for each split only one observation is held-out while n-1 are included in the training set
* MSE is calculated for the single held-out observation, producing an approximately unbiased estimate for the test error.
* Test set error rate is then estimated as the average MSE of the _n_ validation sets. 
* Can be computationally intensive to fit the model _n_ times
* With least squares linear or polynomial regression a shortcut is available that makes estimating the test MSE the same a fitting a single model 

#### Advantages
1. Overestimates the test set error rate to a lesser degree than a single validation set would 
2. Will always produce the same estimate for MSE

#### Disadvantages
1. If _n_ is large and the model is computationally intensive, LOOCV will be computationally expensive
2. Model outputs are highly positively correlated with each other because each model is trained on nearly the same data, which results in higher variance

### k-Fold Cross-Validation
* _k_-fold randomly splits the data set into _k_ groups or _folds_ of approximately equal size
* First fold is set aside as the validation set and the model is fit on the remaining k - 1 folds
* _k_ estimates of MSE are calculated and the overall test MSE estimate is an average of the fold MSE estimates
* LOOCV is a special case of _k_-fold CV where _k_ is equal to _n_
* Practically, _k_ = 5 or _k_ = 10 are used*

#### Advantages
1. Can be less computationally expensive than LOOCV since model is only fit _k_ times
2. Less variability in test error estimate than with a single validation set
3. More accurate than LOOCV due to bias-variance trade-off (overlap between training sets is less extreme than with LOOCV resulting in less correlated models**)

### Cross-Validation: Classification vs. Regression 
* Generally, MSE is used for regression problems and the number of misclassified observations are used for classification 

## The Bootstrap
* The _bootstrap_ is used to estimate the uncertainty associated with a given estimator or algorithm 
* Example: estimating the standard errors of coefficients from a linear regression fit (R does this automatically)
* Can be applied to many algorithms, especially useful when a measure of variability is not otherwise easily available  
* 

*These values have been shown to suffer from neither very high variance nor very high bias
**mean of highly correlated quantities have higher variance than less correlated quantities

Misc. Notes:
* Polynomial degree 1: linear
* Polynomial degree 2: quadratic 
* Polynomial degree 3: cubic 
* Polynomial degree 4: quartic 
