
# Correlation Analysis in R
# Correlation measures the strength and direction of a linear relationship between two numerical variables.
# - Common correlation coefficients:
#   - Pearson: Measures linear correlation (default).
#   - Spearman: Non-parametric, based on ranks, suitable for ordinal or non-linear data.
#   - Kendall: Non-parametric, measures ordinal association.

# Load necessary packages 
library(tidyverse)   # For data wrangling and visualization
library(easystats)   # For statistical analyses and summaries

# Load the dataset
# Replace "data/pulse_data.csv" with your file path if it's not in the working directory
data <- read.csv("data/pulse_data.csv")


# Visualize Relationships
# Scatterplots are useful for visualizing potential correlations.
# Example: Scatterplot of Height vs. Weight
plot(data$Height, 
     data$Weight, 
     main = "Scatterplot of Height vs. Weight", 
     xlab = "Height (cm)", 
     ylab = "Weight (kg)", 
     pch = 16, col = "blue")


# Pearson Correlation Coefficient
# Use Pearson for linear relationships and normally distributed data.
# Example: Correlation between Height and Weight
correlation_pearson <- cor.test(data$Height, data$Weight, method = "pearson")
correlation_pearson

# Reported 
report(correlation_pearson)

# Interpretation:
# - Correlation values range from -1 to 1.
# - Positive values: Height increases as Weight increases.
# - Negative values: Height increases as Weight decreases.
# - Close to 0: No linear correlation.

# Spearman Correlation Coefficient
# Use Spearman for non-linear relationships or ordinal data.

# Example: Correlation between Age and BMI
correlation_spearman <- cor.test(data$Age, data$BMI, method = "spearman")
correlation_spearman

# Report 
report(correlation_spearman)

# Interpretation:
# - Spearman correlation is based on ranked data.
# - Similar interpretation as Pearson, but less sensitive to outliers.

# Kendall Correlation Coefficient
# Use Kendall for small datasets or ordinal data.
# Example: Correlation between Age and BMI
correlation_kendall <- cor.test(data$Age, data$BMI, method = "kendall")
correlation_kendall

# Report 
report(correlation_kendall)

# Visualize the correlation matrix using heatmap




