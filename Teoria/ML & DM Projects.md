# Resumos AC | ML & DM Projects

## 1. Data Mining Process

Data mining: non-trivial process of identifying implicit, valid, novel, potentially usefull and understandable patterns in data; is a step in the Knowledge Discovery in Databases (KDD) process.

Wanted DM Methodology:
- framework for recording experience (allow projects to be replicated);
- aid to project planning and management;
- "comfort factor" for new adopters;
- encourage best practices and help to obtain better results;
- methodologies: 
  - CRISP-DM: Cross-Industry Standard Process for Data Mining; focus on business issues (as well as technical analysis), framework for guidance, experience bases (templastes for analysis).
  - SCRUM-DM: agile DM methodology; Scrum work management + CRISP-DM; 3 phases: business understanding, sprint, deployment; 6 concepts: Product Owner, Scrum Master, Development Team, Data Mining Story, Product Backlog, Sprint Backlog.

AI not only software engineering:
- versioning: data, model;
- automation: development, testing;
- collaborative model development;
- deployment (monitoring, maintenance).

## 3. Data Preparation (DP)

DP: Importing, Manipulating, Cleaning, Transforming, Augmenting.

Data: collection of data objects (cases) and their attributes (features).
- Attribute: property/characteristic of an object (date, country, temperature, ...):
  - Categorical/Qualitative:
    - Nominal: no relationship between values (name, gender, patient id);
    - Ordinal: order between values, but no math operation can be performed (size: small, medium, large);
  - Numeric/Quantitative:
    - Discrete: finite or countably infinite set of values for which differences are meaningful (temperatures, calendar dates, event duration in minutes);
    - Continuous: infinite set of values that represent the absolute numbers (distance, income).
- Object: described by a collection of attributes;
- Structured (data table) or non-structured (text);
- (non-)dependency between objects (time, space, ...);
- characteristics: dimensionality (no. of attributes), sparsity, resolution, size.

Datasets:
- Nondependency-oriented data: no dependencies between cases (simple data tables, text);
- Dependency-oriented data: relationships between cases (time series, discrete sequences, network and graph data, ...).

Data Preparation: data analysis tasks use source data sets stored in tabular format.

Data Wrangling: process of transform and mapping data from one "raw" data form into another format appropriate for analytics; steps: discovering, structuring, cleaning, enriching, validating, publishing; goal: attain quality and useful data.

Data Quality: raw format of real data is usually widely variable as values may be missing, inconsistent across different data sources, erroneous; poor data quality poses several challenges to the effective data analysis.
- Problems:
  - noise: irrelevant or useless information;
  - outliers: objects with characteristics considerably different than most of the other data in dataset; outliers can be noise that interferes with data analysis, but can also be our goal (if we are looking for a credit card fraud or intrusion detection, for example);
  - missing values:
    - Missing Completely at Random (MCAR): independent of observed and unobserved data;
    - Missing at Random (MAR): related to observed data;
    - Missing Not at Random (MNAR): related to unobserved data;
    - solutions:
      - remove observations with missing values (consider only complete cases);
      - ignore missing values in the analytical phase;
      - make estimates to fill the missing values (imputation).
  - duplicate data;
  - inconsistent/incorrect data: hardest to detect; may depend on expert domain knowledge.

## 4. Data Understanding (DU) and Preparation (DP)

CRIPS-DM:
- Data Understanding:
  - collect initial data, describe data, explore data, verify data quality;
  - data quality, data summarization, data visualization.
- Data Preparation:
  - data set, select data, clean data, construct data, integrate data, format data;
  - feature extraction, data cleaning, data transformation, feature engineering, data and dimensionality reduction.

Data Summarization:
- overviews of key properties of the data;
- help selecting the most suitable tool for the analysis;
- goal: describe important properties of thedistribution of the values;
- Data set: univariate/multivariate;
- Variables:
  - Categorical:
    - Mode: most frequent value;
    - Frequency table: frequency of each value (absolute/relative);
    - Contingency tables: cross-frequency of values for 2 variables;
    - Mode: most common value in a set of values.
  - Numeric:
    - Statistics of location:
      - Mean: sensitive to extreme values;
      - Median: 50th-precentile (value above (below) which there are 50% of the values in the data set);
      - Mode: most common value in a set of values.
    - Statistics of variability or dispersion:
      - Range: maxX - minX;
      - Variance: σX^2: sensitive to extreme values;
      - Standard Deviation: sensitive to extreme values: σX = sqrt(1/(n-1) * sum(i=1->n)(Xi - uX)^2);
      - Inter-quartile Range (IQR): difference between the quartiles 3 and 1.
    - Multivariate analysis of variability or dispersion:
      - Covarianace Matrix: variance between every pair of numeric variables; the value depends on the magnitude of the variable;
      - Correlation Matrix: correlation between every pair of numeric variables; the influence of the magnitude is removed;
      - Pearson Correlation Coefficient (ρ): measures the linear correlation between 2 variables (between 1 and -1);
      - Spearman Rank-Order Correlation Coefficient: measures the strength and direction of monotonic association between 2 variables (between 1 and -1).

Data Visualization: 
- help detecting patterns and trends, and also outliers and unusual patterns;
- Univariate Graphs:
  - Categorical Variables:
    - Barplots: display a set of values as heights of bars;
    - Piecharts: same purpose as bar plots but information in the form of a pie (not so good to comparisons).
  - Numeric Variables:
    - Line plots: analyze the evolution of the values of a continuous variable;
    - Histograms: display how the values of a continuous variable are distributed;
    - QQ Plots: graphical view of how properties scale and skewness compare in 2 distributions;
    - Boxplots: summary of a variable distribution; interquartile range and outliers (if any);
- Bivariate Graphs:
  - Scatterplots: graph for showing the relationship between 2 numeric variables.
- Multivariate/Conditioned Graphs:
  - Scatterplots: can plot relationship between every apir of numeric variables and respective groups.
  - Parallel Coordinates Plot: plots attributes values for each case (represented as a line);
  - Correlogram: chart of correlation statistics for each pair of variables;
  - Conditioned plots: allow the simultaneous presentation of sub-group graphs to better allow finding eventual differences between sub-groups: conditioned histograms, boxplots, ...

Data Preparation: set of steps necessary to carry out before any analysis takes place on the available data.
- Problems:
  - data can come from different sources;
  - we may have data sets with unknown variable values;
  - many data mining methods are sensitive to the scale and/or type of variables;
  - may need to create new variables to achieve our objectives;
  - data set may be too large for some methods to be applicable.
- Steps:
  - Feature Extraction: extract features from raw data on which analysis can be performed;
  - Data Cleaning: data may be hard to read or require extra parsing efforts;
  - Data Transformation: may be necessary to change some of the values of the data;
  - Feature Engineering: to incorporate some domain knowledge;
  - Data and Dimensionality Reduction: to make modeling possible.

## 5. Advanced Issues in Data Preparation and Modeling

Advanced Issues in Data Preparation:
- Data Reduction: reduced amount of data (volume) producing the same analytical results, improved visualization of data with more interpretable models and faster.
- 2 approaches:
  - Attribute Aggregation: 
    - Principal Component Analysis (PCA): n new features, linear combinations of existing n attributes, orthogonal;
    - ICA: assumes the original attributes are statistically independent; reduces higher order statistics; doesn't rank components.
    - Multidimensional scaling: linear projection of a data set; uses the distances between pairs of objects (not the values of the attributes); suitable when is difficult to extract relevant features to representation.
  - Feature Selection: 
    - redundant attributes: duplicate much or all info contained in one or more other attributes;
    - irrelevant attributes: contain no useful information

Advanced Issues in Modeling:
- Dealing with unbalanced classes:
  - context:

| | Predicted class: Yes | Predicted class: No |
| - | - | - |
| Actual class: Yes | TP: True Positive | FN: False Negative |
| Actual class: No | FP: False Positive | TN: True Negative |

  - learning with class imbalance:
    - collect more data (sometimes difficult);
    - resample existing data:
      - undersampling: delete data from majority class; possible loss of information;
      - oversampling: duplicate data from minority class;
    - create synthetic data:
      - SMOTE (Synthetic Minority Over-Sampling Technique): possibility of inadequate boundaries and danger of overfitting.
    - adapt your learning algorithm
      - cost sensitive learning: FP and FN errors often incur different costs, but ML methods still usually minimize FP+FN.

Data quality: multidimensional view:
- accuracy: correct or wrong, accurate or not;
- completeness: not recorded, unavailable;
- consistency: some modified but some not, dangling;
- timeliness: timely updated?;
- believability: how trustable is the data and its sources?;
- interpretability: how easily the data can be understood?.

Data cleaning as a process:
- discrepancy detection:
  - validate with metadata (domain, range, dependency, distribution);
  - check field overloading;
  - check uniqueness rule, consecutive rule and null rule;
  - commercial tools (scrubbing and auditing);
- migration and integration:
  - data migration tools (allow transformations to be specified);
  - Extraction/Transformation/Loading (ETL) tools (allow users to specify transformations through a graphical user interface). 