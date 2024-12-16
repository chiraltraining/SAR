# Load necessary libraries
library(tidyverse)

# Generate Example Data
# Patient demographics data
demographics <- data.frame(
  PatientID = 1:5,
  Name = c("Alice", "Bob", "Charlie", "Diana", "Ethan"),
  Age = c(34, 45, 29, 50, 41),
  Gender = c("Female", "Male", "Male", "Female", "Male")
)
demographics

# Medical test results
tests <- data.frame(
  PatientID = c(1, 2, 3, 4, 5, 3, 4),
  TestType = c("Blood Pressure", "Cholesterol", "Blood Sugar", "Cholesterol", "Blood Pressure", "Blood Sugar", "Blood Pressure"),
  TestResult = c(120, 190, 140, 200, 130, 150, 110)
)
tests

# Medication prescription data
medications <- data.frame(
  PatientID = c(1, 2, 2, 3, 4),
  Medication = c("Aspirin", "Metformin", "Statin", "Insulin", "Statin"),
  Dose = c("100mg", "500mg", "20mg", "10mg", "20mg")
)
medications

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
