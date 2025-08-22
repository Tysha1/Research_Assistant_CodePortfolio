# Example: Data Cleaning, Regression, and Visualization in Python

import pandas as pd
import statsmodels.api as sm
import matplotlib.pyplot as plt

# Load dataset (replace with actual data)
df = pd.read_csv("hiv_incidence.csv")

# Data cleaning
df = df.dropna(subset=["age", "sex", "seroconversion"])
df["sex"] = df["sex"].map({"Male": 1, "Female": 0})

# Define independent and dependent variables
X = df[["age", "sex"]]
X = sm.add_constant(X)
y = df["seroconversion"]

# Logistic regression
model = sm.Logit(y, X).fit()
print(model.summary())

# Visualization
plt.figure(figsize=(6,4))
df.groupby("age")["seroconversion"].mean().plot(kind="line", marker="o")
plt.title("HIV Seroconversion Rate by Age")
plt.xlabel("Age")
plt.ylabel("Probability of Seroconversion")
plt.grid(True)
plt.show()
