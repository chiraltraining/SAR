# Association Tests
# Chi-square and Fisher’s exact tests are used to assess associations between two categorical variables.
# - Chi-square test: Suitable for larger sample sizes.
# - Fisher's exact test: Preferred for smaller sample sizes or when expected frequencies in the contingency table are low.

# Load necessary packages 
library(tidyverse)   # For data wrangling and visualization
library(easystats)   # For statistical analyses and summaries

# Load the dataset
# Replace "data/pulse_data.csv" with your file path if it's not in the working directory
data <- read.csv("data/pulse_data.csv")

# Chi-square is used when the expected frequency in each cell of the contingency table is >= 5.
# Create a contingency table
gender_smokes_table <- table(data$Gender, data$Smokes)
gender_smokes_table

# Perform the Chi-square test
chi_sq_test <- chisq.test(gender_smokes_table)
chi_sq_test

# Report 
report(chi_sq_test)


# Perform Fisher’s exact test
fisher_test <- fisher.test(gender_smokes_table)
fisher_test

# Report 
report(fisher_test)

