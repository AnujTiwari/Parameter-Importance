<h1 align='center'>Parameter Importance Assessment</h1>

<p align=”justify”>
Modern data sets are often described with far too many variables for practical model building. Usually most of these variables are irrelevant to the predictive modeling, and obviously their relevance is not known in advance. There are several disadvantages of dealing with overlarge feature sets. One is purely technical — dealing with large feature sets slows down algorithms, takes too many resources and is simply inconvenient. Another is even more important — many machine learning algorithms exhibit a decrease of accuracy when the number of variables is significantly higher than optimal. Therefore selection of the small (possibly optimal) feature set ensure best possible predictive modeking results is desirable for practical reasons.
</p>

In this repository, you will get R code for implementing four parameter importance assessment techniques which are based on some of the most popular machine learning and statistical modeling algorithms. 

1. Random Forest - Boruta
2. Decision Tree/ Logistic Regression/ Linear Regression - Recursive Feature Elimination (RFE)
3. Decision Tree - Recursive PARTitioning (RPART)
4. Linear Regression - LMG

Following R packages are used in the development.
1. install.packages('Boruta') for Random Forest (Boruta)
2. install.packages('caret') for RFE and RPART
3. install.packages('relaimpo') for LMG

<b>References</b>

- Lindeman, R.H., Merenda, P.F. and Gold, R.Z. (1980) Introduction to Bivariate and Multivariate Analysis, Glenview IL: Scott, Foresman.

- Therneau, T. M., & Atkinson, E. J. (1997). An introduction to recursive partitioning using the RPART routines (Vol. 61, p. 452). Mayo Foundation: Technical report.

- Granitto, P. M., Furlanello, C., Biasioli, F., & Gasperi, F. (2006). Recursive feature elimination with random forest for PTR-MS analysis of agroindustrial products. Chemometrics and Intelligent Laboratory Systems, 83(2), 83-90.

- Kursa, M. B., Jankowski, A., & Rudnicki, W. R. (2010). Boruta–a system for feature selection. Fundamenta Informaticae, 101(4), 271-285.

<b>Feedback and Questions</b>

Hope you find this code useful. As it turns out different algorithms showed different parameter as important, or at least the degree of importance changed. This need not be a conflict, because each algorithm gives a different perspective of how the parameter can be useful depending on how the kernel estimation function learn independent and dependent parameters.

Please send your questions, comments and feedback to: 

Mail me  👉  anujtiwari.spatial@gmail.com
