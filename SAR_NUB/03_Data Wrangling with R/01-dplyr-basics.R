# install package 
install.packages("tidyverse") 
install.packages("skimr")
install.packages("openxlsx")
install.packages("readxl")

# load packages 
library(tidyverse)
library(skimr)
library(openxlsx)
library(readxl)

# data 
install.packages("gapminder")
library(gapminder)

# data exploration 
# 1. dimension 
dim(gapminder)
ncol(gapminder)
nrow(gapminder)

# 2. data structure 
glimpse(gapminder)
str(gapminder)

# data inspection 
# 1. examine first few rows 
head(gapminder)
head(gapminder, 10)
head(gapminder, n = 10)

# 2. examine last few rows 
tail(gapminder)
tail(gapminder, 10)
tail(gapminder, n = 10)

# 3. sampling 
sample_n(gapminder, 10)

# 4. fraction 
sample_frac(gapminder, 0.25)


# handling missing values 
# 1. check missing values 
is.na(gapminder)
is.na(airquality)

# 2. How many? 
sum(is.na(gapminder))
sum(is.na(airquality))

# 3. Which columns? 
colSums(is.na(gapminder))
colSums(is.na(airquality))

# 4. Is there any duplicated row? 
duplicated(gapminder)
duplicated(airquality)

# 5. How many? 
sum(duplicated(gapminder))
sum(duplicated(airquality))

# summary functions 
summary(gapminder)
skim(gapminder)

# data manipulation 
# function_name(data, what do you want?)

# select columns 
# 1. pick single column by name 
select(gapminder, country)

# 2. pick multiple columns by name 
select(gapminder, country, continent)

# 3. pick single column by column number 
select(gapminder, 1)

# 4. pick multiple columns by column number 
select(gapminder, c(1, 3, 4))

# 5. pick column by range (:)
select(gapminder, 1:3)

# 6. pick column by using starts_with() function 
select(gapminder, starts_with("c"))

# 7. pick column by using ends_with() function 
select(gapminder, ends_with("p"))

# 8. pick column by using contains() function 
select(gapminder, contains("c"))
select(gapminder, contains("c"), contains("p"))

# remove columns 
# 1. remove single column by name 
select(gapminder, -country)

# 2. remove multiple columns by name 
select(gapminder, -c(country, continent))

# 3. remove single column by column number 
select(gapminder, -1)

# 4. remove multiple columns by column number 
select(gapminder, -c(1, 3, 4))

# 5. remove column by range (:)
select(gapminder, -(1:3))


# filter columns 

# equality
filter(gapminder, country == "Bangladesh")

# not equality
filter(gapminder, country != "Bangladesh")

# grater
filter(gapminder, lifeExp > 30)

# less 
filter(gapminder, lifeExp < 25)

# greater or equal 
filter(gapminder, lifeExp >= 30)

# less or equal 
filter(gapminder, lifeExp <= 25)

# AND (both condition: true)
filter(gapminder, country == "Bangladesh" & lifeExp > 30)

# OR
filter(gapminder, country == "Bangladesh" | lifeExp > 30)

# filter with multiple conditions using %in% (in operator)
filter(gapminder, country %in% c("India", "Bangladesh", "Pakistan"))

# select and filter  
select(gapminder, country, continent, lifeExp)
filter(gapminder, lifeExp > 30)

# why? 
gapminder_new <- select(gapminder, country, continent, lifeExp)
filter(gapminder_new, lifeExp > 30)

# pipe operator |> (clt+shift+M) ~ chaining method 
gapminder |> 
  select(country, continent, lifeExp) |> 
  filter(lifeExp > 30) 

# mutate ~ creating new columns 
gapminder |> 
  mutate(gdp = gdpPercap * pop / 10^6) 

# mutate with case_when()
gapminder |> 
  mutate(lifeExpStatus = case_when(
    lifeExp < 25 ~ "Low", 
    lifeExp >= 30 ~ "Moderate", 
    lifeExp > 50 ~ "High"
  ))

# rename ~ mutate (add column)
gapminder |> 
  mutate(population = pop)

# rename ~ rename column (unchanged, but rename)
gapminder |> 
  rename(population = pop)


# sort / reorder : rows ~ arrange 
gapminder |> 
  # ascending
  arrange(lifeExp)

gapminder |> 
  # descending order 
  arrange(desc(pop))

# data grouping and summarize 
gapminder |> 
  group_by(continent) |> 
  summarise(mean_lifeExp = mean(lifeExp), 
            sd_lifeEx = sd(lifeExp), 
            meadian_lifeExp = median(lifeExp)) |> 
  arrange(desc(mean_lifeExp))


# data processing 
# import 
data <- read.csv("data/Thalassemia_QoL.csv")

data <- data |> 
  mutate(Physical_Health_Status = case_when(
    Physical_Health_Summary < 50 ~ "Poor", 
    Physical_Health_Summary > 50 ~ "Good", 
  ))

data <- data |> 
  mutate(Mental_Health_Status = case_when(
    Mental_Health_Summary < 50 ~ "Poor", 
    Mental_Health_Summary > 50 ~ "Good", 
  ))

# exporting data 
# 1. save RDS 
saveRDS(data, "data/QOL_Thalassemia.rds")
rds_data <- readRDS("data/QOL_Thalassemia.rds")

# 2. save as CSV 
write.csv(data, "data/QOL_Thalassemia_New.csv", row.names = F)
csv_data <- read.csv("data/QOL_Thalassemia_New.csv")

# 3. save xlsx 
write.xlsx(data, "data/QOL_Thalassemia_New.xlsx")
xlsx_data <- read_excel("data/QOL_Thalassemia_New.xlsx")
