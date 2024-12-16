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

# Table 7: Association of demographic characteristics with QoL status
qol_data |> 
  select(1:8, QOL_Status) |> # Include demographic variables and QoL status
  tbl_summary(
    by = QOL_Status # Group by QoL status
  ) |> 
  add_p() |> # Add p-values for group differences
  bold_p(t = 0.05) |> # Bold significant p-values
  as_gt() |> # Convert the summary table to a gt object
  gtsave("tables/Table7.docx") # Save the table as a Word document in the specified directory
