# Install required packages
install.packages(c("ggthemes", "hrbrthemes", "ggsci", "ggpubr", "RColorBrewer"))

# Load necessary libraries
library(tidyverse)      # For data manipulation and visualization
library(gtsummary)      # For summarizing data
library(ggthemes)       # For additional ggplot themes
library(ggsci)          # For scientific color palettes
library(ggpubr)         # For creating plots with easy ggplot2 integration
library(RColorBrewer)   # For color palettes

# Import the dataset
data <- read.csv("data/pulse_data.csv")

# Inspect the structure of the dataset
glimpse(data)

# Convert variables to appropriate factor types
data$Gender   <- as.factor(data$Gender)
data$Smokes   <- as.factor(data$Smokes)
data$Alcohol  <- as.factor(data$Alcohol)
data$Exercise <- as.factor(data$Exercise)
data$Ran      <- as.factor(data$Ran)
data$BMICat   <- as.factor(data$BMICat)

# Recheck the structure after conversions
glimpse(data)

# 1. Data Visualization Process with ggplot2

# 1.1 Define basic ggplot2 template structure
ggplot(data = data, mapping = aes(x = "", y = "")) + 
  geom_bar()  # Example: Replace with actual plot type

# 2. Descriptive Statistics and Summarization

# 2.1 Numeric summary for categorical variables (Frequency and Percentage)
data %>%
  select(Ran) %>%
  tbl_summary(type = everything() ~ "categorical")

# 3. Graphical Summary of Categorical Data

# 3.1 Simple bar chart (single categorical variable)
ggplot(data, aes(x = Alcohol)) + 
  geom_bar() + 
  labs(x = "Alcohol Status", y = "Frequency", title = "Alcohol Consumption Distribution")

# 3.2 Customizing bar chart (fill by gender)
ggplot(data, aes(x = Alcohol, fill = Gender)) + 
  geom_bar() +
  labs(
    x = "Alcohol", 
    y = "Frequency", 
    title = "Alcohol Consumption by Gender", 
    subtitle = "A comparison of alcohol consumption based on gender", 
    caption = "Data Source: CHIRAL"
  )

# 3.3 Group bar chart (categorical variable with grouping)
ggplot(data, aes(x = Ran, fill = Gender)) +
  geom_bar() + 
  labs(x = "Ran", y = "Frequency", title = "Running Status by Gender")

# 4. Summary of Data (Grouping and Summarizing)

# 4.1 Summarize BMI by gender
data %>%
  group_by(Gender) %>%
  summarise(mean_bmi = mean(BMI, na.rm = TRUE))

# 5. Box Plot and Violin Plot for Distribution

# 5.1 Box plot for BMI by gender
ggplot(data, aes(x = Gender, y = BMI)) + 
  geom_boxplot() + 
  labs(x = "Gender", y = "BMI", title = "BMI Distribution by Gender")

# 5.2 Violin plot for BMI by gender (for larger sample sizes)
ggplot(data, aes(x = Gender, y = BMI)) + 
  geom_violin() + 
  labs(x = "Gender", y = "BMI", title = "BMI Distribution by Gender (Violin Plot)")

# 6. Correlation Analysis

# 6.1 Calculate correlation between BMI and Height, BMI and Weight, Age and Height
cor(data$BMI, data$Height, use = "complete.obs")
cor(data$BMI, data$Weight, use = "complete.obs")
cor(data$Age, data$Height, use = "complete.obs")

# 7. Scatter Plots and Line Charts

# 7.1 Scatter plot of BMI vs Weight
ggplot(data, aes(x = BMI, y = Weight)) + 
  geom_point() + 
  labs(x = "BMI", y = "Weight", title = "Scatter Plot: BMI vs Weight")

# 7.2 Grouped scatter plot by gender
ggplot(data, aes(x = BMI, y = Weight, color = Gender)) + 
  geom_point() + 
  labs(x = "BMI", y = "Weight", title = "Scatter Plot: BMI vs Weight by Gender")

# 7.3 Line chart for Age vs Height
ggplot(data, aes(x = Age, y = Height)) + 
  geom_line() + 
  labs(x = "Age", y = "Height", title = "Line Chart: Age vs Height")

# 7.4 Grouped line chart by gender
ggplot(data, aes(x = Age, y = Height, color = Gender)) + 
  geom_line() + 
  labs(x = "Age", y = "Height", title = "Line Chart: Age vs Height by Gender")

# 8. Distribution Plots (Histogram and Density)

# 8.1 Histogram of BMI distribution
ggplot(data, aes(x = BMI)) + 
  geom_histogram(bins = 15) + 
  labs(x = "BMI", y = "Frequency", title = "BMI Distribution")

# 8.2 Density plot of BMI
ggplot(data, aes(x = BMI)) + 
  geom_density() + 
  labs(x = "BMI", y = "Density", title = "Density Plot of BMI")

# 8.3 Grouped density plot by gender
ggplot(data, aes(x = BMI, fill = Gender)) + 
  geom_density(alpha = 0.5) + 
  labs(x = "BMI", y = "Density", title = "Density Plot of BMI by Gender")

# 8.4 Faceted density plot by gender
ggplot(data, aes(x = BMI, fill = Gender)) + 
  geom_density() +
  facet_wrap(~Gender) + 
  labs(x = "BMI", y = "Density", title = "Density Plot of BMI by Gender (Faceted)")

# 9. Advanced Customization

# 9.1 Bar chart with custom themes and labels
basic <- ggplot(data, aes(x = Exercise, fill = Gender)) + 
  geom_bar() + 
  labs(
    x = "Exercise", 
    y = "Frequency", 
    title = "Distribution of Exercise by Gender", 
    subtitle = "Frequency of exercise status grouped by gender", 
    caption = "Data Source: CHIRAL Bangladesh"
  )

# Show the plot
basic

# 9.2 Apply different ggplot themes
basic + theme_bw()       # Black & white theme
basic + theme_gray()     # Gray theme
basic + theme_fivethirtyeight()  # FiveThirtyEight theme
basic + theme_foundation()       # Foundation theme
basic + theme_economist()        # Economist theme
basic + theme_pubr()            # PubR theme

# 9.3 Custom colors for the plot
basic + scale_fill_brewer()    # Brewer color palette
basic + scale_fill_manual(values = c("#feb24c", "#fc4e2a", "#800026"))  # Custom color palette

# 9.4 Customize font size and family
basic + theme_gray(base_size = 16)  # Set base font size globally
basic + theme_gray(base_family = "Arial")  # Set font family globally

# 9.5 Customize axis titles and legend
basic + theme(axis.title = element_text(size = 28, family = "Arial"))
basic + theme(legend.position = "top")

# 9.6 Customize plot titles and subtitles
basic + theme(plot.title = element_text(size = 28, family = "Arial"))
basic + theme(plot.subtitle = element_text(size = 20, family = "Arial"))

# 9.7 Save the final plot as an image
ggsave("Exercise_Distribution_by_Gender.png", plot = basic, dpi = 300)
