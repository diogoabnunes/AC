# Resumos AC | Predictive Data Mining

## 2. Classification Introduction

Predictive: classification for targeting.

Data for classification:
- target (or dependent) variable;
- independent variable (or attributes);
- some data has the target variable filled, so we can train the model;
- some data has the target variable to fill, so we can test the model and make predictions.

Model: classification tree (or decision tree).

Classification: applying a model to new cases.

Classifier Evaluation:
- confusion matrix (prediction vs. reality);
- error rate: percentage/proportion of cases where the model misses.

Overfitting: 
- decreasing the training error doesn't mean the model is bettern on new cases;
- a model too adjusted to training cases is overfitted;
- an overfitted model generalizes poorly.

Classification for scoring:
- binary classification:
  - direct application of the model splits examples into classes;
  - not suitable for all problems;
  - scoring: use estimated probability of buying to other cases;
  - score also provides information about (un)certainty of prediction.
- evaluation:
  - ROC (Receiver Operating Characteristic) analysis: visualize proportion TP vs. FP.

## 6a. Classification and Algorithms

ML algorithms:
- Linear Classifiers:
  - for N classes, fit N-1 lines;
  - if above line, class is A; if below, class is B;
- Nearest Neighbors:
  - find the nearest neighbor and class is equal to that neighbor;
  - KNN algorithm: generalization, where K identifies the nearest K instances, each one represents a vote and class is equal to the majority of nearest K instances;
  - Advantages:
    - Simple to implement;
    - Handles correlated features;
    - Defined for any distance measure;
    - Handles streaming data trivially.
  - Disadvantages:
    - Sensitive to irrelevant features/attributes;
    - Slow classification time for large datasets;
    - Works best for real valued datasets.
- Decision Tree Classifiers:
  - Advantages:
    - Easy to understand;
    - Easy to generate rules.
  - Disadvantages:
    - Overfitting the training data: too many branches (anomalies due to noise or outliers) and poor accuracy for unseen samples;
    - Doesn't handle correlated features very well;
    - Can be quite large: purning is necessary.
- Naive Bayes:
  - Bayes theorem: probability of instance d being in class cj;
  - p(cj|d) = (p(d|cj)*p(cj))/p(d)
  - If attributes have independent distributions: p(d|cj) = p(d1|cj) * ... * p(dn|cj)
  - Advantages:
    - Fast to train and to classify;
    - Not sensitive to irrelevant features;
    - Handles real and discrete data;
    - Handles streaming data well.
  - Disadvantages:
    - Assumes independence of features.
- Neural Networks:
  - set of neurons (input/output units) connected with weights;
  - supervised learning: adjust weights to ensure outputs to given inputs are the expected ones;
  - predicting: feed input values and collect outputs.
  - Advantages:
    - Universal: fit any continuous function;
    - Versatile: output may be one or more discrete and real values;
    - Online: applicaation and learning are intertwined;
    - Robust: errors and noisy data;
    - Fast: application to new examples;
    - Parallel.
  - Disadvantages:
    - Slow training;
    - Low usability: empiprical parameter tuning, network topology and learning rate;
    - Low interpretability: understand the weights;
    - Low adaptability: not easy to incorporate domain knowledge.
  - Universal approximator:
    - mlps are a class of universal approximators: 1 hidden layer;
    - so what's the catch? provided sufficiently many hidden units.
- Support Vector Machines:
  - linear learning machines with maximization of margin: better separation between classes;
  - duality: higher robustness to the curse of dimensionality;
  - kernel trick: non-linear models;
  - geometric intuition;
  - elegant math;
  - theoretical guarantees;
  - pratical algorithms.

## 6b. Regression

Linear regression: interpretation and algorithm:
- simple case: 2 variables, x y;
- linear equation: y = f(x) => y = b0 + b1*x;
- b0: intersection of the line with the yy axis;
- b1: slope of the line;
- assumes not correlated variables;
- variation depends on the degree of correlation;
- empirical results show robustness;
- assumptions:
  - linear relationship between x and y (also additive);
  - errors independently and identically distributed.

Evaluation of regression models:
- give x, model estimates y;
- erro: true value - value estimated by the model;
- erro: might be mean absolute error, mean squared error (never mean error);
- values depend on the scale of the target variable;
- if we know nothing about the cases => trivial model (mean): regression is only useful if its error is lower than the one obtained with the trivial prediction.

Other algorithms:
- Nearest Neighbor for Regression:
  - find kNN (just like for classification);
  - predict the average of their target values (instead of majority voting).
- Decision Trees for Regression: 
  - train: splitting criterion based on the sum of the variances (instead of gini or entropy);
  - prediction: average of targets in the leaf (instead of majority voting).
- Neural Networks for Regression:
  - single output node (predicted y = score);
  - continuous activation function (ex: sigmoid: also used for classification).
- SVM for Regression:
  - margin: minimize the tube "around" the data (instead of maximizing the distance to closest examples from each class);

## 9. Recommender Systems

Purpose and success criteria:
- Retrieval: users know in advance what they want, provide "correct" proposals, reduce search costs;
- Recommendation: itemss unknown to users;
- Prediction: predict to what degree users like an item;
- Interaction: give users a "good feeling", convince/persuade users;
- Conversion: increase "hit", "clickthrough" rates, optimize sales margins and profit.

Recommender systems:
- given user model (rating, preferences, demographics, situational context) and items (with or without description of item characteristics), find relevance score (tipically used for ranking);
- relation to Information Retrieval: IR is finding material of an unstructured nature that satisfies an information need from within large collections;
- paradigms:
  - reduce information overload by estimating relevance;
  - personalized recommendations;
  - collaborative;
  - content-based;
  - knowledge-based;
  - hybrid: combinations of various inputs and/or composition of different mechanism.

Collaborative filtering:
- pure CF approaches:
  - input: matrix of given user-item ratings;
  - output types:
    - degree to what the current user will like/dislike a certain item;
    - top-N list of recommended items.
- user-based nearest-neighbor:
  - basic algorithm:
    - given an "active user" u and an item i not yet seen by u:
      - find a set of users (peers/nearest neighbors) who liked the same items as u in the past and who have rated item i;
      - combine their rating to predict if u will like item i (ex: average);
    - repeat for all items that u has not seen;
    - recommend the best-rated items.
  - basic assumptions:
    - if users had similar testes in the past they will have similar tastes in the future;
    - user preferences remain stable and consistent over time.

Evaluation:
- business questions (customers like/buy recommended items?) lead to empirical evaluation (is the approach efficient with respect to user satisfaction, response time, ...?) during development and in deployment;
- No-Free-Lunch Theorem: theoretical finding that suggests all optimization algorithms perform equally well when their performance is averaged over all possible objective functions.
- offline evaluation:
  - data collected in your problem, benchmark datasets;
  - training set: randomly selected share of known users and build the model;
  - testing set: remaining share of withheld users, recommendations based on observed items (compared to hidden items);
  - perhaps taking time into account rather than randomly and removing useless data.
- metrics: recommendation is viewed as informational retrieval task:
  - all good items: TP + FN;
  - all recommended items: TP + FP;
  - precision: TP/(TP+FP);
  - recall: TP/(TP+FN);
  - when a recommender system is tuned to increase precision, recall decreases as a result;
  - f1: 2*(precision*recall)/(precision+recall);
  - rank metrics: extend recall and precision to take the positions of correct items in a ranked  list into account (relevant items first in recommendation list);
  - Normalized Discounted Cumulative Gain (i won't even try to understand sorry);
  - average precision;
  - for rating prediction: mean absolute error, root mean square error.
- online evaluation: 
  - who is the subject? online customers, students, computers, ...
  - what research methods are applied? experiments, quasi-experiments, non-experimental research
  - in which setting does the research take place? lab, real-world scenarios.

Data:
- explicit ratings: typical choices (possibly multidimensional); disadvantage: users not always willing to rate many items;
- implicit ratings: user action interpreted as rating; easy to collect transparently, without additional effort; disadvantage: action doesn't necessarily have the same meaning as a rating.
- sparsity: natural datasets include historical interaction records of real users.

More algorithms:
- Memory-based and model-based approaches: rating matrix is used to find neighbors / make predictions; don't scale for real-world scenarios;
- Content-based: learn user preferences and locate/recommend items that are "similar" to them;
- Knowledge-based: users want to define their requirements explicitly;
- Hybrid approaches: combine ideas from the approaches above.

Attacks:
- monetary value of being in recommendation lists;
- attacks aim to:
  - push some items;
  - sabotage other items;
  - simply sabotage the system;
  - manipulation the "internet option".