# Resumos AC | Others

## 10. Outlier Detection

Outlier:
- observation which deviates so much from the other observations as to arouse suspicions that it was generated by a different mechanism;
- patterns in data that do not conform the "normal".

Applications of Outlier Detection:
- Quality Control and Fault Detection Applications;
- Financial Applications: credit card fraud, stock market anomalies;
- Intrusion and Security Applications;
- Web Log Analytics;
- Market Basket Analysis;
- Medical Applications;
- Text and Social Media Applications: spam email, anomalous activity;
- Earth Science Applications: sea surface temperature anomalies.

Challenges:
- Boundary between normal and outlying behaviour is not precise;
- no general outlier definition (depends on the domain);
- difficult to distinguish outliers from random noise;
- malicious actions adapt to appear as normal.

Key aspects:
- Nature of Input Data: one/multiple attribute(s), relationship among data instances, dimensionality of data;
- Type of Outliers: 
  - Point/Global Outlier: instance that individually or in small groups is very different from the rest of instances;
  - Contextual Outlier: instance that is very different from the rest of instances when considered within a context;
  - Collective Outlier: instant that, even though individually may not be an outlier, inspected in conjunction with related instances and with respect to the entire data set is an outlier.
- Intended Output: 
  - label/value: identification normal or outlier instance;
  - score: probability of being an outlier.
- Learning Task: 
  - Unsupervised Outlier Detection: data set has no information on the behaviour of each instance; most common case in real-life apps;
    - Statistical-based: all the points that satisfy a statistical discordance test for some statistical model are declared as outliers.
    - Proximity-based: normal instances occur in dense neighbourhoods, while outliers occur far from their closest neighbours.
    - Clustering-based: normal instances belong to large and dense clusters, while outlier instances are instances that don't belong to any cluster, are far from its closest cluster and form very small or low density clusters.
    - Isolation Forest: detescts outliers purely based on isolation (separating an instance from the rest of the instances).
  - Semi-supervised Outlier Detection: data set has a few instances of normal or outlier behaviour; fault detection is an example;
    - One-Class classification: build a prediction model to normal behaviour and classify any deviations from this behaviour as outliers.
  - Supervised Outlier Detection: data set has instances of both normal and outlier behaviour; hard to obtain such data;
    - Data Pre-processing;
    - Special-purpose methods; 
    - Prediction post-processing; 
    - Hybrid approaches;
- Performance Metrics: 
  - Inadequacy of Standard Performance Metrics:
    - SPM (ex: accuracy, error rate) assume that all instances are equally relevant for the model performance;
    - would give a good performance estimation to a model that performs well on normal cases and bad on outlier cases.

## 11. Artificial Neural Networks (ANN) & Deep Learning

ANNs: models with a strong biological inspiration; brain is a highly complex structure, non linear and highly parallel;
- Neuron: many-inputs/one-output unit;
- Synapses: eletrochemical contact between neurons.
- composed by set of units (neurons) connected (with an associated weight);
- each unit has as activation level as well as means to update this level;
- some units are connected to the outside world (input and output neurons);
- learning with ANNs consists of updating the weights of the network connections.
- types:
  - Feed-forward networks (Multilayer perceptrons): networks with uni-directional connections and without cycles; each unit is only connected to units in the following layer;
  - Recurrent networks: networks with arbitrary connections; may be more instable and take longer to converge;
- issues:
  - network topology: number of nodes in the hidden layer (under/over-fitting), effect of learning rate;
  - generalization vs specialization trade-off: optimal number of hidden neurons, overtraining;
  - relevant hyperparameters: network structure, training algorithm.

Use when:
- input is high-dimensional discrete or real-valued;
- output is discrete or real valued;
- output is a vector of values;
- possibly noisy data;
- unknown form of target function;
- unimportant human readability of result;
- pros: 
  - tolerance of noisy data;
  - ability to classify patterns on which they ahve not been trained;
  - successful on a wide range of real-world problems;
  - algorithms ar einherently parallel.
- cons: 
  - long training times;
  - resulting models are essentially black boxes.

Deep Learning: 
- image recognition, automatic text translation, answers in natural language, games, transcript of handwritten text, self-driving cars, ...
- Deep learning = Deep neural networks -> high number of hidden layers and learn a large number of parameters;
- possible since we have access to big amounts of data and increased computational capabilities;
- Disadvantages:
  - doesn't solve all problems and won't always be the best option for any learning task;
  - difficult to select best architecture for a problem;
  - require new training for each task/configuration;
  - require a large training dataset to generalize well.

## 13. Metalearning

World where automated ML lives:
- world of many models:
  - models for smaller subsets; eventually, individual entities;
- needs model management:
  - bias: criteria to prefer one model relative to another; can't live with it neither without it: given dataset and learning algorithm, not every model is possible and bias-free learning is futile (can learn any model  but doesn't have any preference for one over the other);
- metalearning/automl can help:
  - metalearning for algorithm selection: induce model from metadata to predict the best algorithm on a new dataset;
  - metafeatures: entropy of classes (target attribute), mean entropy of symbolic attributes;
  - responsible AI: accuracy vs fairness: fair models means have to sacrifice predictive performance sometimes.
- opportunites and challenges still open:
  - dataset morphing to understand ML algorithm behavior;
  - metalearning to understand the behavior of algorithms;
- lots of data, detail, problems and models => extreme (lots of) data mining.