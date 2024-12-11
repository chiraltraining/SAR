# Load necessary libraries
library(tidyverse)     # For data manipulation and visualization
library(easystats)     # For reporting and interpreting models
library(gtsummary)
library(gt)

# Example Dataset: Monthly dengue cases in a city
# Simulate the data for the lecture
set.seed(123)  # For reproducibility
dengue_data <- tibble(
  Month = rep(1:12, times = 3),  # Months (repeated for 3 years)
  Year = rep(2018:2020, each = 12),  # Years
  Temperature = rnorm(36, mean = 30, sd = 2),  # Average temperature (°C)
  Rainfall = rnorm(36, mean = 150, sd = 50),   # Monthly rainfall (mm)
  DengueCases = rpois(36, lambda = 30)         # Number of dengue cases
)

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
# - Poison regression 

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
# - Poison regression 

# Visualizing Results
# Predicted vs. Observed Dengue Cases
dengue_data <- dengue_data  |> 
  mutate(
    PredictedCases = predict(mv_poisson, type = "response")  # Predicted counts
  )
dengue_data

# Plot observed vs. predicted cases
ggplot(dengue_data, aes(x = Month, y = DengueCases, group = Year)) +
  geom_line(aes(color = factor(Year)), size = 1.2) +  # Observed cases
  geom_point(aes(y = PredictedCases, shape = "Predicted"), size = 2, color = "red") +
  labs(
    title = "Observed vs. Predicted Dengue Cases",
    x = "Month",
    y = "Number of Dengue Cases",
    color = "Year",
    shape = "Legend"
  ) +
  theme_minimal()
