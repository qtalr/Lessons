# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

.get_course_path <<- function() {
  tryCatch(
    swirl:::swirl_courses_dir(),
    error = function(c) {
      file.path(find.package("swirl"), "Courses")
    }
  )
}

.pathtofile <<- function(file_name) {
  file.path(
    .get_course_path(),
    "Lessons", "Computing_Environment",
    file_name
  )
}

# @param html An html file.
.viewer_question <<- function(html) {
  path <- .pathtofile(html)
  temp <- tempfile(fileext = ".html")
  file.copy(path, temp, overwrite = TRUE)

  viewer <- getOption("viewer")
  if (!is.null(viewer)) {
    viewer(temp)
  } else {
    utils::browseURL(temp)
  }
}

# Variables created in this file will be available to the user

# I will be using the `renv` package to manage the project-specific library of packages. To do this I'm going to set up a temporary directory for the lesson. Then use the `quarto::quarto_create_project()` function to create a new project. I will add some code to the project to get the lesson started and ready to apply `renv` to the project.

# FIX: Issue with creating a project, in the same swirl session

if (exists("temp_dir")) {
  # Remove the temporary directory if it exists
  fs::dir_delete(file.path(temp_dir, "project"))
  rm(temp_dir)
}

# Set up a temporary directory for the lesson
curr_dir <- getwd()
# Create a temporary directory
temp_dir <- tempdir()

# Set the working directory to the temporary directory
setwd(temp_dir)

# Create a new project using `quarto::quarto_create_project()`

# Create a new project
quarto::quarto_create_project(name = "project", type = "website", no_prompt = TRUE, quiet = TRUE)

# Set the working directory to the new project
setwd("project")

# Set up a mock project structure

# Remove the `about.qmd` file
fs::file_delete("about.qmd")

# Remove the `styles.css` file
fs::file_delete("styles.css")

# Add some directories
dirs <- c("data/original/", "data/derived/", "process/", "reports")

purrr::walk(dirs, fs::dir_create)

# Add a README.md file
fs::file_create("README.md")

# Add files to the `process/` directory
files <- c("1_acquire.qmd", "2_curate.qmd", "3_transform.qmd", "4_analyze.qmd")
path <- fs::path("process", files)

purrr::walk(path, fs::file_create)

# Set back to the original working directory to start lesson
setwd(curr_dir)

# fs::dir_tree()
# fs::file_show("_quarto.yml")
