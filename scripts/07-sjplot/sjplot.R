# load required packages 
library(tidyverse)
library(ISLR)
library(sjPlot)
library(likert)

# Use Wage 
data <- Wage

# view df 
view_df(data, show.frq = T, show.prc = T, show.na = T)

# bar chart 
data |> 
  plot_frq(education)

# grid bar chart 
data |> 
  group_by(race) |> 
  plot_frq(education) |> 
  plot_grid()

# group frequency / bar chart 
plot_grpfrq(
  var.cnt = data$education, 
  var.grp = data$jobclass
)

# xtab
plot_xtab(
  x = data$education, 
  grp = data$jobclass, 
  margin = "row", 
  bar.pos = "stack", 
  show.summary = TRUE, 
  coord.flip = TRUE
)

# distribution - histogram 
data |> 
  group_by(jobclass) |> 
  plot_frq(
    wage, 
    type = "histogram", 
    show.mean = T, 
    normal.curve = T
  ) |> 
  plot_grid()

# distribution - boxplot 
data |> 
  group_by(jobclass) |> 
  plot_frq(
    wage, 
    type = "box"
  ) |> 
  plot_grid()


data("pisaitems")
items1 <- pisaitems
items1 <- items |> 
  select(starts_with("ST25Q"))
plot_likert(items1)


items2 <- pisaitems
items2 <- items2 |> 
  select(starts_with("ST24Q"))
plot_likert(items2)

# customization
basic <- plot_xtab(
  x = data$education, 
  grp = data$jobclass, 
  margin = "row", 
  bar.pos = "stack", 
  show.summary = TRUE, 
  coord.flip = TRUE
)

basic + labs(
  y = "Counts(%)",
  x = "Education", 
  title = "Job class by education", 
  subtitle = "sub-title", 
  caption = "caption"
) + theme_bw()
save_plot("edu-job.png", dpi = 600, height = 40, width = 30)

library(ggsci)
library(ggthemes)
basic

basic + theme_economist()




# Impact of education on salary 
library(easystats)
model <- lm(wage ~ education, data = Wage)
report(model) |> 
  summary()

plot_model(model, type = "pred")

plot_model(
  model,
  show.values = TRUE, 
  width = 0
) + ylab("Increase in salary as compared to education")


tab_model(
  model,
  show.reflvl = T, 
  show.intercept = F, 
  p.style = "numeric_stars"  
) 






