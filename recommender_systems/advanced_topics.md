# Advanced Topics in Recommender Systems

## Multi-Armed Bandit Algorithms
* Challenge: New users and items are constantly added to the system and the system must adapt to changing data and patterns 
* Need to simulataneously _explore_ and _exploit_ the search space for recommendations
* Each recommendation for a user is an opportunity to choose between disparate strategies or algorithms that determine what to show the user
* Examples: different recommendation algorithms, which are more or less effective for different users to choose the best option for each user (e.g., recommending specific items - content recs based on clicks on previous categories of atricles - feature vector associated with each user, characterizes the interest of the user in a specific topic) 
* _Reinforcement learning_: problem in which exploration and exploitation in the search space simultaneously, of which the multi-armed bandit is a class of algorithms
* Multi-armed bandit name originates from viewing recommendation systems as an analogy to the slot-machine gambler in a casino: the gambler must choose between a number of slot machines (recommendation algorithms) and each arm of the slot machine provides a payoff with a specific probability distribution - the gambler needs to identify the machine with the largest expected payout - Playing the machines is the learning process or exploration process for the best strategy in the search space. The learning space with waste trials because it is not optimized for the best strategy. Once the gambler learns which machine has a better payoff she will play that machine to achieve better payoff
* Ex: web page recs - rec system must decide on choice of pages to recommend - when a user clicks on the link of a recommended page, the payoff is the success of a recommendation - binary payoffs (click amounts to payoff of unit 1)
* contextual information: features profiling the user or the item-context
* users clustered into groups with the cluster identifer of the group used as semantic knowledge about the user - similar users have simliar payoffs and anaylsis can be segmented group-wise

### Naive Algorithm
* Gambler plays each machine for a fixed number of trials in the exploration phase. Then the machine with the highest payoff is used forever in the exploitation phase. Similar to A/B testing except that A/B testing uses the exploration phase for evaluation and does not simultaneously explore and exploit.

#### Disadvantages
* Difficult to determine the number of trials needed to confidently predict whether a certain strategy is better than another
* Estimation of payoffs may take a long time, particularly when payoff and non-payoff events are unbalanced (e.g., low CTR)
* Large exploratory trials waste a significant amount of time and money on suboptimal strategies 
* Selecting the wrong strategy in the end perputates suboptimal outcomes
* Strategies may need to evolve over time 

### Epsilon Greedy-Algorithm
Designed to use the best strategy as soon as possible and without wasting many trials
Exploratory trials are choosen at random (with probability epsilon) from all trials and are mixed with exploitation trials
Epsilon is an algorithm parameter set by the user
(1 - epsilon) percent of trials use the strategy with the best average payoff
Epsilon should be relatively small so that exploitation can be taken advantage of 

#### Advantages
* Not trapped in the wrong strategy forever
* Exploitation starts early so the best strategy will be used most often
* Better than naive strategy in dynamic settings

#### Disadvantages 
* Determining the correct epsilon value is difficult and varys with the application 
* If items constantly enter the engine, new items are only explored occassionally an miss opportunities to obtain better payoff  
* Inefficient at learning the payoffs of new items
* Example: Arms correspond to products and customer clusters based on profiles, epsilon greedy is executed on each cluster of users so that when a rec opportunity for a user in that cluster appears, but with small values of epsilon th enew item would be shown only very occassionaly meaning many trials would be wasted before the relevance of an item to a cluster is learned

### Upper Bounding Methods
* Instead of using the mean payoff of an expected item, the item with the best _statistical upper bound_ of payoff is used
* Upper-bound is calculated by using the Central Limit Theorem (the sum of a large number of i.i.d. random variables - payoffs - converges to the normal distribution), estimate the mean and standard deviation of the normal distribution over various trials and then set the upper bound of each item at the required statistical level of confidence
* New or rarely tested items usually have larger upper bounds due to large confidence intervals and will be tested more frequently
* Increasing the number of trials reduces the width of the confidence interval and the upper bounds will tend to reduce over time
* When new items enter the system, it is tried frequently until its upper bound falls below that of one of the existing items
* Trade-off between exploration and exploitation can be managed by using specific levels of confidence (e.g. at 99% level of statistical confidence will perform more exploitation compared to 95%)
_Contextual Bandit Algorithms_ - use contextual features of the users and recommendation setting to design MAB strategies for exploration and exploitation of the search space. Gambler is shown a feature vector relevant to the trial (user or itme profile in recommendation system) and the gambler makes decisions on the slot machine (choice of recommendation strategy or choice of item) - Based on previous experience the gambler learns the contextual features and rewards of the arms related to one another based on previous experience. Contextual features provide a tool to incorporate personalization in MAB algorithms.

#### Contextual Bandit Example
Product recommendation in which the arms of the multi-armed bandit correspond to recommending different items. Each step is executed continuously over time as recommendations are made and additional examples are added to the training data.
1. Incremental Training - classification (binary result - click or no click) or regression model is trained based on past history of feature-payoff pairs to learn expected payoff of each arm. When an arm is selected by the recommender system, its feature attributes and payoff value is added to the training data set _that is specific to the corresponding arm_ .There are as many training sets and models as number of arms with the number of examples for each arm equal to the number of times that the arm was played in the past. Probablistic or statistical models are created for each arm using the training data, and expected payoff and estimated standard deviation (or maximum deviation) measures the payoff of each arm/item for a specific feature vector (context). Since arms representing newly added products will have small training sets, which will lead to larger estimated deviation of prediction. Base models for payoff prediction should be incrementally updatable b/c new-feature pairs are continually added to the training data and the base model should have the ability to output some measure of (or tight upper bound on) the expected error prediction

2. Upper-bound estimation - For the current contextual profile being shown to the recommender system, use the learned model to construct an upper bound on the expected payoff of each arm. The upper bound is computed as the linear sum of the expected payoff and an approximate multiple of standard deviation. Choice of deviation measure depends on the each of computing it which the available model (standard deviation or tight upper bound on the maximum deviation)

3. Select the arm with the largest upper bound and recommend the corresponding item to the user. 

#### Advantages
* No need to set a parameter to divide trials into two categories
* Exploration and exploitation are achieved simultaneously since the item with the largest upper-bound is used

#### Disadvantages
* Determining a statistical upper-bound can be difficult

## Active Learning in Recommender Systems
### Overview
* Recommendation systems are heaviliy dependent on historical data provided by the user
* Very sparse rating matrices or labels make meaningful recommendation challenging, especially at start-up (e.g., cold-start problem)
* We need to quickly acquire more ratings/labels to build up the ratings matrix/training set
* _Active-learning systems_ choose specific user-item combinations for which to acquire ratings in order to maximize the accuracy of predicted ratings
* Ratings by least-rated categories
* Active learning is used frequently in classification (think of content-based methods as classification problems on user-specific training data, similarly classification needs labels whereas collaborative filtering needs ratings)

### Heterogeneity-Based Models
* Goal is to find user-item combinations that have the most _uncertain predictions_ 
* CF methods are adapted from classification methods

### Judging the Level of Uncertainty
1. _User-based neighborhood approach_ - variance of the prediction of user-item combination can be calculated as the sample variance of the ratings of the peer users of a customer for a specific item. Sample variance is infinity if no peers have rated the item.
2. _Item-based neighborhood approach_ - ratings of user _i_ of the most similar items of _q_. If a user has not rated any of the similar items of _q_, sample variance is infinity. Tends to guide the user towards rating different items and naturally increases the coverage of the recommender system - adjusts well in the cold-start setting.
3. _Bayesian Classifier_ - Prediction of 1 has a posterior probablity of _p_ with uncertainty qualified as 1 - |_p_ - 0.5|. The item with the largest uncertainty value is selected for learning. Idea is that the predicted probablities closest to the threshold value of 0.5 are the most uncertain.
4. _Ensembles_ - a rating is uncertain when different models product different predictions. The variance of the prediction over the different models can be used to quantify the uncertainty.
5. _CF_ - consider combining additional factors with the uncertainty level in a heuristic/multiplicateively manner: exclude the most popular items since their ratings are not necessarily representative of the other items and include a factor for the probability that a user is likely to rate an item (users cannot provide ratings for items they have not yet consumed)

### Performance-Based Models
* Data points are queried so that the prediction on the _remaining entries_ provide the _best expected performance_ or _certainty_ after incorporating the newly queried rating matrix
* For _currently available_ data points, goal is to increase prediction accuracy and reduce the uncertainy of the predictions
* Focus on the _differential_ impact of the _added_ instance to the predictions of the _currently available_ entries
* Calculate expected performance using Bayesian methods
## Computational Advertising
* User actions are treated as implicit feedback with the frequency of user actions treated as "ratings"
* Discrete set of categories for a fixed set of contexts, which can define a three-dimensional ratings mapping:  _U_ x _I_ x _C_ provides implicity feedback rating 
* Example: Newspaper where articles have been categorized into specific topics. When users click on specific ads relating to a particular topic on the page
* Cost-sensitive variations of collaborative filtering - items with higher payoffs are prioritized over others (e.g. ranking predictions in terms of expected payoff, rather than expected probability of a click or purchase)
* Query items that have been rated sparsely by the users
* More refined - entries of the matrix are selected on the basis of the particular combination of users and items (based on ideas in classification literature)

### Multi-armed Bandit in Advertising
MAB methods are particularly useful is settings where:
1. New items enter the system all the time
2. The payoffs of selecting a particular strategy can be precisely computed

* For extremely transient products, exploration and explotation are used simulataneusly 
* Contextual bandit methods in which the context of the advertisement (e.g., search query keywords or web page on which the ad is displayed) is used to determine whether to serve the ad or not

## Reciprocal Recommender Systems
* _Reciprocal recommendations_ - the system must change when one needs to consider the utility of the recommendation to multiple stakeholders with asymmetric interests
* Example: online dating

## Further Reading
### Active Learning Further Reading
#### _Data classification: algorithms and applications_. C. Aggarwal - 2014
#### _Data mining: the textbook_. C. Aggarwal- 2015
Rational against querying popular products [513] 

### Multi-Armed Bandit - Upper Bounding Methods
#### _A contextual-bandit approach to personalized news article recommendation algorithm_. L. Li., W.Chu, J. Langford, and R.Schapire - 2010
* LinUCB algorithm - linear regression algorithm for learning the expect payoff using a tight upperbound on the deviation (easier to estimate)
#### _Non-stochastic bandit slate problems_. S.Kale, L.Reyzin, and R. Schapire - 2010
* _Slate_ setting for ranked list predictions

