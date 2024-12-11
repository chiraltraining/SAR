# Load required libraries for data manipulation and table summarization
library(tidyverse) # Provides tools for data manipulation and visualization
library(gtsummary) # Creates elegant summary tables
library(gt)         # Formats tables with advanced styling options
library(easystats)

# Load the dataset containing Quality of Life (QoL) data for Thalassemia patients
qol_data <- read.csv("data/Thalassemia_QoL.csv")

# Add a new column to classify Quality of Life (QoL) status based on QOL_Score
qol_data <- qol_data |> 
  mutate(QOL_Status = case_when(
    QOL_Score <= 50 ~ 0,  # QoL score <= 50 is classified as "Poor"
    QOL_Score > 50 ~ 1    # QoL score > 50 is classified as "Good"
))

# Fit the multiple linear regression model
mv_model <- lm(QOL_Score ~ Age_of_Participants + Gender + Marital_Status + 
              Type_of_Family + Level_of_Education + Occupational_Status + 
              Area_of_Residence + Economic_Class + Diagnosis + Severity + 
              Transfusion_Status + Frequency_of_Blood_Transfusion + 
              Previous_3Months_Transfution + Splenectomy_Status + 
              Comorbidities_Status + Ironchelating_Therapy_Status + 
              Medical_Expense, data = qol_data)
report(mv_model)

# tabular form 
mv_model |> 
  tbl_regression() |> 
  bold_p(t = 0.05)

# impact of gender and diagnos on quality of life status (QOL_Status)
mv_logreg <- glm(QOL_Status ~ Age_of_Participants + Gender + Marital_Status + 
                   Type_of_Family + Level_of_Education + Occupational_Status + 
                   Area_of_Residence + Economic_Class + Diagnosis + Severity + 
                   Transfusion_Status + Frequency_of_Blood_Transfusion + 
                   Previous_3Months_Transfution + Splenectomy_Status + 
                   Comorbidities_Status + Ironchelating_Therapy_Status + 
                   Medical_Expense, 
                 data = qol_data, 
                 family = binomial)
report(mv_logreg)

# tabular 
mv_logreg |> 
  tbl_regression(exponentiate = TRUE)
