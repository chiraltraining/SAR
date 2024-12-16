# Load necessary packages 
library(tidyverse)   # For data wrangling and visualization
library(easystats)   # For statistical analyses and summaries

# Load the dataset
qol_data <- read.csv("data/Thalassemia_QoL.csv")

# Simple Linear Regression
# Predict QOL_Score based on Age_of_Participants
# Fit the simple linear regression model
simple_model <- lm(QOL_Score ~ Age_of_Participants, data = qol_data)

# View the summary of the model
summary(simple_model)

# Interpretation:
# - Coefficients: Intercept and slope of the regression line.
# - p-value: Significance of the predictor (Age_of_Participants).
# - Adjusted R-squared: Proportion of variance explained by the model.

# report 
report(simple_model)

report(simple_model) |> 
  summary()


# Multiple Linear Regression
# Predict QOL_Score using multiple predictors

# Fit the multiple linear regression model
multiple_model <- lm(QOL_Score ~ Age_of_Participants + Gender + Economic_Class + Medical_Expense, data = data)
multiple_model

# View the summary of the model
summary(multiple_model)

# Interpretation:
# - Coefficients: Effect of each predictor on QOL_Score.
# - p-value: Significance of each predictor.
# - Adjusted R-squared: Proportion of variance explained by all predictors combined.

report(multiple_model)

report(multiple_model) |> 
  summary()




