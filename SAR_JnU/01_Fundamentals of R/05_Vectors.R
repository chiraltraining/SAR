# Vectors
# A vector in R is a sequence of elements, often used for storing health-related data like patient outcomes, measurements, etc.

# 1. Vector Creation using the c() function
disease_types <- c("Hypertension", "Diabetes", "Asthma") # Character: Disease labels
disease_types

# 2. Vector Creation Using the ":" Operator (Useful in Epidemiology for Ranges)
age_range <- 18:65            # Sequence of ages for a study (e.g., patients aged 18 to 65)
age_range

# 3. Creating Sequences for Study Periods
time_points <- seq(1, 12, by = 3)  # Time points for quarterly data (e.g., patient visits)
time_points

# 4. Repeating Observations (E.g., Follow-up Visits)
follow_up_visits <- rep("Visit", times = 5)   # Repeating "Visit" 5 times for follow-up visits
follow_up_visits

# Vector Properties
# 1. Length of the vector
patient_ages <- c(30, 45, 60, 35)
length(patient_ages)

# 2. Type and Structure of the Data
typeof(patient_ages)
str(patient_ages)


# 3. Check structure of patient data
str(patient_ages)   

# Indexing and Subsetting 
# 1. Accessing specific patient data (e.g., age)
patient_ages <- c(30, 45, 60, 35)
patient_ages[2]

# 2. Subsetting based on certain conditions (e.g., patients older than 50)
patient_ages[patient_ages > 50]

# 3. Exclude specific entries (e.g., remove second patient data)
patient_ages[-2]


# Vector Operations for Statistical Analysis
# Arithmetic operations on vectors (e.g., calculating total and mean patient age)
min(patient_ages)
max(patient_ages)
range(patient_ages)
mean(patient_ages)
sd(patient_ages)
median(patient_ages)

# Handling Missing Data (NA) in Health Records
# 1. Create a vector with missing values (NA)
blood_sugar_levels <- c(90, NA, 130, 110)

# 2. Check for missing values in health data
# is there any missing value?
is.na(blood_sugar_levels)

# how many?
sum(is.na(blood_sugar_levels))


# 3. Remove missing values (e.g., exclude incomplete patient records)
cleaned_blood_sugar_levels <- na.omit(blood_sugar_levels)
cleaned_blood_sugar_levels

# 4. Replace missing values with a mean or a standard value (e.g., average blood sugar)
blood_sugar_levels[is.na(blood_sugar_levels)] <- mean(blood_sugar_levels, na.rm = TRUE)
blood_sugar_levels

# 4. Vector Recycling (Useful for different length datasets in public health analysis)
age_data <- c(30, 40)
blood_pressure_data <- c(120, 130, 140, 150)

# Recycled operation, where shorter vector is recycled to match the longer one (e.g., calculating rate of increase)
rate_of_increase <- age_data + blood_pressure_data  # This will repeat age data to match blood pressure data length
rate_of_increase

# 5. Advanced Operations for Healthcare Analysis
# Sorting healthcare data (e.g., sorting patients by age)
sorted_ages <- sort(patient_ages, decreasing = TRUE)
sorted_ages

# 6. Finding unique health conditions among patients (e.g., diseases)
unique_diseases <- unique(disease_types)
unique_diseases

# 7. Finding specific patient information
find_patient <- match(34, patient_ages)   # Find the index of the patient aged 34
find_patient

# 8. Test if a patient is in the database (membership test)
is_patient_present <- 45 %in% patient_ages
is_patient_present

# 9. Apply Functions for Statistical Calculations
# Apply function to calculate squared values of patient ages for a model
age_squared <- sapply(patient_ages, function(x) x^2)
age_squared
