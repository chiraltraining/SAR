# Load required libraries for data manipulation and table summarization
# Learn more: https://www.danieldsjoberg.com/gtsummary/articles/tbl_summary.html
library(tidyverse) # Provides tools for data manipulation and visualization
library(gtsummary) # Creates elegant summary tables
library(gt)         # Formats tables with advanced styling options

# Examine the built-in dataset 'trial' (provided by gtsummary)
head(trial) # View the first few rows of the 'trial' dataset

# Select specific variables of interest for analysis
trial2 <- trial |> select(trt, age, grade) # 'trt': treatment group, 'age': patient age, 'grade': tumor grade

# Basic usage of tbl_summary(): Generate a summary table for all variables
trial2 |> 
  tbl_summary()

# Generate a cross-tabulated summary table by treatment group ('trt')
trial2 |> 
  tbl_summary(by = trt) # Compare variables split by treatment groups

# Customize the tbl_summary() function arguments for a more detailed table
trial2 |> 
  tbl_summary(
    by = trt, # Group the summary table by treatment
    statistic = list(
      all_continuous() ~ "{mean} ({sd})", # Show mean and standard deviation for continuous variables
      all_categorical() ~ "{n} / {N} ({p}%)" # Show counts, total, and percentages for categorical variables
    ),
    digits = all_continuous() ~ 2, # Round continuous variables to 2 decimal places
    label = grade ~ "Tumor Grade", # Customize label for 'grade' variable
    missing_text = "(Missing)" # Display text for missing values
  )

# Add more details to the summary table using gtsummary add-on functions
trial2 |> 
  tbl_summary(
    by = trt, 
    statistic = list(
      all_continuous() ~ "{mean} ({sd})",
      all_categorical() ~ "{n} / {N} ({p}%)"
    ),
    digits = all_continuous() ~ 2,
    label = grade ~ "Tumor Grade",
    missing_text = "(Missing)"
  ) |> 
  add_overall() |> # Add a column with overall statistics
  add_n() |>       # Add a column with the number of observations per group
  add_p() |>       # Add p-values for statistical comparisons
  bold_p(t = 0.05) |>      # Bold significant p-values
  add_q()          # Add q-values for multiple testing correction

# Format the summary table for publication-ready output
trial2 |> 
  tbl_summary(by = trt) |> 
  add_p(pvalue_fun = label_style_pvalue(digits = 2)) |> # Format p-values to 2 decimal places
  add_overall() |> # Add overall statistics column
  add_n() |>       # Add number of observations column
  modify_header(label ~ "**Variable**") |> # Customize header for the 'Variable' column
  modify_spanning_header(
    c("stat_1", "stat_2") ~ "**Treatment Received**" # Add spanning header over grouped statistics
  ) |> 
  modify_footnote(
    all_stat_cols() ~ "Median (IQR) or Frequency (%)" # Add footnote for statistics columns
  ) |> 
  modify_caption("**Table 1. Patient Characteristics**") |> # Add a caption to the table
  bold_labels() |>       # Bold the variable labels
  italicize_labels() |>   # Italicize the variable labels
  italicize_levels()      # Italicize the levels of categorical variables

# Convert the summary table to a gt object for advanced formatting
trial2 |> 
  tbl_summary(by = trt, missing = "no") |> # Do not display missing value counts
  add_n() |> # Add number of observations column
  as_gt() |> # Convert to gt object
  gt::tab_source_note(gt::md("*This data is simulated*")) # Add a source note to the table
