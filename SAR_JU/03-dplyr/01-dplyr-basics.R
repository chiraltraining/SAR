# Data Manipulation with R: The tidyverse Ecosystem
# Load necessary libraries
library(tidyverse)  # For data manipulation
library(gapminder)  # For example data

# Load the gapminder dataset
data <- gapminder

# 1. Exploring the Dataset
# View first few rows of the dataset
head(data)                # Default first 6 rows
head(data, 10)            # First 10 rows
head(data, n = 20)        # First 20 rows

# View last few rows of the dataset
tail(data)                # Default last 6 rows
tail(data, 10)            # Last 10 rows
tail(data, n = 20)        # Last 20 rows

# Check the dimensions of the dataset
dim(data)                 # Rows and columns
ncol(data)                # Number of columns
nrow(data)                # Number of rows

# Display column names
names(data)

# Check data structure
str(data)                 # Structure of the dataset
glimpse(data)             # Tidyverse-friendly summary

# Generate random samples from the dataset
sample_n(data, 20)        # Randomly sample 20 rows
sample_frac(data, 0.20)   # Randomly sample 20% of rows

# 2. Data Manipulation with dplyr
# General structure: function_name(data, your_desire)
# Select specific columns
select(data, country)               # Select one column by name
select(data, country, pop)          # Select multiple columns by name
select(data, 1)                     # Select column by position
select(data, 1:3)                   # Select a range of columns
select(data, -country)              # Exclude a column

# Filter rows based on conditions
filter(data, country == "Bangladesh")             # Equality condition
filter(data, gdpPercap > 800)                     # Greater than condition
filter(data, gdpPercap > 800 & lifeExp > 70)      # Combine conditions with AND
filter(data, country %in% c("Bangladesh", "India")) # Multiple values with %in%

# Create new columns using mutate()
data <- data |> 
  mutate(gdp_total = gdpPercap * pop / 10^6)      # GDP in millions

# Rename columns
data <- data |> 
  rename(population = pop)                        # Rename 'pop' to 'population'

# Group data and calculate summary statistics
data |> 
  group_by(continent) |> 
  summarise(mean_lifeExp = mean(lifeExp), 
            sd_lifeExp = sd(lifeExp))

# Arrange data by ascending or descending order
data |> 
  group_by(continent) |> 
  summarise(mean_lifeExp = mean(lifeExp)) |> 
  arrange(desc(mean_lifeExp))                    # Sort by mean life expectancy

# 3. Data Transformation
# Categorize data based on life expectancy
data <- data |> 
  mutate(lifeExpStatus = case_when(
    lifeExp < 50 ~ "Poor",
    lifeExp >= 50 & lifeExp < 70 ~ "Moderate",
    lifeExp >= 70 ~ "Good"
  ))

# View summary of the new categorization
table(data$lifeExpStatus)
