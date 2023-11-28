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
  mypath <- file.path( # nolint
    .get_course_path(),
    "Lessons", "Custom_Functions",
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

# View a script file in the Source pane
.view_script <<- function(file_name) {
  path <- .pathtofile(file_name)
  rstudioapi::navigateToFile(path)
}

# Variables -----------------------------------------------------------


# Functions -----------------------------------------------------------

create_word_tokens <- function(text, lowercase = TRUE) {
  # Function: Create word tokens from a character string

  # 1. Check that `text` is a character string
  if (!is.character(text)) {
    stop("`text` must be a character string.")
  }

  # 2. Split `text` into tokens by whitespace
  tokens <- strsplit(text, " ") |> unlist()

  # 3. Convert to lowercase if `lowercase` is TRUE
  if (lowercase) {
    tokens <- tolower(tokens)
  }

  # 4. Count the number of characters in each token
  tokens_len <- nchar(tokens)

  # 5. Create a data frame with the results
  df <- data.frame(text, tokens, tokens_len)

  # 6. Return the data frame
  return(df)
}