# Load necessary packages 
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
str(data$Gender)     # Gender is a categorical variable (should be binary for a t-test)

# convert data 
data$Gender <- as.factor(data$Gender)
str(data$Gender)

# Step 2: Verify the levels of the Gender variable
# Ensure there are two levels (e.g., Male and Female)
unique(data$Gender)

# Step 3: Summarize BMI by Gender
# Calculate mean and standard deviation for each group
tapply(data$BMI, data$Gender, mean, na.rm = TRUE)

# Step 4: Check assumptions for the t-test
# 4.1. Normality: Use a Shapiro-Wilk test to check for normal distribution
hist(data$BMI)

shapiro_test_male <- shapiro.test(data$BMI[data$Gender == "Male"])
shapiro_test_male

shapiro_test_female <- shapiro.test(data$BMI[data$Gender == "Female"])
shapiro_test_female

# 4.2. Homogeneity of variances: Use Levene's test
levene_test <- leveneTest(BMI ~ Gender, data = data)
levene_test

# Step 5: Pt.te
# Two-sample t-test (independent groups: Male vs Female)
ttest_result <- t.test(BMI ~ Gender, data = data, var.equal = FALSE)  # Welch's t-test
ttest_result

# Step 6: Interpret the results
# Extract key results
t_statistic <- ttest_result$statistic
t_statistic

p_value <- ttest_result$p.value
p_value

conf_interval <- ttest_result$conf.int
conf_interval

mean_diff <- ttest_result$estimate
mean_diff

# Step 7: Report the conclusion
if (p_value < 0.05) {
  cat("Conclusion: There is a significant difference in BMI between male and females (p < 0.05).")
} else {
  cat("Conclusion: There is no significant difference in BMI between male and females (p >= 0.05)")
}

# Publication-ready reporting 
report(ttest_result)


# Perform the Wilcoxon Rank-Sum Test (If the data is not normal and the variances are not equal, a non-parametric test such as the Wilcoxon Rank-Sum Test (Mann-Whitney U Test) is a better alternative to the t-test.)
# Compare BMI between Male and Female groups
wilcox_test_result <- wilcox.test(BMI ~ Gender, data = data, exact = FALSE)  # Use `exact = FALSE` for large samples
wilcox_test_result

# Extract key statistics
w_statistic <- wilcox_test_result$statistic
p_value <- wilcox_test_result$p.value

# Report the conclusion
if (p_value < 0.05) {
  cat("Conclusion: There is a significant difference in BMI between genders (p < 0.05)")
} else {
  cat("Conclusion: There is no significant difference in BMI between genders (p >= 0.05).")
}

