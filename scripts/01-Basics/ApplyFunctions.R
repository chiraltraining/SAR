# The apply() function is used to apply a function to the rows or columns of a matrix or an array.
# Creating a matrix
mat <- matrix(1:9, nrow = 3)
mat

# Applying the sum function to each row (MARGIN = 1)
apply(mat, 1, sum)  # Output: sum of each row

# Applying the sum function to each column (MARGIN = 2)
apply(mat, 2, sum)  # Output: sum of each column


# The lapply() function applies a function to each element of a list and returns a list.
# Creating a list
my_list <- list(a = 1:5, b = 6:10, c = 11:15)
my_list

# Applying the mean function to each element of the list
lapply(my_list, mean)  # Output: list of means for each element


# The sapply() function is a simplified version of lapply(). It tries to simplify the result to a vector or matrix when possible, instead of returning a list.
# Applying the mean function using sapply
sapply(my_list, mean)  # Output: a vector of means

# If the output cannot be simplified, it returns a list (just like lapply).








