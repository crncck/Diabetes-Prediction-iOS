# Import libraries
import numpy as np
import pandas as pd
import seaborn as sns
import coremltools as cml
from sklearn import metrics
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression

# Load data
df = pd.read_csv("data.csv")

# Get columns that will be used for predictions from data 
X = df.loc[:, ["Pregnancies", "Glucose", "BMI", "Age"]]
y = df['Outcome']

# Split data to train and test
X_trainSet, X_testSet, y_trainSet, y_testSet = train_test_split(X, y, test_size=0.30)

# Train model
logRec = LogisticRegression()
logRec.fit(X_trainSet, y_trainSet)

# Turn sklearn model to CoreML model
model = cml.converters.sklearn.convert(logRec, ["Pregnancies", "Glucose", "BMI", "Age"], "Outcome")

# Model descriptions
model.author = "Ceren Cicek"
model.short_description = "Predicts diabetes based on diagnostic measures"

# Model input descriptions
model.input_description["Pregnancies"] = "Number of times pregnant"
model.input_description["Glucose"] = "Plasma glucose concentration a 2 hours in an oral glucose tolerance test"
model.input_description["BMI"] = "Body mass index (weight in kg/(height in m)^2)"
model.input_description["Age"] = "Age (years)"

# Model output description
model.output_description["Outcome"] = "0: non-diabetic & 1: diabetic"

# Save model
model.save('diabetesPrediction.mlmodel')