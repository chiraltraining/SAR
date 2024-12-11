# Set a random seed for reproducibility
set.seed(123)

# Number of samples for the simulation
n <- 1000

# 1. Normal Distribution (e.g., blood pressure, height, or test scores)
# The normal distribution is widely used for continuous data that tend to cluster around a mean.
mean <- 120  # Mean of the normal distribution (e.g., average blood pressure)
sd <- 15     # Standard deviation (e.g., variability in blood pressure)
normal_data <- rnorm(n, mean = mean, sd = sd)
normal_data

# Visualize Normal Distribution using base R
hist(normal_data, 
     breaks = 30,
     col = 'skyblue', 
     main = "Normal Distribution", 
     xlab = "Value", 
     ylab = "Frequency", 
     border = 'black')

# 2. Binomial Distribution (e.g., infection rates, pass/fail outcomes)
# Binomial distribution is used for binary outcomes (success/failure) over multiple trials.
size <- 100  # Number of trials (e.g., individuals in a study)
prob <- 0.3  # Probability of success (e.g., infection rate)
binomial_data <- rbinom(n, size, prob)
binomial_data

# Visualize Binomial Distribution using base R
barplot(table(binomial_data), 
        col = 'coral', 
        main = "Binomial Distribution", 
        xlab = "Successes", 
        ylab = "Frequency", 
        border = 'black')

# 3. Poisson Distribution (e.g., number of disease cases in a specific area)
# Poisson distribution models the number of events in a fixed interval, often used for rare events.
lambda <- 5  # Mean number of events (e.g., number of cases)
poisson_data <- rpois(n, lambda)

# Visualize Poisson Distribution using base R
barplot(table(poisson_data), 
        col = 'lightgreen', 
        main = "Poisson Distribution", 
        xlab = "Number of Events", 
        ylab = "Frequency", 
        border = 'black')

# 4. Exponential Distribution (e.g., time until death, time to recovery)
# Exponential distribution is used to model the time between events in a Poisson process.
rate <- 0.1  # Rate parameter (e.g., average time between events)
exponential_data <- rexp(n, rate)

# Visualize Exponential Distribution using base R
hist(exponential_data, 
     breaks = 30, 
     col = 'lightblue', 
     main = "Exponential Distribution", 
     xlab = "Time until Event",
     ylab = "Frequency", 
     border = 'black')

# 5. Gamma Distribution (e.g., survival times, time to recovery)
# Gamma distribution is often used in survival analysis and to model waiting times.
shape <- 2   # Shape parameter
scale <- 2   # Scale parameter
gamma_data <- rgamma(n, shape, scale)

# Visualize Gamma Distribution using base R
hist(gamma_data, 
     breaks = 30, 
     col = 'pink', 
     main = "Gamma Distribution", 
     xlab = "Survival Time", 
     ylab = "Frequency", 
     border = 'black')

# 6. Log-Normal Distribution (e.g., time to reach a health threshold)
# Log-Normal distribution is useful when data is positively skewed, such as biological growth processes.
log_normal_data <- rlnorm(n, meanlog = 0, sdlog = 1)

# Visualize Log-Normal Distribution using base R
hist(log_normal_data, 
     breaks = 30, 
     col = 'purple', 
     main = "Log-Normal Distribution", 
     xlab = "Value", 
     ylab = "Frequency", 
     border = 'black')

# 7. Beta Distribution (e.g., modeling probabilities such as vaccination rates)
# Beta distribution is used to model proportions or probabilities between 0 and 1.
alpha <- 2    # Shape parameter 1
beta <- 5     # Shape parameter 2
beta_data <- rbeta(n, alpha, beta)

# Visualize Beta Distribution using base R
hist(beta_data, 
     breaks = 30, 
     col = 'orange', 
     main = "Beta Distribution", 
     xlab = "Proportion",
     ylab = "Frequency", 
     border = 'black')

# 8. Weibull Distribution (e.g., failure times, survival analysis)
# Weibull distribution is commonly used in reliability analysis and survival studies.
shape_wei <- 1.5  # Shape parameter
scale_wei <- 2    # Scale parameter
weibull_data <- rweibull(n, shape_wei, scale_wei)

# Visualize Weibull Distribution using base R
hist(weibull_data, 
     breaks = 30, 
     col = 'lightyellow', 
     main = "Weibull Distribution", 
     xlab = "Survival Time", 
     ylab = "Frequency", 
     border = 'black')

