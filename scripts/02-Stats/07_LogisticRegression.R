# Load necessary packages
library(tidyverse)   # For data wrangling and visualization
library(easystats)   # For statistical analyses and summaries
library(readxl)      # For reading Excel files

# Load the dataset
kap_data <- read_excel("data/KAP_Thals_Processed.xlsx", sheet = 5)  # Read data from the specified Excel sheet

# Convert the dependent variable to a factor (binary logistic regression requires this)
kap_data$KnowledgeLevelBinary <- as.factor(kap_data$KnowledgeLevelBinary)

# Univariate Logistic Regression
# Fit a logistic regression model with 'Gender' as the predictor
uv_logreg <- glm(
  KnowledgeLevelBinary ~ Gender, 
  data = kap_data, 
  family = binomial(link = "logit")  # Specify a logistic regression model
)

# Summarize the univariate logistic regression model
summary(uv_logreg)  # Provides detailed statistical output

# Generate a concise report for easier interpretation
report(uv_logreg)   # Easystats provides human-readable summaries

# Optional: Combine report with a summary for further details
report(uv_logreg) |> 
  summary()

# Multivariate Logistic Regression
# Fit a logistic regression model with 'Age' and 'Gender' as predictors
mv_logreg <- glm(
  KnowledgeLevelBinary ~ Age + Gender, 
  data = kap_data, 
  family = binomial(link = "logit")  # Specify a logistic regression model
)

# Summarize the multivariate logistic regression model
summary(mv_logreg)  # Provides detailed statistical output

# Generate a concise report for easier interpretation
report(mv_logreg)   # Easystats provides human-readable summaries

# Optional: Combine report with a summary for further details
report(mv_logreg) |> 
  summary()

