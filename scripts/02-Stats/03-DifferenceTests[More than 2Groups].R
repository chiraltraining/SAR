# Load necessary packages 
# These packages provide functionalities for data manipulation, summary, and visualization
library(tidyverse)   # For data wrangling and visualization
library(skimr)       # For an elegant summary of data
library(easystats)   # For statistical analyses and summaries
library(car)         # For Levene's test

# Load the dataset
# Replace "data/pulse_data.csv" with your file path if it's not in the working directory
data <- read.csv("data/pulse_data.csv")


# Step 1: Inspect the variables of interest
# Check the structure of the dataset to ensure the variables are suitable for a t-test
str(data$BMI)        # BMI is a numeric variable
str(data$Exercise)     # Exercise is a categorical variable (should be binary for a t-test)

# convert data 
data$Exercise <- as.factor(data$Exercise)
str(data$Exercise)

# Step 2: Verify the levels of the Exercise variable
# Ensure there are three levels (e.g., High, Low, Moderate)
unique(data$Exercise)

# Step 3: Summarize BMI by Exercise category
# Calculate mean and standard deviation for each group
tapply(data$BMI, data$Exercise, mean, na.rm = TRUE)

# Step 4: Check assumptions for the ANOVA
# 4.1. Normality: Use the Shapiro-Wilk test to check for normal distribution for each Exercise level
shapiro_test_low <- shapiro.test(data$BMI[data$Exercise == "Low"])
shapiro_test_low

shapiro_test_moderate <- shapiro.test(data$BMI[data$Exercise == "Moderate"])
shapiro_test_moderate

shapiro_test_high <- shapiro.test(data$BMI[data$Exercise == "High"])
shapiro_test_high

# Homogeneity of Variance: Use Levene's Test to check if variances are equal across Exercise groups
levene_test_result <- leveneTest(BMI ~ Exercise, data = data)
levene_test_result

# Perform ANOVA if assumptions hold
anova_result <- aov(BMI ~ Exercise, data = data)
anova_result

anova_summary <- summary(anova_result)
anova_summary

# Reporting 
report(anova_result)


# Perform the Kruskal-Wallis test (If data is not normal)
# Compare BMI between the three levels of Exercise (High, Low, Moderate)
kruskal_test_result <- kruskal.test(BMI ~ Exercise, data = data)
kruskal_test_result

report(kruskal_test_result)



