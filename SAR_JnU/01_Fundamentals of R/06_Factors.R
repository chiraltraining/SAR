# Introduction to Factors
# Factors are used to handle categorical data (data with a fixed number of possible values, often called levels) in R. 
# They are an essential data structure for statistical modeling and are treated specially in many R functions.

# Factors can be created using the `factor()` function.
# Example: Nominal Factor
gender_vector <- c("Male", "Female", "Female", "Male", "Female")
gender_factor <- factor(gender_vector)

# Specifying Levels
# Example: Explicitly Specify Levels
gender <- factor(c("Male", "Female", "Female", "Male", "Female"), 
                 levels = c("Male", "Female"))

gender

# Ordered Factors
# Example: Ordered Factor
temperature <- factor(c("Low", "Medium", "High"),
                    levels = c("Low", "Medium", "High"),
                    ordered = TRUE)

temperature

# Access Levels
levels(temperature)

# Change Levels
levels(gender) <- c("F", "M")
gender

# Number of Levels
nlevels(gender)

# Convert to Numeric
as.integer(gender)




