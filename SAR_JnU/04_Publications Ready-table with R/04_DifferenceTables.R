# Load required libraries for data manipulation and table summarization
library(tidyverse) # Provides tools for data manipulation and visualization
library(gtsummary) # Creates elegant summary tables
library(gt)         # Formats tables with advanced styling options

# Load the dataset containing Quality of Life (QoL) data for Thalassemia patients
qol_data <- read.csv("data/Thalassemia_QoL.csv")

# Add a new column to classify Quality of Life (QoL) status based on QOL_Score
qol_data <- qol_data |> 
  mutate(QOL_Status = case_when(
    QOL_Score <= 50 ~ "Poor",  # QoL score <= 50 is classified as "Poor"
    QOL_Score > 50 ~ "Good"    # QoL score > 50 is classified as "Good"
))

# Table 5: Quality of Life domains score difference by gender (2 groups)
qol_data |> 
  select(18:27, Gender) |> # Select domain scores and gender
  tbl_summary(
    by = Gender, # Group by gender
    type = everything() ~ "continuous", # Treat all variables as continuous
    statistic = all_continuous() ~ "{mean}±{sd}" # Report mean and standard deviation
  ) |> 
  add_p() |> # Add p-values for group differences
  bold_p(t = 0.05) |> # Bold significant p-values
  as_gt() |> # Convert the summary table to a gt object
  gtsave("tables/Table5.docx") # Save the table as a Word document in the specified directory

# Table 6: Quality of Life domains score difference by economic class (more than 2 groups)
qol_data |> 
  select(18:27, Economic_Class) |> # Select domain scores and economic class
  tbl_summary(
    by = Economic_Class, # Group by economic class
    type = everything() ~ "continuous", # Treat all variables as continuous
    statistic = all_continuous() ~ "{mean}±{sd}" # Report mean and standard deviation
  ) |> 
  add_p() |> # Add p-values for group differences
  bold_p(t = 0.05) |> # Bold significant p-values
  as_gt() |> # Convert the summary table to a gt object
  gtsave("tables/Table6.docx") # Save the table as a Word document in the specified directory
