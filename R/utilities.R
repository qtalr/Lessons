# These functions serve as utilities for the course. They are prefixed with a dot to indicate that they are not intended to be called directly by the user. They are called by other functions in the course. #nolint

# [ ] create a set of hidden functions that will be used by other functions in the course

# Get the path to the Swirl course directory
.get_course_path <<- function() {
  tryCatch(
    swirl:::swirl_courses_dir(),
    error = function(c) {
      file.path(find.package("swirl"), "Courses")
    }
  )
}

# Get the path to the current lesson directory
.get_lesson_path <<- function(course, lesson) {
  lesson_path <<- file.path(.get_course_path(), course, lesson)
}

# Get the path to a file in the current lesson directory
.get_file_path <<- function(file_name) {
  file.path(lesson_path, file_name)
}

# .pathtofile <<- function(course, lesson, file_name) {
#   file.path(.get_course_path(), course, file_name)
# }

# View an HTML file in the viewer pane
.viewer_question <<- function(html) {
  path <- .get_file_path(html)
  temp <- tempfile(fileext = ".html")
  file.copy(path, temp, overwrite = TRUE)

  viewer <- getOption("viewer")
  if (!is.null(viewer)) {
    viewer(temp)
  } else {
    utils::browseURL(temp)
  }
}

# View a script file in the Source pane
.view_script <<- function(file_name) {
  path <- .get_file_path(file_name)
  rstudioapi::navigateToFile(path)
}