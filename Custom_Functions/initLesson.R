# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

# Source utilities.R
source(file.path(find.package("swirl"), "Courses", "Lessons", "R", "utilities.R"))

# Display the customTests.R file.
display_swirl_file("customTests.R", "Writing_swirl_Courses", "Custom_Tests")



.get_course_path <<- function() {
  tryCatch(
    swirl:::swirl_courses_dir(),
    error = function(c) {
      file.path(find.package("swirl"), "Courses")
    }
  )
}

.pathtofile <<- function(fileName) {
  mypath <- file.path(
    .get_course_path(),
    "lessons", "Custom_Functions",
    fileName
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
