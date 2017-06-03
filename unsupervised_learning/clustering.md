# Clustering

## Recommendation Systems

### Collaborative Filtering - using information from other users to make predictions

#### Advantages
* can accurately suggest complex items without understanding the nature of the items

#### Disadvantages 
* requires a lot of data about the user to make accurate predictions
* may need a lot of computer power

### Content Filtering - using the characteristics of an item to make predictions

#### Advantages
* requires very little data to get started

#### Disadvantages 
* can be limited in scope - only recommends similiar items the user has already liked so recommendations are not insightful or surprising

### Hybrid Recommendation Systems
* Netflix uses collaborative filtering and content filtering
* CF to determine which users have similar preferences then content filtering to find similiar products to those previously like but never viewed/purchased

## Clustering
* _Unsupervised learning_ - goal is to segment data into similar groups instead of prediction
* Can cluster data into similar groups and then build a predictive model for each group
* Works best with large datasets
* Overfitting is a challenge
* Hierarchical and K-Means are two common types that differ in what makes a cluster and how to find them
### How Clustering Works
#### Distance between Data Points
* Euclidean distance is the most popular method (squared root of the sum of the squared differences between independent attributes)
* Other popular distance metrics are Manhattan distance (sum of absolute values instead of squares) and Maximum Coordinate Distance (only considers measurements for which data points deviate the most)
#### Distance between Clusters 
* Minimum distance - the distance between clusters is the distance between the two points that are the closest together
* Maximum distance - computers the distance between the two clusters as the distance between the points that are the farthest appart
* Centroid distance - distance between centroids of clusters; centroid is the point that has the average of all data points in each component

#### Normalize Distance
* Distance is highly influenced by the scale of the variables, so values should be normalized first
* If variables are on the same scale this is not necessary

### Hierarchical Clustering
1. Each data point starts in its own cluster
2. Two nearest clusters are combined
3. Continue combining clusters until all points are in one cluster

_Dendrogram_ displays the hierarchical clustering process. The height of vertical lines represent the distance between points of clusters when they were combined and how the data points were combined. Data points are listed along x-axis. 
* Use to determine how many clusters should be in the final model
* Select clusters by drawing a horizontal line across the dendrogram. The number of vertical lines the cluster crosses is the number of clusters.
* The farthest the drawn horizontal can move up and down the dendrogram, the better the choice of the number of clusters is. 
* More importantly consider how many clusters make sense for the specific application (dendrogram may not be useful)
* Determine if the clusters are meaningful by looking at summary statistics for each cluster and see if the clusters have a feature in common that was not used in clustering (like an outcome)
* Ward method cares about the distance between clusters using centroid distance and the variance in each cluster

```R
# compute distance between all points
distances = dist(content[2:20], method='euclidean')

# cluster the points
contentClusters = hclust(distances, method='ward.D')

# draw dendrogram
plot(contentClusters)

# label data points with cluster
clusters = cutree(contentCluster, k=10)

# examine summary statistics by cluster
tapply(df$category, clusters, summary) 

# mean would be % of cluster in a category for binary features
tapply(df$category, clusters, mean) 
```
### K-Means
* Alternatives to hiearchical clustering: spectral clustering and k-means clustering
* Unlike hiearchical clustering, the number of clusters is chosen before the algorithm is run
* Random forest - detecting variable interaction, powerful learning algorithm
* Clustering is mostly used in the absence of a target variable to search for relationships among input variables or to organize data into meaningful groups
* Example: heart attack or not heart attack - time series - with cost bins based on total health-care cost - perform clustering on each of three cost buckets (intuition - many trajectories that lead to a heart attack)
* Measuring performance - after constructing clusters from the training set, new observations are assigned to clusters by proximity to the centroid of each cluster; record performance by recording the average prediction rate in each cluster

#### Process
1. Specifiy desired number of clusters, k
2. Randomly assign each data point to a cluster
3. Computer cluster centroids
4. Re-assign each point to the closest cluster centriod
5. Re-computer cluster centroids
6. Repeat 4 and 5 until no improvement is made

#### Practical Considerations
* Number of clusters _k_ can be selected from previous knowledge or experimenting
* Can strategically select initial partition of points into clusters if you have some knowledge of the data
* Can run algorithm several times with different random starting points

#### Understanding Cluster Patterns
* Clusters are interpretable and reveal unique patterns of diagnostic history among the population (e.g. chest pain, coronary artery disease, diabetes)
 
## Sources
*[Analytics Edge](https://www.edx.org/course/analytics-edge-mitx-15-071x-3) - Unit 6 Clustering

Content (Item) -- Category1, Category2, Category3, Category4
* values - 0 or 1
* quantity purchased - scaled
