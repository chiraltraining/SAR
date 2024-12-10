# 10 ~ whether negative? positive? 

# How to decide? ~ based on logic (condition)
# 1. if num > 0 - positive 
# 2. if num < 0 - negative 

# Using one condition 
# 1. if num > 0 - positive
# 2. else - negative 


# one condition  
if (condition) {
  # make a decision 
}

num <- 10 
if (num > 0) {
  # make a decision 
  print("positive")
}

# two conditions
if (condition) {
  # make a decision - if block 
} else {
  # make a decision - else block 
}

num2 <- -10 
if (num2 > 0) {
  print("positive")
} else {
  print("negative")
}

# more than 2 conditions 
if (condition) {
  # do something 
} else if (condition) {
  # do something 
} else if (condition) {
  # do something 
} else {
  # do something 
}

bmi <- 31

if (bmi < 18.5) {
  print("under weight")
} else if (bmi < 25) {
  print("normal weight")
} else if (bmi < 30) {
  print("over weight")
} else {
  print("obese")
}

# ifelse()
ifelse(condition, "true", "false")

a <- 10 
ifelse(a > 0, "postive", "negative")

ages <- c(22, 21, 20, 24, 56, 78, 90, 34, 56, 11, 10, 13)
age_group <- ifelse(ages < 18, "child", "adult")
age_group <- factor(age_group)
summary(age_group)


# Handling missing values 
ages <- c(22, 21, 20, 24, NA, 78, 90, 34, 56, 11, 10, 13)
ages <- c(22, 21, 20, 24, NaN, 78, 90, 34, 56, 11, 10, 13)

# Print Bangladesh 5 times 
print("Bangladesh")
print("Bangladesh")
print("Bangladesh")
print("Bangladesh")
print("Bangladesh")

print("Bangladesh") * 5 


# loops 

# for 
# vectors > collections > sequence > collection of items 
seq <- 1:5
for (i in seq) {
  # do something 
  print("Bangladesh")
}

for (i in 1:5) {
  # do something 
  print("Bangladesh")
}

# print 1 to 5 numbers 
for (i in 1:5) {
  print(i)
}

for (i in seq(1, 20, 3)) {
  print(i)
}

# break statement 
for (var in 1:20) {
  if (var == 5) {
    break
  }
  print(var)
}

# next statement 
for (var in 1:20) {
  if (var == 5) {
    next
  }
  print(var)
}


# while ~ infinite loop 
count <- 1 
while (count <= 10) {
  print(count)
}


# while ~ increament 
count <- 1 
while (count <= 10) {
  print(count)
  count = count + 1 
}

# while ~ break 
count <- 1 
while (count <= 10) {
  if (count == 3) {
    break
  }
  print(count)
  count = count + 1 
}

# while ~ next  
count <- 1
while (count <= 10) {
  if (count == 3) {
    count = count + 1
    next
  }
  print(count)
  count = count + 1
}


# Functions 
# 1. built-in functions - mean, sd, median,sum 
sum(10,20)
sum(1, 2, 3, 4,5)

# 2. user defined functions - you have to create your own function 
num1 <- 10 
num2 <- 20 
num1 + num2 

# How to give a function name? 
my_function <- function(params) {
  # do something 
}

# Create a function - can add two numbers 
add <- function(num1, num2) {
  # why? 
  result <- num1 + num2 
  # return result 
  return(result)
}
# function call > use this function 
add(10, 20)

# Create a function - can add multiple numbers 
add2 <- function(...) {
  # capture all the arguments as a list 
  numbers <- list(...)
  
  # sum all the numbers in the list 
  result <- sum(unlist(numbers))
  
  # return the result 
  return(result)
  
}

# function call > use this function 
add2(1,2,3,4,5)

# importing data 
data <- read.csv("data/Heart_Attack.csv")


# exploring data 
str(data)

# fixing data structure
data$Gender <- as.factor(data$Gender)
data$Outcome <- as.factor(data$Outcome)

# check missing values 
is.na(data)
sum(is.na(data))

# removing missing values 
data <- na.omit(data)

# column access
data$Gender

# frequency 
table(data$Gender)

# percentage 
prop.table(table(data$Gender))
prop.table(table(data$Gender)) * 100

# calculate mean SB
mean(data$Systolic.blood.pressure)
mean(data$Systolic.blood.pressure, na.rm = T)

median()
sd()
quantile()


# impact of outlines 
ages <- c(22, 21, 20, 24, 56, 78, 90, 34, 56, 11, 10, 13)
mean(ages)
median(ages)

max(ages)
min(ages)
range <- max(ages) - min(ages)
range

ages2 <- c(22, 21, 20, 24, 56, 78, 90, 34, 56, 11, 10, 13, 120)
mean(ages2)
median(ages2)

max(ages2)
min(ages2)
range <- max(ages2) - min(ages2)
range


# IQR (Inter Quartile Range)
ages <- c(22, 21, 20, 24, 56, 78, 90, 34, 56, 11, 10, 13)
q1 <- quantile(ages, .25)
q2 <- quantile(ages, .5)
q3 <-quantile(ages, .75)
q3 - q1 


ages2 <- c(22, 21, 20, 24, 56, 78, 90, 34, 56, 11, 10, 13, 120)

q1 <- quantile(ages2, .25)
q2 <- quantile(ages2, .5)
q3 <-quantile(ages2, .75)
iqr <- q3 - q1 
iqr

# Uniform distribution 

# Generate 5 random numbers between 0 and 1
random_numbers <- runif(5)
random_numbers

# Generate 5 random numbers from a normal distribution with mean 0 and standard deviation 1
random_numbers <- rnorm(5, mean = 0, sd = 1)
random_numbers


# 1. Variables 
# 2. Data types (numbers, character, logical)
# 3. Data structure (vector, factor, dataframe, matrix, list)
# 4. ifelse()
# 5. Installing packages and loading library 
