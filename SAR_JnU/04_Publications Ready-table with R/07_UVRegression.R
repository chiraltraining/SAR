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

# impact of gender on quality of life(QOL_Score)
uv_lm <- lm(QOL_Score ~ Gender, data = qol_data)
report(uv_lm)

# impact of gender on quality of life status (QOL_Status)
uv_logreg <- glm(QOL_Status ~ Gender, data = qol_data, family = "binomial")
report(uv_logreg)

# Factors associated with quality of life score in the linear regression analysis
qol_data |> 
  select(1:17, QOL_Score) |> 
  tbl_uvregression(
    method = lm, 
    y = QOL_Score
  ) |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/UV_LinReg.docx")

# Factors associated with quality of life score in the univariate logistic regression analysis
qol_data |> 
  select(1:17, QOL_Status) |> 
  tbl_uvregression(
    method = glm, 
    method.args = list(family = binomial), 
    y = QOL_Status, 
    exponentiate = TRUE
  ) |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/UV_LogReg.docx")




