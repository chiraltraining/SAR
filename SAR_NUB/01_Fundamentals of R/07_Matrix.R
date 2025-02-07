# Introduction to Matrices 

# A matrix is a two-dimensional array in R. It has rows and columns, with elements of the same type.
# Matrices are useful for representing data with two dimensions, such as datasets and numerical computations.

# Create a 3x3 matrix with numbers 1 to 9
mat1 <- matrix(1:9)
mat1

# `nrow` and `ncol` specify the number of rows and columns.
mat2 <- matrix(1:9, nrow = 3, ncol = 3)
mat2

# By default, R fills matrices column-wise. 
# Use `byrow = TRUE` to fill it row-wise
mat3 <- matrix(1:9, nrow = 3, byrow = TRUE)
mat3 

# Row Binding (rbind)
row1 <- c(1, 2, 3)
row2 <- c(4, 5, 6)
mat4 <- rbind(row1, row2)
mat4

# Column Binding (cbind)
col1 <- c(1, 4, 7)
col2 <- c(2, 5, 8)
mat5 <- cbind(col1, col2)
mat5

# Accessing Matrix Elements
# Individual Elements: Element in the 1st row, 2nd column
mat <- matrix(1:9, nrow = 3, ncol = 3)
mat
mat[1, 2]  

# Rows or Columns
# Entire 1st row
mat[1, ]  

# Entire 2nd column
mat[, 2]    

# Matrix Operations: Transpose
t(mat)

# Matrix Operations: Row and Column Sums/Means
rowSums(mat)
colSums(mat)
rowMeans(mat)
colMeans(mat)

# Attributes of a Matrix: Dimensions
dim(mat)

# Attributes of a Matrix: Assigning Names
rownames(mat) <- c("Row1", "Row2", "Row3")
colnames(mat) <- c("Col1", "Col2", "Col3")
mat 

# Attributes of a Matrix: colnames 
colnames(mat)

# Attributes of a Matrix: rownames  
rownames(mat)
