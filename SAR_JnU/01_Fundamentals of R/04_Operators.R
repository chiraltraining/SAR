
# Operators in R
# Operators consist of operands and symbols:
# Example: 5 (operand) + (operator) 2 (operand) = 7 (output)

# 1. Arithmetic Operators
num1 <- 20
num2 <- 2

num1 + num2       # Addition
num1 - num2       # Subtraction
num1 * num2       # Multiplication
num1 / num2       # Division
num1 ** num2      # Power
num1 %% 2         # Modulus (remainder of division)
11 %% 2           # Modulus example with remainder

# 2. Relational Operators (Return Logical Values)
2 == 2            # Equal to
2 > 1             # Greater than
2 < 1             # Less than
2 >= 1            # Greater than or equal to
2 <= 1            # Less than or equal to
3 <= 3            # Less than or equal (example)
2 != 3            # Not equal to

# 3. Logical Operators
# Logical operators are used to combine conditions

# AND (&&) - Returns TRUE if all conditions are true
2 == 2 && 4 > 2    # TRUE
2 == 2 && 2 > 4    # FALSE
2 == 2 && 2 < 1    # FALSE

# OR (|) - Returns TRUE if at least one condition is true
2 > 1 | 2 == 1     # TRUE
2 < 1 | 2 == 1     # FALSE
3 == 3 | 3 < 3     # TRUE

# NOT (!) - Negates a condition
!2 == 2            # FALSE
!4 > 10            # TRUE