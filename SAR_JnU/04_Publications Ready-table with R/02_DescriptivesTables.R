# Load required libraries for data manipulation and table summarization
library(tidyverse) # Provides tools for data manipulation and visualization
library(gtsummary) # Creates elegant summary tables
library(gt)         # Formats tables with advanced styling options

# Load the dataset containing Quality of Life (QoL) data for Thalassemia patients
qol_data <- read.csv("data/Thalassemia_QoL.csv")

# Table 1: Summary of demographic characteristics of the patients
qol_data |> 
  select(1:8) |> # Select the first 8 columns containing demographic variables
  tbl_summary(
    statistic = list(
      all_continuous() ~ "{mean}±{sd}" # Report mean and standard deviation for continuous variables
      # Uncomment the line below to include counts and percentages for categorical variables
      # all_categorical() ~ "{n} / {N} ({p}%)"
    )) |> 
  as_gt() |> # Convert the summary table to a gt object
  gtsave("tables/Table1.docx") # Save the table as a Word document in the specified directory

# Table 2: Summary of clinical characteristics of the patients
qol_data |> 
  select(9:17) |> # Select columns 9 to 17 containing clinical variables
  tbl_summary(
    statistic = list(
      all_continuous() ~ "{mean}±{sd}" # Report mean and standard deviation for continuous variables
    ), 
    type = c("Severity", "Previous_3Months_Transfution", "Splenectomy_Status") ~ "categorical" # Specify these variables as categorical
  ) |> 
  as_gt() |> # Convert the summary table to a gt object
  gtsave("tables/Table2.docx") # Save the table as a Word document in the specified directory