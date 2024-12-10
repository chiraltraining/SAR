# Set random seed for reproducibility
set.seed(123)

# Number of iterations for the simulation
n_simulations <- 10000

# 1. Simulating the Total Number of Cases in an Outbreak
# Assume an outbreak where the number of cases in a population follows a Poisson distribution
lambda <- 50  # Average number of new cases per day
poisson_simulation <- rpois(n_simulations, lambda)

# 2. Simulating the Time to Recovery in Days
# Assume the recovery time for individuals follows an Exponential distribution
mean_recovery_time <- 7  # Average recovery time in days
recovery_simulation <- rexp(n_simulations, rate = 1 / mean_recovery_time)

# 3. Simulating Disease Transmission Rates in a Population
# Assume the probability of transmission follows a Beta distribution (proportion)
alpha <- 2  # Shape parameter 1
beta <- 5   # Shape parameter 2
transmission_simulation <- rbeta(n_simulations, alpha, beta)

# 4. Simulating the Risk of a Disease (Binary Outcome)
# The risk of contracting a disease in a population can be modeled with a Binomial distribution
population_size <- 1000  # Total population size
risk_probability <- 0.1  # Probability of contracting the disease
disease_outcome_simulation <- rbinom(n_simulations, population_size, risk_probability)

# 5. Calculating the Total Cost of Treatment
# Suppose the cost of treatment per patient follows a normal distribution
mean_cost <- 2000  # Average treatment cost
sd_cost <- 500     # Standard deviation of treatment cost
treatment_cost_simulation <- rnorm(n_simulations, mean = mean_cost, sd = sd_cost)

# 6. Simulating the Number of Hospital Admissions
# Hospital admissions may follow a Poisson distribution with variable rates
lambda_hospital <- 10  # Average number of hospital admissions per day
hospital_admission_simulation <- rpois(n_simulations, lambda_hospital)

# Monte Carlo Estimations

# Estimate the total number of cases in an outbreak
estimated_cases <- mean(poisson_simulation)

# Estimate the average time to recovery
estimated_recovery_time <- mean(recovery_simulation)

# Estimate the average transmission probability
estimated_transmission_rate <- mean(transmission_simulation)

# Estimate the proportion of individuals affected by the disease
estimated_disease_risk <- mean(disease_outcome_simulation / population_size)

# Estimate the total treatment cost
estimated_total_treatment_cost <- mean(treatment_cost_simulation)

# Estimate the average number of hospital admissions
estimated_hospital_admissions <- mean(hospital_admission_simulation)

# Visualize the distribution of some key simulations
par(mfrow = c(2, 2))  # Plot in a 2x2 grid

# 1. Distribution of Total Number of Cases
hist(poisson_simulation, 
     breaks = 30, 
     col = 'lightblue', 
     main = "Total Number of Cases in Outbreak", 
     xlab = "Number of Cases", 
     ylab = "Frequency", 
     border = 'black')

# 2. Distribution of Time to Recovery
hist(recovery_simulation, 
     breaks = 30, 
     col = 'lightgreen',
     main = "Time to Recovery", 
     xlab = "Days", 
     ylab = "Frequency",
     border = 'black')

# 3. Distribution of Disease Transmission Rate
hist(transmission_simulation, 
     breaks = 30, 
     col = 'lightcoral', 
     main = "Disease Transmission Rate", 
     xlab = "Transmission Probability", 
     ylab = "Frequency", border = 'black')

# 4. Distribution of Treatment Cost
hist(treatment_cost_simulation, 
     breaks = 30, 
     col = 'lightyellow', 
     main = "Treatment Cost per Patient", 
     xlab = "Cost ($)", 
     ylab = "Frequency", 
     border = 'black')
