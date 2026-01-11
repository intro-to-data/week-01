# Zip
# Preps class materials for distribution to the class.


# %% ---------------------------------------------------------------------------
# INIT
library(zip)


# %% ---------------------------------------------------------------------------
# Zip class materials.
zip(
  zipfile = "Week 01.zip",
  files = c(
    "LICENSE.txt",
    "README.md",
    "dependencies.R",
    "lab.qmd",
    "lecture.qmd",
    "week_01.Rproj",
    "data/class_grades.R",
    "data/class_grades.xlsx",
    "includes/cowboy_bebop.webp",
    "includes/cvs_receipt.png",
    "includes/data_science_vd.png",
    "includes/flu_cases_2025-2026.png",
    "includes/fundus_photograph_of_normal_left_eye.jpg",
    "includes/xkcd_survey.png"
  )
)

print("Have a great day.")
