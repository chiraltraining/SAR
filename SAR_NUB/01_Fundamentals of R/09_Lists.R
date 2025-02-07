# Introduction to Lists

# A list in R is a versatile data structure that can store different types of elements, including vectors, data frames, other lists, or even functions. 
# Unlike vectors, which require all elements to be of the same type, a list can contain elements of different types.
# Lists are useful when you need to store heterogeneous data or more complex structures, like models, results from analyses, or mixed data types.

# Using the `list()` Function

# The `list()` function is the primary method for creating lists in R.
# You can create a list by passing multiple elements as arguments to the `list()` function.

# Example: Create a simple list with a mix of data types
name <- "John"
age <- 25
height <- 175.5
is_student <- TRUE

# Create a list containing a character, numeric, logical, and other types
my_list <- list(Name = name, Age = age, Height = height, Is_Student = is_student)

# Output the list
my_list

# Explanation:
# - `Name`, `Age`, `Height`, and `Is_Student` are the names of the list components.
# - The `list()` function allows us to mix different types of data in a single list.
# - The output shows that each list component is stored under its respective name.

# Access List Elements 
my_list$Name
