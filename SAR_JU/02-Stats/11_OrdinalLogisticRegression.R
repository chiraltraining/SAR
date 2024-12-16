# Load necessary packages
library(tidyverse)   # For data wrangling and visualization
library(MASS)        # For ordinal logistic regression (polr function)
library(easystats)   # For statistical reporting and summaries
library(readxl)      # For reading Excel files


# Load the dataset
kap_data <- read_excel("data/KAP_Thals_Processed.xlsx", sheet = 5)  # Read data from the specified Excel sheet

# Convert the dependent variable to an ordered factor (ordinal logistic regression requires this)
kap_data$KnowledgeLevelOrdinal <- as.ordered(kap_data$KnowledgeLevelOrdinalCode)

# Convert the dependent variable to an ordered factor with a fixed reference category
kap_data$KnowledgeLevelOrdinal <- factor(
  kap_data$KnowledgeLevelOrdinalCode,
  levels = c("1", "2", "3"),  # Specify the order of levels explicitly
  ordered = TRUE              # Ensure it is treated as an ordered factor
)

# Univariate Ordinal Logistic Regression
# Fit an ordinal logistic regression model with 'Gender' as the predictor
uv_ordinal_logreg <- polr(
  KnowledgeLevelOrdinal ~ Gender, 
  data = kap_data, 
  method = "logistic"  # Specify the logistic link function
)

# Summarize the univariate ordinal logistic regression model
summary(uv_ordinal_logreg)  # Provides detailed output, including coefficients and thresholds

library(gtsummary)
uv_ordinal_logreg |> 
  tbl_regression()

# Multivariate Ordinal Logistic Regression
# Fit an ordinal logistic regression model with 'Age' and 'Gender' as predictors
mv_ordinal_logreg <- polr(
  KnowledgeLevelOrdinal ~ Age + Gender, 
  data = kap_data, 
  method = "logistic"  # Specify the logistic link function
)

# Summarize the multivariate ordinal logistic regression model
summary(mv_ordinal_logreg)  # Provides detailed output, including coefficients and thresholds
