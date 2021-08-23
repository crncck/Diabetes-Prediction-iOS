# Diabetes-Prediction-iOS

<br>

It is an application to predict diabetes based on some information and diagnostic measures. 

The dataset is **[Pima Indians Diabetes Database](https://www.kaggle.com/uciml/pima-indians-diabetes-database)** and contains 9 columns. One of the columns ('Outcome') stores 0 or 1 which means that the person is diabetic or not. Making some data exploration on **[Diabetes.ipynb](https://github.com/crncck/Diabetes-Prediction-iOS/blob/main/Diabetes.ipynb)** file and using correlation matrix, it seems that the Outcome value has high correlations with Glucose, BMI, Age, and Pregnancies the values of the correlations respectively are 0.47, 0.29, 0.24, 0.22. Using only four of those columns as data, I built a Logistic Regression model which is a classification algorithm used to assign observations to a discrete set of classes. 

To integrate this model with iOS, Apple provides a framework, Core ML. On **[diabetes_model.py](https://github.com/crncck/Diabetes-Prediction-iOS/blob/main/diabetes_model.py)** file, I turned this scikit learn model to the CoreML model and added it to the XCode project. The application provides a basic UI to get age, glucose, body mass index, and pregnancies parameters from the user and shows predicted result. 

<br>

## App Preview

<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gtr1ske8x6g609i0kgq8c02.gif" alt="converter" />
