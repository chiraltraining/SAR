# Control Flow 
# Using one condition
# If the number is greater than 0, it is positive. Otherwise, it is negative.

num <- 10
if (num > 0) {
  print("positive")  # Decision: number is positive
}

# Using two conditions
# If block for positive, else block for negative.

num2 <- -10
if (num2 > 0) {
  print("positive")  # Decision: number is positive
} else {
  print("negative")  # Decision: number is negative
}

# Using more than two conditions (example: BMI classification)
bmi <- 31
if (bmi < 18.5) {
  print("underweight")  # BMI less than 18.5
} else if (bmi < 25) {
  print("normal weight")  # BMI between 18.5 and 24.9
} else if (bmi < 30) {
  print("overweight")  # BMI between 25 and 29.9
} else {
  print("obese")  # BMI 30 and above
}

# Using `ifelse` for compact conditional decisions
a <- 10
ifelse(a > 0, "positive", "negative")  # Decision: positive if a > 0, else negative

# Applying `ifelse` on vectors
ages <- c(22, 21, 20, 24, 56, 78, 90, 34, 56, 11, 10, 13)
age_group <- ifelse(ages < 18, "child", "adult")  # Classify as child or adult
age_group <- factor(age_group)  # Convert to a factor
summary(age_group)  # Summary of age group distribution

# Handling missing values
ages <- c(22, 21, 20, 24, NA, 78, 90, 34, 56, 11, 10, 13)  # Vector with NA
is.na(ages)  # Check for missing values
sum(is.na(ages))  # Count missing values
