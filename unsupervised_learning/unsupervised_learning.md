# Unsupervised Learning
* Recall: Supervised learning - predict _Y_ given _X1_, _X2, ...,  _Xn_
* Only a set of features _X1_, _X2, ...,  _Xn_ with no corresponding response variable _Y_
* Goal is to produce insightful data visualizations or discover sub-groups or hiearchies in the data
* Challenging b/c highly subjective with no clear goal such as predicting a response - no way to check our work by seeing how well the model predicts _Y_ on observations not used in fitting the model
* Often performed as part of an exploratory data analysis
* Examples: e-commerce site identifying groups of customers with similar browsing and purchase history and items that are of interest to shoppers within each group (individual shoppers can then be shown items of interest based on past history of other similar shoppers), groups or sub-groups of genes associated with breast cancer, search results displayed based on history of similar users
* PCA and clustering are two common unsupervised learning methods that aim to simplify data through a small number of summaries. There methodology differs in that clustering identifies homogenous subgroups while PCA finds low-dimensional representation of the data that explain a large amount of variance.

## Principal Component Analysis
* Goal: Produce informative data visualizations or method for pre-processing the data before supervised algorithms are used
* Use-Case: large set of correlated variables, PCA can summarise the set with a smaller number of representative variables that collectively explain most of the variance in the original set 
* Principal Component regression - principal components as predictors in regression model in place of the original variables
* Principal Component Analysis - compute principal components and use the components to understand the data
* Produces derived variables for use in supervised learning, tool for data visualization

### Principal Components
* Use-Case: Visualize _n_ observations using _p_ number of features for EDA, when _p_ is large
* Use 2-D scatterplots, but if _p_ is large it is not possible to look at all of the plots (e.g., _p(p-1)/2_) and each plot would contain only a small amount of information in the dataset anyway
* PCA finds a low-dimensional representation of the data set that contains the maximum amount of variation
* Idea: Each observation exists in a p-dimensional space, but not all of the dimensions are equally informative
* The informative or usefulness of a dimension is measured by the amount that the observations vary along each dimension
* Each dimension found by PCA is a linear combination of the _p_ features

#### Principal Component Process


## Clustering
* _Clustering_ is a high-level term for algorithms that identify sub-groups or clusters within a dataset
* Goal: Divide the data set into distinct groups so that the observations within each group are similar or homogenous and observations in different groups are disimilar or heterogenous; discover structure (distinct clusters) within the data set
* Base on domain-knowldege, define what makes two observations similar or different
* Example: Market segmentation based on demographics of customers (income, occupation, zipcode, etc.), goal - identify subgroups of people more receptive to certain forms of advertising or more likely to purchase a particular product
* K-means and hiearchical clustering are two of the most popular clustering methods
* Two ways to cluster:
1) Cluster observations by features in order to identify sub-groups among observations
2) Cluster features by observations in order to discover sub-groups amoung features

### K-Means Clustering
* K-means partitions the data into a pre-set number of distinct, non-overlapping partitions, _k_
* _Good_ clustering is defined by minimal _within-cluster variation_ 
* Assumes that each observation belongs to at least one of K clusters and cluster are non-overlapping or mutually exclusive 

#### K-Means Clustering Algorithm
1. Randomly assign an initial cluster assignment, a number from 1 to _K_, to each of the observations
2. Iterate until the cluster assignments stop changing:


* Common measure of variance is _squared Euclidean distance_; within-cluster variation is defined as the sum of all the squared pairwise squared Euclidean distances between the observations in the _kth_ cluster, divided by the number of observations in the _kth_ cluster

#### Disadvantages
* Sensitive to initialization
* Can fall into local-minima
* Choosing the right number of clusters is hard
* No guarantee of recovering ground truth

### Hiearchical Clustering
* We do not know who many clusers should be identified
* Produces a tree-like visual representation of the observations that displays the clusters obtained for each possible number of clusters 1 to _n_, called a _dendrogram_

* Goal: Discover unknown sub-groups in the data

###Source
* ISLR - Chapter X: Unsupervised Learning
