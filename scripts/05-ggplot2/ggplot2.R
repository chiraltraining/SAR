# install themes packages 
install.packages(c("ggthemes", "hrbrthemes", "ggsci", "ggpubr"))

# install color packages 
install.packages("RColorBrewer")

# load package 
library(tidyverse)
library(gtsummary)
library(ggthemes)
library(ggsci)
library(ggpubr)
library(RColorBrewer)

# data import 
data <- read.csv("data/pulse_data.csv")

# check data structure 
glimpse(data)

# convert data types 
data$Gender <- as.factor(data$Gender)
data$Smokes <- as.factor(data$Smokes)
data$Alcohol <- as.factor(data$Alcohol)
data$Exercise <- as.factor(data$Exercise)
data$Ran <- as.factor(data$Ran)
data$BMICat <- as.factor(data$BMICat)

# check data structure 
glimpse(data)

# steps in data visualization with `ggplot2` 
# 1. Aesthetic 
# 2. Visual property 
# 3. Position, shape, color, etc. 
# 4. Data 
# 5. A column in a dataset / variable 

# ggplot2 template 
ggplot(data = "", mapping = aes(x = "", y = "")) + geom_type() 

# Statistical Summary 
# 1. Numeric summary for categorical variables 
# - frequency 
# - percentage 
data |> 
  select(Ran) |> 
  tbl_summary(type = everything() ~ "categorical")

# 2. Graphical summary for categorical variables 
# - bar chart 
# - pie chart (not recommended)

# simple bar chart 
ggplot(data, aes(x = Alcohol)) + 
  geom_bar() 

# basic customization 
ggplot(data, aes(x = Alcohol, fill = Gender)) + 
  geom_bar()+
  labs(x = "Alcohol", 
       y = "Frequency", 
       title = "Distribution of alcohol status by gender", 
       subtitle = "A sample subtitle", 
       caption = "Data Source: CHIRAL")
  
# template 
ggplot(data, aes(x = '', y = '')) +
  geom_type() + 
  labs(x = 'Xlab', 
       y = 'ylab', 
       title = "TITLE", 
       subtitle = "Sub-Title", 
       caption = "Caption")

# simple bar chart 
ggplot(data, aes(x = Gender)) + 
  geom_bar()

# group bar chart (fill by a category)
ggplot(data, aes(x = Ran, fill = Gender)) +
  geom_bar()

# grouping and summarizing 
data |> 
  group_by(Gender) |> 
  summarise(mean_bmi = mean(BMI))

# box plot (small sample size)
ggplot(data, aes(x = Gender, y = BMI)) + 
  geom_boxplot()

# violin plot (large sample size)
ggplot(data, aes(x = Gender, y = BMI)) + 
  geom_violin()

# correlation 
cor(data$BMI, data$Height)
cor(data$BMI, data$Weight)
cor(data$Age, data$Height)

# scatter plot 
ggplot(data, aes(x = BMI, y = Weight)) + 
  geom_point()

# group scatter plot 
ggplot(data, aes(x = BMI, y = Weight, color = Gender)) + 
  geom_point()

# line chart 
ggplot(data, aes(x = Age, y = Height)) + 
  geom_line()

# group line chart 
ggplot(data, aes(x = Age, y = Height, color = Gender)) + 
  geom_line()

# distribution plot: histogram (bell shape, left skewed, right skewed)
ggplot(data, aes(x = BMI)) + 
  geom_histogram()

# bins and binwidth 
ggplot(data, aes(x = BMI)) + 
  geom_histogram(bins = 15, binwidth = 4)

# distribution plot: density 
ggplot(data, aes(x = BMI)) + 
  geom_density()

# group distribution 
ggplot(data, aes(x = BMI, fill = Gender)) + 
  geom_density()

# facet 
ggplot(data, aes(x = BMI, fill = Gender)) + 
  geom_density()+
  facet_wrap(~Gender)

# advance customization 
basic <- data |> 
  ggplot(aes(x = Exercise, fill = Gender)) + 
  geom_bar() + 
  labs(x = "Exercise", 
       y = "Frquency", 
       title = "Distribution of exercise by gender", 
       subtitle = "The figure shows the frequency distribution of exercise by gender", 
       caption = "Data Source: CHIRAL Bangladesh")

# show the plot 
basic

# themes 
basic + theme_bw()
basic + theme_gray()
basic + theme_fivethirtyeight()
basic + theme_foundation()
basic + theme_economist()
basic + theme_economist_white()
basic + theme_pubr()

# colors ~ fill (dynamic)
# basic colors 
basic + scale_fill_brewer()
basic + scale_fill_canva()
basic + scale_fill_colorblind()

# journal colors 
basic + scale_fill_bmj()
basic + scale_fill_frontiers()
basic + scale_fill_aaas()
basic + scale_fill_lancet()

# manual colors 
basic + scale_fill_manual(values = c("#feb24c", "#fc4e2a", "#800026"))

# fonts, font size, font family 
# set font size globally 
basic + theme_gray(base_size = 16)

# set font family globally 
basic + theme_gray(base_family = "Arial")

# font size, font family globally 
basic + theme_gray(base_size = 16, base_family = "Arial")

# font size for labels 
basic + theme(axis.title = element_text(size = 28)) # both axis 
basic + theme(axis.title.x = element_text(size = 28)) # x-axis
basic + theme(axis.title.y = element_text(size = 28)) # y-axis

# font family 
basic + theme(axis.title = element_text(family = "Arial"))

# put it together 
basic + theme(axis.title = element_text(size = 28, family = "Arial"))

# legend position 
basic + theme(legend.position = "left")
basic + theme(legend.position = "top")
basic + theme(legend.position = "bottom")

# customize legend elements - fonts, font size, family 
basic + theme(legend.title = element_text(size = 28, family = "Arial"))

# customize title, subtitle 
basic + theme(plot.title = element_text(size = 28, family = "Arial"))
basic + theme(plot.subtitle = element_text(size = 28, family = "Arial"))

# put it together 
basic <- data |> 
  ggplot(aes(x = Exercise, fill = Gender)) + 
  geom_bar() + 
  labs(x = "Exercise", 
       y = "Frquency", 
       title = "Distribution of exercise by gender", 
       subtitle = "The figure shows the frequency distribution of exercise by gender", 
       caption = "Data Source: CHIRAL Bangladesh")
basic + theme_gray(base_size = 16, base_family = "Arial")
ggsave("Exercise.png", dpi = 300)




