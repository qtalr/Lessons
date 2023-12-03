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

.pathtofile <<- function(fileName) {
  file.path(
    .get_course_path(),
    "Lessons", "Pattern_Matching",
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

# Variables created here will be available to the user

practice_chr <- c(
  "The quick brown fox jumps over the lazy dog.",
  "1234567890 is a sequence of digits.",
  "E-mail addresses like simon@example.com are common these days.",
  "Can you find patterns with ph like 'phone', 'phrase', or 'philosophy'?",
  "There are 3.14159 reasons to love Pi.",
  "The regex function str_detect() can be very useful!",
  "A well-crafted sentence can contain: punctuations, CAPITAL letters, and numbers like 42.",
  "Look for special characters like $, ^, +, *, and ? in this sentence.",
  "How many times does the word 'the' appear in this text?",
  "It's important to escape metacharacters, e.g., using \\ before them."
)
