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
    QOL_Score <= 50 ~ "Poor",  # QoL score <= 50 is classified as "Poor"
    QOL_Score > 50 ~ "Good"    # QoL score > 50 is classified as "Good"
  ))
# select numeric variables 
num_data <- qol_data |> 
  select(18:28)

# perform correlation between 2 variables 
cor(num_data$Physical_Functioning, num_data$QOL_Score)

# perform correlation test 
corr_test <- cor.test(num_data$Physical_Functioning, num_data$QOL_Score)
report(corr_test)

# correlation matrix 
results <- correlation(num_data) 
results |> 
  summary(redundant = TRUE) |> 
  plot()
