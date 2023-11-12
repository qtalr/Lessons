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
    mypath <- file.path(
      .get_course_path(),
      "lessons", "Summarizing_Data",
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
  
# Variables

# Data frame
path_to_data_file <- 
  file.path(.get_course_path(), "lessons", "Summarizing_Data", "books.csv")
books_df <- read_csv(path_to_data_file) |> suppressMessages()

# Numeric vector
word_count <- books_df$word_count

# Character vector
text_genre <- books_df$text_genre
