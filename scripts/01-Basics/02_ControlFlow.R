# R Boolean Expression
# Boolean expressions return TRUE or FALSE.

x <- 10
y <- 20

# Boolean comparisons
x > y  # FALSE
x < y  # TRUE
x == y  # FALSE
x != y  # TRUE
x >= 10  # TRUE
y <= 20  # TRUE

# Logical operators
TRUE & FALSE  # AND operator, returns FALSE
TRUE | FALSE  # OR operator, returns TRUE
!TRUE  # NOT operator, returns FALSE


# R if...else statement
x <- 15

if (x > 10) {
  "x is greater than 10"
} else {
  "x is not greater than 10"
}

# if...else if...else
y <- 25

if (y < 10) {
  "y is less than 10"
} else if (y == 25) {
  "y is equal to 25"
} else {
  "y is greater than 25"
}

# R ifelse() function
# ifelse() is a vectorized function to apply conditional logic to elements of a vector.

a <- 5
b <- 15

# Using ifelse() for a simple comparison
result <- ifelse(a > b, "a is greater", "b is greater")
result  # Output: "b is greater"

# Vectorized use of ifelse()
vec <- c(3, 10, 7, 15)
ifelse(vec > 5, "Greater than 5", "Less or equal to 5")  # Apply ifelse to each element of the vector

# R for loop
# A for loop iterates over a sequence (vector, list, etc.)

# Iterating over a vector
numbers <- c(1, 2, 3, 4, 5)

for (num in numbers) {
  num  # Outputs each number in the vector
}

# Iterating over a range
for (i in 1:5) {
  i  # Outputs numbers 1 to 5
}


# R while loop
# The while loop continues as long as the condition is TRUE.

counter <- 1

while (counter <= 5) {
  counter  # Outputs the counter value for each iteration
  counter <- counter + 1
}


# R break and next statements

# Using break to exit a loop
for (i in 1:10) {
  if (i == 6) {
    break  # Exit the loop when i equals 6
  }
  i  # Outputs 1 to 5
}

# Using next to skip an iteration
for (i in 1:10) {
  if (i %% 2 == 0) {
    next  # Skip the current iteration if i is even
  }
  i  # Outputs only odd numbers (1, 3, 5, 7, 9)
}


# R repeat loop
# The repeat loop runs indefinitely unless a break is used.

counter <- 1

repeat {
  counter  # Outputs the counter value
  counter <- counter + 1
  if (counter > 5) {
    break  # Exit the loop when counter exceeds 5
  }
}




