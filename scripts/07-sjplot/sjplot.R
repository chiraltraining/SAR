# Load required libraries
library(tidyverse)    # Data manipulation and visualization
library(ISLR)         # Contains the 'Wage' dataset
library(sjPlot)       # For advanced plotting and tabular outputs
library(likert)       # For Likert scale data visualization

# Load and explore the Wage dataset
data <- Wage

# View dataset structure and frequency distribution
view_df(data, show.frq = TRUE, show.prc = TRUE, show.na = TRUE)

# ---------------------
# Bar chart of education levels
data |> 
  plot_frq(education)

# Grid bar chart by race (distribution of education levels within each race group)
data |> 
  group_by(race) |> 
  plot_frq(education) |> 
  plot_grid()

# Grouped bar chart: Education levels by job class
plot_grpfrq(
  var.cnt = data$education,  # Categorical variable to count
  var.grp = data$jobclass    # Grouping variable
)

# Cross-tabulation: Education vs Job class
plot_xtab(
  x = data$education,    # X-axis: Education
  grp = data$jobclass,   # Grouping variable: Job class
  margin = "row",        # Show row percentages
  bar.pos = "stack",     # Stack the bars
  show.summary = TRUE,   # Show summary statistics
  coord.flip = TRUE      # Flip coordinates for horizontal bars
)

# ---------------------
# Distribution analysis (Histogram)
data |> 
  group_by(jobclass) |> 
  plot_frq(
    wage,                 # Variable: Wage
    type = "histogram",   # Plot type: Histogram
    show.mean = TRUE,     # Display mean
    normal.curve = TRUE   # Overlay a normal distribution curve
  ) |> 
  plot_grid()

# Distribution analysis (Boxplot)
data |> 
  group_by(jobclass) |> 
  plot_frq(
    wage,        # Variable: Wage
    type = "box" # Plot type: Boxplot
  ) |> 
  plot_grid()

# ---------------------
# Likert scale analysis using 'pisaitems' dataset
data("pisaitems")  # Load PISA items dataset
items1 <- pisaitems |> 
  select(starts_with("ST25Q"))  # Select Likert items starting with 'ST25Q'

# Plot Likert scale responses for selected items
plot_likert(items1)

items2 <- pisaitems |> 
  select(starts_with("ST24Q"))  # Select Likert items starting with 'ST24Q'

# Plot Likert scale responses for another set of items
plot_likert(items2)

# ---------------------
# Customization example for cross-tabulation plot
basic <- plot_xtab(
  x = data$education,    # X-axis: Education
  grp = data$jobclass,   # Grouping variable: Job class
  margin = "row",        # Show row percentages
  bar.pos = "stack",     # Stack bars
  show.summary = TRUE,   # Display summary statistics
  coord.flip = TRUE      # Horizontal orientation
)

# Enhance with additional labels and themes
customized_plot <- basic + 
  labs(
    y = "Counts (%)",
    x = "Education", 
    title = "Job Class by Education", 
    subtitle = "Sub-title", 
    caption = "Source: Wage Dataset"
  ) + 
  theme_bw()  # Apply a clean, white background theme

# Save the customized plot as an image
save_plot("edu-job.png", dpi = 600, height = 40, width = 30)

# Experiment with different themes
library(ggsci)    # Scientific color themes
library(ggthemes) # Additional theme options
basic + theme_economist()

# ---------------------
# Impact of Education on Salary (Linear Model)
library(easystats) # Model reporting and evaluation tools

# Build a linear regression model
model <- lm(wage ~ education, data = Wage)

# Summarize and report the model
report(model) |> 
  summary()

# Plot predicted values from the model
plot_model(model, type = "pred")

# Plot regression coefficients with values
plot_model(
  model,
  show.values = TRUE, 
  width = 0
) + 
  ylab("Increase in Salary Compared to Education")

# Display the model summary in a tabular format
tab_model(
  model,
  show.reflvl = TRUE,    # Show reference levels
  show.intercept = FALSE, # Hide intercept in output
  p.style = "numeric_stars" # Use stars for significance
)
