# load packages 
library(tidyverse)
library(ggpubr)
library(ggthemes)
library(ggsci)
library(RColorBrewer)

# data 
data <- read.csv("data/pulse_data.csv")

# histogram 
data |> 
  gghistogram(x = "BMI") |> 
  ggpar(
    main = "Ttile", 
    submain = "Sub-title", 
    caption = "Sources: CHIRAL", 
    xlab = "XLab",
    ylab = "Ylab", 
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
    legend.title = "Cylinders",       
    font.legend = c(12, "plain", "black"),  
    ggtheme = theme_minimal()
  )











