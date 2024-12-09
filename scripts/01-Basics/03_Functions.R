# Defining a basic function
function_name <- function(arguments) {
  # Code block (body of the function)
  # This block does something with the input arguments
  # The return value is the result of the function
}


# Defining a function to add two numbers
add_numbers <- function(a, b) {
  result <- a + b  # Perform the addition
  result  # Return the result (R automatically returns the last evaluated expression)
}

# Calling the function
add_numbers(3, 5)  # Output: 8

# Defining a function using return()
multiply_numbers <- function(a, b) {
  result <- a * b  # Perform the multiplication
  return(result)   # Explicitly return the result
}

# Calling the function
multiply_numbers(4, 6)  # Output: 24


# Defining a function with default argument values
greet <- function(name = "Guest") {
  paste("Hello,", name)  # Returns a greeting
}

# Calling the function without an argument (uses default)
greet()  # Output: "Hello, Guest"

# Calling the function with an argument
greet("Alice")  # Output: "Hello, Alice"


# Defining a function with multiple arguments
rectangle_area <- function(length, width) {
  area <- length * width  # Calculate the area
  area  # Return the calculated area
}

# Calling the function with arguments
rectangle_area(5, 10)  # Output: 50







