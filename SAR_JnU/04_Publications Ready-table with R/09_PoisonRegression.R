# Load necessary libraries
library(tidyverse)     # For data manipulation and visualization
library(easystats)     # For reporting and interpreting models
library(gtsummary)
library(gt)

# import dengue data 
dengue_data <- read.csv("data/dengue_data.csv")

# Preview the dataset
glimpse(dengue_data)

# Poisson Regression
# Univariate Poisson Regression: Effect of Rainfall on Dengue Cases
uv_poisson <- glm(DengueCases ~ Rainfall, 
                  data = dengue_data, 
                  family = poisson(link = "log"))  # Specify Poisson distribution

# Summarize the univariate Poisson regression model
summary(uv_poisson)

# Reporting results
report(uv_poisson)

# table 
uv_poisson |> 
  tbl_regression()


# Multivariate Poisson Regression
# Multivariate Poisson Regression: Effect of Rainfall and Temperature
mv_poisson <- glm(DengueCases ~ Rainfall + Temperature, 
                  data = dengue_data, 
                  family = poisson(link = "log"))  # Specify Poisson distribution

# Summarize the multivariate Poisson regression model
summary(mv_poisson)

# Reporting results
report(mv_poisson)

# table 
mv_poisson |> 
  tbl_regression()
