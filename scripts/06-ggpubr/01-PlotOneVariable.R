# Load necessary libraries
library(tidyverse)
library(ggpubr)

# Read the dataset (replace with the path to your CSV file)
data <- read.csv("data/pulse_data.csv")

# First Plot with Full Customization - BMI Distribution
data |> 
  gghistogram(x = "BMI") |> 
  ggpar(
    main = "Title", 
    submain = "Sub-title", 
    caption = "Sources: CHIRAL", 
    xlab = "BMI", 
    ylab = "Frequency", 
    font.main = c(16, "bold", "blue"), 
    font.submain = c(14, "italic", "purple"), 
    font.caption = c(10, "plain", "gray"),
    font.x = c(14, "italic", "darkred"), 
    font.y = c(14, "bold", "darkgreen"),      
    xlim = c(10, 35),  
    ylim = c(1, 6),                   
    x.text.angle = 45,                
    y.text.angle = 0,                 
    legend = "top",                   
    legend.title = "BMI Categories",       
    font.legend = c(12, "plain", "black"),  
    ggtheme = theme_minimal()
  )

# 2. Overlay Normal Density Plot with `stat_overlay_normal_density()`
ggdensity(data, 
          x = "Weight", 
          main = "Density Plot of Weight with Normal Overlay", 
          xlab = "Weight (kg)", 
          add = "mean", 
          fill = "lightgreen", 
          color = "darkgreen")

# 3. Histogram plot using `gghistogram()` - Age Distribution (without extra customization)
gghistogram(data, x = "Age", 
            bins = 10, 
            main = "Histogram of Age Distribution", 
            xlab = "Age (years)", 
            fill = "purple", 
            color = "black", 
            alpha = 0.7)

# 4. ECDF plot using `ggecdf()` - BMI Distribution (without extra customization)
ggecdf(data, x = "BMI", 
       main = "ECDF Plot of BMI", 
       xlab = "BMI", 
       color = "orange")

# 5. QQ Plot to check normality using `ggqqplot()` - Pulse1 (without extra customization)
ggqqplot(data$Pulse1, 
         main = "QQ Plot of Pulse1", 
         xlab = "Theoretical Quantiles", 
         ylab = "Sample Quantiles", 
         color = "red")
