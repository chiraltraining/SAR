# Load necessary libraries
library(tidyverse)

# Patient demographics data
demographics <- read.csv("data/demographics.csv")

# Medical test results
tests <- read.csv("data/tests.csv")

# Medication prescription data
medications <- read.csv("data/medications.csv")


# Merge demographics and tests data
demographics_tests <- merge(demographics, 
                            tests, 
                            by = "PatientID", 
                            all = TRUE)
demographics_tests

# Merge the resulting data with medications
merged_data <- merge(demographics_tests,
                     medications, 
                     by = "PatientID")
merged_data
