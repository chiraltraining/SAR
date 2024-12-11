# Load necessary packages 
# These packages provide functionalities for data manipulation, summary, and visualization
library(tidyverse)   # For data wrangling and visualization
library(skimr)       # For an elegant summary of data
library(easystats)   # For statistical analyses and summaries

# Load the dataset
# Replace "data/pulse_data.csv" with your file path if it's not in the working directory
data <- read.csv("data/pulse_data.csv")

# Summarize the dataset
# Provides an overview of the data, including variable types, missing values, and statistics
skim(data)

# VARIABLE SUMMARY 
# 1. Numeric Variable (e.g., Age)
# Compute basic statistics: minimum, maximum, range
max_age <- max(data$Age, na.rm = TRUE)  # Maximum age
max_age

min_age <- min(data$Age, na.rm = TRUE)  # Minimum age
min_age

age_range <- max_age - min_age          # Range of age
age_range

# Compute measures of central tendency and dispersion
mean_age <- mean(data$Age, na.rm = TRUE)  # Mean age
mean_age

sd_age <- sd(data$Age, na.rm = TRUE)      # Standard deviation
sd_age

var_age <- var(data$Age, na.rm = TRUE)    # Variance
var_age

# Compute measures of position
median_age <- median(data$Age, na.rm = TRUE)   # Median
median_age

q1 <- quantile(data$Age, 0.25, na.rm = TRUE)   # First quartile (Q1)
q1

q2 <- quantile(data$Age, 0.50, na.rm = TRUE)   # Second quartile (Q2, same as median)
q2

q3 <- quantile(data$Age, 0.75, na.rm = TRUE)   # Third quartile (Q3)
q3

iqr_age <- IQR(data$Age, na.rm = TRUE)         # Interquartile range
iqr_age

# 2. Categorical Variable (e.g., Gender)
# Frequency counts and proportions
gender_counts <- table(data$Gender)                 # Count by gender
gender_counts

gender_proportions <- prop.table(gender_counts)     # Proportion by gender
gender_proportions

gender_percentages <- gender_proportions * 100      # Percentage by gender
gender_percentages

# 3. Relationship between a Numeric and a Categorical Variable
# Calculate the mean of numeric variable (e.g., Height) grouped by a categorical variable (e.g., Gender)
mean_height_by_gender <- tapply(data$Height, data$Gender, mean, na.rm = TRUE)
mean_height_by_gender

# 4. Relationship between Two Categorical Variables
# Create a contingency table for two categorical variables (e.g., Gender and Smokes)
gender_smokes_table <- table(data$Gender, data$Smokes)
gender_smokes_table

# GRAPHICAL SUMMARY 

# 1. Visualization of a Categorical Variable
# Bar plot for gender distribution
barplot(table(data$Gender),
        main = "Gender Distribution",
        col = "skyblue", 
        ylab = "Frequency")

# Pie chart for gender distribution
pie(table(data$Gender),
    main = "Gender Distribution",
    col = c("skyblue", "pink"))

# 2. Visualization of Two Categorical Variables
# Bar plot for gender and smoking status
barplot(table(data$Gender, data$Smokes), 
        beside = TRUE, 
        main = "Gender and Smoking Status", 
        col = c("skyblue", "pink"), 
        legend = TRUE)

# 3. Visualization of a Numeric Variable
# Histogram for age distribution
hist(data$Age, 
     main = "Age Distribution", 
     col = "lightgreen", 
     xlab = "Age", 
     breaks = 10)

# 4. Visualization of a Numeric and a Categorical Variable
# Boxplot for age grouped by gender
boxplot(data$Age ~ data$Gender, 
        main = "Age by Gender", 
        col = c("skyblue", "pink"), 
        xlab = "Gender", 
        ylab = "Age")

# 5. Visualization of Two Numeric Variables
# Scatter plot for height and BMI
plot(data$Height, 
     data$BMI, 
     main = "Height vs BMI", 
     col = "blue", pch = 19, 
     xlab = "Height (cm)", 
     ylab = "BMI")
