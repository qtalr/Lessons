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
    "Lessons", "Matrices",
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

# Variables created in this file will be accessible to the user

# Create a matrix with numeric elements
ex_int_mat <- matrix(1:6, nrow = 2, ncol = 3)

# Create a matrix with character elements
ex_char_mat <- matrix(letters[1:6], nrow = 2, ncol = 3)

# Create a hypothetical data set of text messages
ex_text_df <- tibble(
  doc_id = c(1, 2, 3, 4, 5),
  text = c(
    "I am on my way. I will be there soon.",
    "I am running late.",
    "Are you going to be home soon?",
    "I am running late. Maybe we should reschedule.",
    "She is on her way."
  )
)
