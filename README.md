![alt text](https://github.com/cosfer2804/FCDATA/blob/main/screenshot/logo.png) 

# MID PROJECT - CLASSIFICATION BANK CASE STUDY

By: <br/>
[Thiago Costa](https://www.linkedin.com/in/cosfer-thiago/)<br/>
[Angela Wang](https://www.linkedin.com/in/angela-wang-716632b1/)

## Table of Contents
- [Scenario](#scenario)
- [Objective](#objective)
- [Tools and Methods](#tools-and-methods)
- [Models](#models)
- [Insight](#insights)
- [Next Steps](#next-steps)

## Scenario
You are working as a risk analyst with a bank. The bank provides credit card services and wants to understand the demographics and other characteristics of its customers that accept a credit card offer and that do not accept a credit card.

## Objective
* Build a model to predict which customers are likely to accept an offer.
* Identify the demographics and charateristics which most influence whether a credit card offer is accepted or rejected.

## Tools and methods

### Trello - using agile method (Kanban)
Trello is a visual work management tool. We used trello to organize and manage the activities, we divided the activities into four main groups: to do, doing, done and review code. Check our [trello](https://trello.com/b/I8S3Yl00/fc-data)

### Github
Github is a code hosting platform for version control and collaboration. We used it to share the files and keep a backlock of the updates. Check our [repository](https://github.com/cosfer2804/FCDATA)

### MySQL
MySQL is a relational database management system (RDBMS) developed by Oracle that is based on structured query language (SQL).
We used SQL to perform an initial exploratory analysis. We followed the proposed [questions](https://github.com/cosfer2804/FCDATA/blob/main/sql/sql%20analysis.sql) and then performed [random queries](https://github.com/cosfer2804/FCDATA/blob/main/sql/eda_queries.sql).

### Tableau
Tableau is a visual analytics engine that makes it easier to create interactive visual analytics in the form of dashboards. The main use of tableau was to visualize and deep dive in the data to find customer behaviour patterns. Check our [dashboard](https://public.tableau.com/app/profile/angela6850/viz/FCdataclassification/Dashboard?publish=yes).

### Python
We divide the work done in python into two notebooks.
In the [classification_eda](https://github.com/cosfer2804/FCDATA/blob/main/python/classification_eda.ipynb) we did the cleaning steps:
* standardize headers name;
* EDA - review columns' distribution, counts and correlation
* check and fill the nulls;
* check duplicates;
* visualizations - Matplotlib and Seaborn to check if there are outliers
* Pre-processing: encode categories and scale numerics
* export the cleaned dataframe to a new csv.

In the [final model](https://github.com/cosfer2804/FCDATA/blob/main/python/classification_final.ipynb) notebook we did some cleaning and then run 9 different classification models:
* Train, test, split
* Define model
* Check accuracy of our classification model
* Fit the model to more balanced data
* Correlating categories with chi squared
* Fit the model to more balanced data using resampling techniques SMOTE and Tomelink and visualize with confusion_matrix and heatmap

### Models
To perform each model, we developed a for loop in which we applied Logistic Regression, Random Forest, KNeighbors and Gradient Boosting to the same dataframe. In this way, it was possible to compare and evaluate which methods obtained the best results.

So after testing nine different models, we decided to give attention to two of them that had a more relevant result. It is worth noting that each model represents two different marketing strategies. 

#### Model 1 - KNeighbors (using SMOTE for resampling)
Despite achieving only 69.6% accuracy, this model is the most ideal for implementing a marketing strategy that will focus on potential customers without losing those who have already accepted the offer. 

When we evaluate the confusion matrix, it is possible to notice that the model predicts 5.6% of true positives from the total number of customers, which corresponds to more than 90% of the customers who accepted the offer. On the other hand, we notice that the model predicts 30% false positives. However, in our case false positives are considered as possible customers. This way, we can use this model to design a marketing strategy to keep most of the customers that have already accepted the proposal and make new offers to potential customers. 

It is worth noting that the model only made statistical evaluations. Therefore, if there is any interest in implementing this strategy, financial planning is required to assess its viability.

<img width="400" alt="KNeighbors" src="https://github.com/cosfer2804/FCDATA/blob/main/screenshot/knn_best1.png">

#### Model 2 - Random Forest (using SMOTE for resampling)
Model 2 had 87.2% accuracy, but in relation to the confusion matrix the efficiency was lower than model 1. It can be stated that this model lost 2% of the customers who already accepted the proposal (comparing to the previous model), and predicted 10.6% of potential customers. In this situation, the bank can use this model to develop a strategy for a low operational cost. Despite the fact that this model is not as efficient, it may have a much higher viability than model 1.

<img width="400" alt="Random Forest" src="https://github.com/cosfer2804/FCDATA/blob/main/screenshot/randomforest_best2.png">

### Insights
* The average balance increases esponentially from Q1 to Q3 in category A, while it  remains invariate in category D. Categories B and C have a linear average balance   grow from Q1 to Q3 and drop from Q3 to Q4.
* 62% of the clients that accepted the offer has low credit rating, followed by 26%  with medium creadit rating and only 12% with high credit rating.
* It seems that there is a preference in receiving the offer through postcard in the group who accepted the offer.
