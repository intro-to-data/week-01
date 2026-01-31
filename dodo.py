# Manages project tasks.
# Assumes pydoit is installed globally.


import zipfile
from pathlib import Path
from doit.task import clean_targets


def task_style():
    files = []
    files = files.extend(Path("./data/").glob("*.R"))
    files = files.extend(Path("./").glob("*.R"))
    files = files.extend(Path("./").glob("*.qmd"))

    return{
        "file_dep": files,
        "targets": files,
        "actions": [
            f"Rscript -e \"styler::style_dir('./data/')\" ",
            f"Rscript -e \"styler::style_dir('.')\" ",
        ],
        "clean": True
    }

def task_data():
    file_targets = ["./data/class_grades.xlsx"]
    file_actions = "./data/class_grades.R"

    file_deps = []
    file_deps.extend(Path("./data/").glob("*.xlsx"))
    file_deps.extend(Path(file_actions))
    
    return{
        "file_dep": file_deps,
        "targets": file_targets,
        "actions": [f"Rscript {file_actions}"],
        "clean": True
    }


def task_lecture():
    file_targets = ["./lecture.html"]
    file_actions = "./lecture.qmd"

    file_deps = []
    file_deps.extend(Path("./data/").glob("*.xlsx"))
    file_deps.extend(Path(file_actions))
    
    return{
        "file_dep": file_deps,
        "targets": file_targets,
        "actions": [f"quarto preview {file_actions}"],
        "clean": True
    }


def create_zip(target_zip, files):
    """Used by task_zip to create the zip file."""
    with zipfile.ZipFile(target_zip, "w", zipfile.ZIP_DEFLATED) as zf:
        for fs in files:
            zf.write(fs, fs.name)


def task_zip():
    """Creates the ZIP file to give to students."""
    files_to_zip = []
    files_to_zip.extend(Path("./data/").glob("*.csv"))
    files_to_zip.extend(Path("./data/").glob("*.xlsx"))
    files_to_zip.extend(Path("./data/").glob("*.R"))
    files_to_zip.extend(Path(".").glob("*.R"))
    files_to_zip.extend(Path(".").glob("*.Rproj"))
    files_to_zip.extend(Path(".").glob("*.qmd"))
    files.remove(Path("./lab-answers-week-01.qmd"))
    target = Path("review_covid_testing.zip")
    return{
        "file_dep": files_to_zip,
        "targets": [target],
        "actions": [(create_zip, [], {"target_zip": target, "files": files_to_zip})],
    }
