# Load necessary libraries
library(tidyverse)
library(ggpubr)


# Read the dataset (replace with the path to your CSV file)
data <- read.csv("data/pulse_data.csv", stringsAsFactors = T)

# 1. Box Plot using `ggboxplot()`
# Box plot to show BMI distribution by Gender (Discrete X and Continuous Y)
ggboxplot(data, 
          x = "Gender", y = "BMI", 
          main = "Box Plot of BMI by Gender", 
          xlab = "Gender", ylab = "BMI",
          fill = "lightblue", color = "black", 
          palette = "jco")

# 2. Violin Plot using `ggviolin()`
# Violin plot to show Pulse1 distribution by Exercise habit
ggviolin(data, 
         x = "Exercise", y = "Pulse1", 
         main = "Violin Plot of Pulse1 by Exercise", 
         xlab = "Exercise", ylab = "Pulse1",
         fill = "lightgreen", color = "black",
         palette = "Set3")

# 3. Dot Plot using `ggdotplot()`
# Dot plot to show Pulse2 distribution by Alcohol consumption
ggdotplot(data, 
          x = "Alcohol", y = "Pulse2", 
          main = "Dot Plot of Pulse2 by Alcohol Consumption", 
          xlab = "Alcohol", ylab = "Pulse2", 
          color = "blue", fill = "yellow", 
          dot.size = 3)

# 4. Strip Chart using `ggstripchart()`
# Stripchart to show BMI distribution by Smokes habit
ggstripchart(data, 
             x = "Smokes", y = "BMI", 
             main = "Stripchart of BMI by Smokes", 
             xlab = "Smokes", ylab = "BMI", 
             color = "red", fill = "lightgray", 
             jitter = 0.2, size = 2)

# 5. Bar Plot using `ggbarplot()`
# Bar plot to show the count of Gender by Exercise habit
ggbarplot(data, 
          x = "Gender",
          y = "BMI", 
          main = "Bar Plot of Exercise by Gender", 
          xlab = "Gender", 
          ylab = "Exercise")

# 6. Line Plot using `ggline()`
# Line plot to show Pulse1 trend by Age
ggline(data, 
       x = "Age", y = "Pulse1", 
       main = "Line Plot of Pulse1 by Age", 
       xlab = "Age", ylab = "Pulse1", 
       color = "darkblue", size = 1.5, 
       add = "mean_se")

# 7. Error Plot using `ggerrorplot()`
# Error plot to show BMI distribution by Gender with error bars
ggerrorplot(data, 
            x = "Gender", y = "BMI", 
            main = "Error Plot of BMI by Gender", 
            xlab = "Gender", ylab = "BMI",
            add = "mean_se", color = "darkgreen", 
            error.plot = "crossbars", size = 2)

# 8. Pie Chart using `ggpie()`
# Pie chart to show the proportion of different BMICat categories
ggpie(data, 
      x = "BMICat", 
      main = "Pie Chart of BMI Categories", 
      fill = c("lightblue", "pink", "orange", "green"),
      color = "white", 
      label = TRUE, 
      palette = "Set1")

# 9. Donut Chart using `ggdonutchart()`
# Donut chart to show the proportion of Alcohol consumption
ggdonutchart(data, 
             x = "Alcohol", 
             main = "Donut Chart of Alcohol Consumption", 
             fill = c("lightblue", "orange"),
             label = TRUE, color = "white", 
             palette = "Set2")

# 10. Cleveland's Dot Plot using `ggdotchart()`
# Cleveland dot chart to show BMI distribution by Gender
ggdotchart(data, 
           x = "BMI", y = "Gender", 
           main = "Cleveland's Dot Plot of BMI by Gender", 
           color = "purple", 
           add = "segments", 
           theme = theme_cleveland())
