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
  file.path( # nolint
    .get_course_path(),
    "Lessons", "Objects",
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

# Variables

# Create a series of variables to show how variables can be used in control statements #nolint

# Vectors
# Create a variable called `x` and assign it the value 5
x_vec <- 5

# Create a variable called `y` and assign it the value 10
y_vec <- 10

# Create a variable called `z` and assign it the value "Hello"
z_vec <- c("Hello", "World")

# Data frames
# Create a variable called `df` and assign it a data frame with 3 columns
# and 3 rows
x_df <- data.frame(
  x = 1:3,
  y = 4:6,
  z = 7:9
)

# Functions

# Create a function called `check_odd_even` that takes a single argument
check_odd_even <- function(num) {
  result <- ifelse(num %% 2 == 0, "even", "odd")
  paste("The number", num, "is", result)
}
