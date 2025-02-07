library(tidyverse)
library(readxl)

# read wide data 
wide_data <- readxl::read_excel("data/Life_Expectancy_Wide.xlsx")

# wide to long 
long_data <- wide_data |> 
  pivot_longer(cols = 2:75, 
               names_to = "Year", 
               values_to = "Life_Expectancy")
# read long data 
long_data <- readxl::read_excel("data/Life_Expectancy_Long.xlsx")

# long to wide 
wide_data <- long_data |> 
  pivot_wider(names_from = Year, 
              values_from = LifeExp)


