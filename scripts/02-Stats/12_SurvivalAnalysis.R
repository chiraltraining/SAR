# Load libraries
library(survival)   # For survival analysis functions
library(survminer)  # For beautiful survival curve visualizations

# Simulate a sample dataset
# Example dataset for illustrative purposes
set.seed(123)  # For reproducibility
data <- data.frame(
  time = c(5, 8, 12, 15, 18, 22, 25, 30, 35, 40),  # Survival times
  status = c(1, 1, 0, 1, 1, 0, 1, 0, 1, 1),         # Event occurrence (1=event, 0=censored)
  group = c("A", "B", "A", "B", "A", "B", "A", "B", "A", "B")  # Two treatment groups
)

# Examine the dataset
data

# Kaplan-Meier Survival Estimation
# Create a Surv object for survival analysis
surv_obj <- Surv(data$time, data$status)

# Fit Kaplan-Meier survival curves for groups
group_fit <- survfit(surv_obj ~ group, data = data)

# Summary of the survival model
summary(group_fit)

# Plot Kaplan-Meier survival curves
km_plot <- ggsurvplot(
  group_fit, 
  data = data,
  conf.int = TRUE,                # Add confidence intervals
  pval = TRUE,                    # Add p-value for log-rank test
  risk.table = TRUE,              # Add risk table below the plot
  ggtheme = theme_minimal(),      # Use a minimal theme
  palette = c("#E41A1C", "#377EB8")  # Custom colors for groups
)
km_plot

# Cox Proportional Hazards Model
cox_fit <- coxph(surv_obj ~ group, data = data)

# Summary of the Cox model
summary(cox_fit)

# Plot Cox model diagnostics
cox_zph <- cox.zph(cox_fit)  # Test proportional hazards assumption
cox_zph

# Visualize scaled Schoenfeld residuals to check proportional hazards
ggcoxzph(cox_zph)

# Generate newdata for adjusted survival curves
# Use distinct values from the original dataset
new_data <- data.frame(group = unique(data$group))
new_data

# Visualize the adjusted survival curves based on the Cox model
cox_surv_plot <- ggsurvplot(
  survfit(cox_fit, newdata = new_data),  # Fit the Cox model for the new data
  data = data,
  ggtheme = theme_minimal(),
  palette = c("#E41A1C", "#377EB8"),    # Two colors for two groups
  conf.int = TRUE                       # Add confidence intervals
)

# Print the plot
cox_surv_plot

