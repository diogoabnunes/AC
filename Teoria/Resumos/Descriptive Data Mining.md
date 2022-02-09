# Resumos AC | Descriptive Data Mining

## 7. Clustering

Descriptive Analytics
- goal: describe/summarize or finding structure on what we have observed: data summarization and visualization can be seen as simple forms of descriptive analytics; however, most frequently descriptive modeling is associated with clustering.

Similarity measures:
- related with distance between observations;
- numerical measure of how alike 2 data objects are;
- higher when objects are more alike;
- euclidean distance, manhattan distance, minkowski distance, heterogeneous distance functions, general coefficient of similarity.

Clustering: obtain "natural" grouping of a set of data:
- key issue: notion of similarity;
- observations on the same group are supposed to share some properties (being similar);
- provide abstraction of the found groups.
- applications: biology, business and marketing, web mining.
- methods:
  - partitional: divide the observations in k partitions according to some criterion;
    - goal: minimize intra-cluster distance and maximize inter-cluster distances.
    - hard clustering: an object belongs to a single cluster;
    - fuzzy clustering: each object has a probability associated to belong to each cluster.
    - k-means: uses squared Euclidean distance, maximizes inter-cluster dissimilarity:
      - advantages: scales well, frequently works well.
      - disadvantages: doesn't ensure optimal clustering, different solutions with different starting points, initial guess of k may be away from real optimal k.
    - clustering validation:
      - supervised: compare obtained clustering with the external information available;
      - unsupervised: measure the quality of clustering without any information on the "ideal" structure of the data (cohesion and separation coefficients).
  - hierarchical: generate a hierarchy of groups, from 1 to n groups (n no. of lines in the data set):
    - agglomerative: bottom-up;
    - divisive: top-down (less used).

## 8. Association Rules

Data Mining Tasks:
- Predictive: classification, regression, ...
- Descriptive: clustering, association rules (find relationships/associations between groups of variables), ...

Goals: store layout, promotions.

Actionable Knowledge:
- Rules discovered from business records;
- Discovery (mining) can be made off-line;
- Use of rules can be made on-line;
- A set of observations may fire a rule that is not necessarily causal.
- Usage: most visited pages, frequent page sets, pages associated to users, seasonal effects, cross-preferences.

Basic Concepts: (X → Y; sup(X) is proportion of transactions in D that include X)
- Support: importance of a set:
  - percentage/number of transactions t containing the set S;
  - sup(X → Y) = sup(X ∪ Y).
- Confidence: strength of a rule:
  - percentage of transactions t that follows the rule;
  - conf(X → Y) = sup(X ∪ Y)/sup(X)

Mining AR: given D (data set of transactions), minsup (minimal support) and minconf (minimal confidence), obtain all association rules X → Y such that Sup >= minsup and Conf >= minconf.
- Apriori Algorithm: frequent itemset generation (support >= minsup) and rule generation (confidence >= minconf).
- Improvement (of a rule): minimum difference between its confidence and the confidency of any of its immediate simplifications.
- Interesting rule: unexpected (deviation from the expected or from the initial belief) and useful (estimated benefit).
- Subjective measures: based on user's belief in the data;
- Objective measures: based on facts, statistics and structures of patterns, independent of the domain considered.
- measures of interest:
  - LIFT:
    - ratio between confidence and support of itemset in consequent;
    - lift(A → B) = (conf(A → B))/sup(B) = (sup(A ∪ B))/(sup(A)sup(B))
    - if 1, independent; <1, negatively correlated; >1, positively correlated.
  - conviction:
    - proposed to tackle some of the weaknesses of confidence and lift;
    - sensitive to rule direction; 
    - conviction(A → B) = (1-sup(B))/(1 - conf(A → B)) = (sup(A)sup(¬B))/(sup(A ∪ ¬B))
    - if 1, independence between A and B; high -> consequent depends strongly on the antecedent.