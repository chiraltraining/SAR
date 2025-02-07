# load packages 
library(tidyverse)
library(skimr)
library(naniar)
library(stringr)

# finding missing value 
test <- c(0, NA, -1)
test 

test2 <- test/0
test2

# look for NA 
is.na(test)
sum(is.na(test))

# look for NaN 
is.nan(test2)
sum(is.nan(test2))

# look for Inf 
is.infinite(test2)
sum(is.infinite(test2))

# using any() 
any(is.na(test))

# starwars 
starwars
names(starwars)

# check missing 
any(is.na(starwars))

# count NA/missing values 
starwars |> 
  count(sex)

# pct_complete 
starwars |> 
  select(gender) |> 
  pct_complete()

# miss_var_summary() 
miss_var_summary(starwars)

# gg_miss_var()
gg_miss_var(starwars)

# missing data issues 
sum(c(1, 2, 3, NA))
mean(c(1, 2, 3, NA))
median(c(1, 2, 3, NA))

# removing missing value 
sum(c(1, 2, 3, NA), na.rm = T)
mean(c(1, 2, 3, NA), na.rm = T)
median(c(1, 2, 3, NA), na.rm = T)

# filter() and missing data 
starwars |> 
  filter(sex == "male" | is.na(sex))

# check missing values 
sum(is.na(starwars))

# drop missing values 
dim(starwars)

# drop 
starwars_drop <- drop_na(starwars)

# check dimension again 
dim(starwars_drop)

gg_miss_var(starwars_drop)

# drop columns 
miss_var_summary(starwars)

miss_var_which(starwars)

# remove missing columns 
starwars |> 
  select(!miss_var_which(starwars))

# Change a value to be NA
starwars |> 
  mutate(gender = na_if(gender, "99"))


# dealing with missing values 
glimpse(starwars)

starwars <- starwars |> 
  mutate_if(is.character, as.factor)
glimpse(starwars)

# numeric imputation - mean, median 
mean(starwars$height, na.rm = T)
median(starwars$height, na.rm = T)

# mean 
starwars <- starwars |> 
  mutate(height = replace_na(mean(height, na.rm = T)))

# median 
starwars <- starwars |> 
  mutate(height = replace_na(median(height, na.rm = T)))

miss_var_summary(starwars)


# categorical imputation - mode (most frequent value)
starwars$sex <- as.factor(starwars$sex) 

starwars |> 
  count(sex) |> 
  arrange(desc(n))

starwars <- starwars |> mutate(sex = replace_na("male"))

miss_var_summary(starwars)

# imputations 2 types 
# 1. numeric 
# 2. categoric 

# reading diet data 
data_diet <- readxl::read_excel("data/cleaning_diet_data.xlsx")

# count 
data_diet |> 
  count(Treatment)

data_diet |> 
  mutate(Treatment_Recoded = case_when(
    Treatment == "O" ~ "Other", 
    Treatment == "Other" ~ "Other",
    Treatment == "Ginger" ~ "Ginger",
    Treatment == "mint" ~ "Peppermint", 
    Treatment == "Mint" ~ "Peppermint", 
    Treatment == "peppermint" ~ "Peppermint", 
  )) |> 
  count(Treatment_Recoded)

# efficient 
data_diet |> 
  mutate(Treatment = case_when(
    Treatment == "Ginger" ~ "Ginger", 
    Treatment %in% c("Mint", "mint", "Peppermint", "peppermint") ~ "Peppermint", 
    Treatment %in% c("O", "Other") ~ "Other"
  )) |> 
  count(Treatment)

data_diet <- data_diet |> 
  mutate(Effect = case_when(Weight_change > 0 ~ "Increase",
                            Weight_change == 0 ~ "Same",
                            Weight_change < 0 ~ "Decrease"))
head(data_diet)


# str_detect()
data_diet |> 
  filter(str_detect(string = Effect, pattern = "D"))

data_diet |> 
  filter(str_detect(string = Effect, pattern = "I"))

data_diet |> 
  filter(str_detect(string = Effect, pattern = "S"))

# detect and replace 
data_diet |> 
  filter(str_detect(Effect, pattern = "D"), str_replace_all("d"))

# detect and replace 
data_diet |> 
  mutate(Treatment_recoded = case_when(
    str_detect(string = Treatment, pattern = "int") ~ "Peppermint",
    str_detect(string = Treatment, pattern = "^o|^O") ~ "Other",
    TRUE ~ Treatment))  |> 
  count(Treatment, Treatment_recoded)

data_diet |> 
  count(Treatment)



