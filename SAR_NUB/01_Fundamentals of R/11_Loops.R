# Looping to Perform Repeated Actions

# Print "Bangladesh" five times using `for` loop
for (i in 1:5) {
  print("Bangladesh")  # Repeated action
}

# Print numbers from 1 to 5
for (i in 1:5) {
  print(i)  # Print the current iteration number
}

# Using a custom sequence
for (i in seq(1, 20, 3)) {
  print(i)  # Increment by 3 and print
}

# Using `break` to stop the loop
for (var in 1:20) {
  if (var == 5) {
    break  # Exit loop when var equals 5
  }
  print(var)
}

# Using `next` to skip an iteration
for (var in 1:20) {
  if (var == 5) {
    next  # Skip printing when var equals 5
  }
  print(var)
}

# While loops: Example with increment
count <- 1
while (count <= 10) {
  print(count)  # Print current count
  count <- count + 1  # Increment count
}
