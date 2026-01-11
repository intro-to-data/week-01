# %% ---------------------------------------------------------------------------
# Create the class_grades data. The number of rows is determined by the
# n_students variable.
# 1. Create a list of popular names.
# 2. Create the class, age, and exam data sets.
# 3. Combine them into the class_grades object.
# 4. Export to Excel.


# %% ---------------------------------------------------------------------------
# INIT
library(sn)
library(tidyverse)
library(writexl)

set.seed(2024)
n_students <- 20
groups <- c("LG One", "LG Two", "LG Three")


# %% ---------------------------------------------------------------------------
# Popular Names
# 50 most popular 2024 names, by sex, according to the Census Bureau.
popular_names <- tribble(
  ~sex, ~name, ~percent_births,
  "Male", "Liam", 1.20,
  "Male", "Noah", 1.10,
  "Male", "Oliver", 0.83,
  "Male", "Theodore", 0.65,
  "Male", "James", 0.64,
  "Male", "Henry", 0.63,
  "Male", "Mateo", 0.61,
  "Male", "Elijah", 0.61,
  "Male", "Lucas", 0.58,
  "Male", "William", 0.57,
  "Male", "Benjamin", 0.53,
  "Male", "Levi", 0.52,
  "Male", "Ezra", 0.48,
  "Male", "Sebastian", 0.46,
  "Male", "Jack", 0.46,
  "Male", "Daniel", 0.45,
  "Male", "Samuel", 0.45,
  "Male", "Michael", 0.44,
  "Male", "Ethan", 0.44,
  "Male", "Asher", 0.44,
  "Male", "John", 0.44,
  "Male", "Hudson", 0.43,
  "Male", "Luca", 0.43,
  "Male", "Leo", 0.42,
  "Male", "Elias", 0.41,
  "Male", "Owen", 0.41,
  "Male", "Alexander", 0.41,
  "Male", "Dylan", 0.40,
  "Male", "Santiago", 0.40,
  "Male", "Julian", 0.40,
  "Male", "David", 0.40,
  "Male", "Joseph", 0.39,
  "Male", "Matthew", 0.38,
  "Male", "Luke", 0.38,
  "Male", "Jackson", 0.37,
  "Male", "Maverick", 0.36,
  "Male", "Miles", 0.36,
  "Male", "Wyatt", 0.36,
  "Male", "Thomas", 0.36,
  "Male", "Isaac", 0.35,
  "Male", "Jacob", 0.35,
  "Male", "Mason", 0.35,
  "Male", "Gabriel", 0.35,
  "Male", "Anthony", 0.34,
  "Male", "Carter", 0.34,
  "Male", "Logan", 0.34,
  "Male", "Aiden", 0.34,
  "Male", "Grayson", 0.34,
  "Male", "Caleb", 0.31,
  "Male", "Cooper", 0.31,
  "Female", "Olivia", 0.83,
  "Female", "Emma", 0.76,
  "Female", "Amelia", 0.72,
  "Female", "Charlotte", 0.71,
  "Female", "Mia", 0.69,
  "Female", "Sophia", 0.68,
  "Female", "Isabella", 0.61,
  "Female", "Evelyn", 0.52,
  "Female", "Ava", 0.49,
  "Female", "Sofia", 0.46,
  "Female", "Camila", 0.43,
  "Female", "Harper", 0.42,
  "Female", "Luna", 0.40,
  "Female", "Eleanor", 0.40,
  "Female", "Violet", 0.39,
  "Female", "Aurora", 0.39,
  "Female", "Elizabeth", 0.39,
  "Female", "Eliana", 0.36,
  "Female", "Hazel", 0.36,
  "Female", "Chloe", 0.36,
  "Female", "Ellie", 0.36,
  "Female", "Nora", 0.35,
  "Female", "Gianna", 0.35,
  "Female", "Lily", 0.34,
  "Female", "Emily", 0.34,
  "Female", "Aria", 0.34,
  "Female", "Scarlett", 0.33,
  "Female", "Penelope", 0.32,
  "Female", "Zoe", 0.32,
  "Female", "Ella", 0.32,
  "Female", "Avery", 0.32,
  "Female", "Abigail", 0.31,
  "Female", "Mila", 0.31,
  "Female", "Lucy", 0.31,
  "Female", "Isla", 0.30,
  "Female", "Ivy", 0.30,
  "Female", "Layla", 0.30,
  "Female", "Lainey", 0.29,
  "Female", "Nova", 0.29,
  "Female", "Grace", 0.28,
  "Female", "Willow", 0.26,
  "Female", "Riley", 0.26,
  "Female", "Emilia", 0.26,
  "Female", "Naomi", 0.26,
  "Female", "Elena", 0.26,
  "Female", "Madison", 0.26,
  "Female", "Valentina", 0.25,
  "Female", "Victoria", 0.24,
  "Female", "Stella", 0.24,
  "Female", "Delilah", 0.24
)


# %% ---------------------------------------------------------------------------
# Create class by sampling from popular names.
class <- sample_n(popular_names, size = n_students, weight = percent_births)
class


# %% ---------------------------------------------------------------------------
# Age
age <- rnorm(100, mean = 18.5, sd = 1.5)
age <- sample(
  age[age >= 18],
  size = n_students,
  replace = TRUE
)
age <- round(age, 0)
age


# %% ---------------------------------------------------------------------------
# First exam
exam_01 <- rsn(100, xi = 80, omega = 15, alpha = 3)
exam_01 <- sample(
  exam_01[exam_01 <= 100 & exam_01 > 0],
  size = n_students,
  replace = TRUE
)
exam_01 <- round(exam_01, 1)
exam_01


# %% ---------------------------------------------------------------------------
# Second exam
exam_02 <- rsn(n = 100, xi = 90, omega = 10, alpha = 1)
exam_02 <- sample(
  exam_02[exam_02 <= 100 & exam_02 > 0],
  size = n_students,
  replace = TRUE
)
exam_02 <- round(exam_02, 1)
exam_02


# %% ---------------------------------------------------------------------------
# First Lab
lab_01 <- rsn(n = 100, xi = 87, omega = 15, alpha = 1)
lab_01 <- sample(
  lab_01[lab_01 <= 100 & lab_01 > 0],
  size = n_students,
  replace = TRUE
)
lab_01 <- round(lab_01, 1)
lab_01


# %% ---------------------------------------------------------------------------
# Second Lab
lab_02 <- rsn(n = 100, xi = 95, omega = 20, alpha = 1)
lab_02 <- sample(
  lab_02[lab_02 <= 100 & lab_02 > 0],
  size = n_students,
  replace = TRUE
)
lab_02 <- round(lab_02, 1)
lab_02


# %% ---------------------------------------------------------------------------
# Third Lab
lab_03 <- rsn(n = 100, xi = 83, omega = 15, alpha = 1)
lab_03 <- sample(
  lab_03[lab_03 <= 100 & lab_03 > 0],
  size = n_students,
  replace = TRUE
)
lab_03 <- round(lab_03, 1)
lab_03


# %% ---------------------------------------------------------------------------
# Assemble synthetic class grades.
class_grades <-
  class |>
  select("Student Name" = name, "Sex" = sex) |>
  mutate(
    "Age" = age,
    "Grade" = case_when(
      Age < 19.25 ~ "Freshman",
      between(Age, 19.25, 20.499) ~ "Sophomore",
      between(Age, 20.50, 21.499) ~ "Junior",
      Age >= 21.5 ~ "Senior"
    ),
    "Lab Group" = sample(groups, n_students, replace = TRUE),
    "First Lab" = lab_01,
    "Second Lab" = lab_02,
    "Third Lab" = lab_03,
    "First Exam" = exam_01,
    "Second Exam" = exam_02
  )
class_grades


# %% ---------------------------------------------------------------------------
# Export to Excel
write_xlsx(class_grades, "data/class_grades.xlsx")
