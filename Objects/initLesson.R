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
    "lessons", "Objects",
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

# Variables for the lesson

# Set seed for reproducibility
set.seed(123)

# Create a data frame with 100 rows
df <- tibble(
  speaker_id = replicate(100, paste0(sample(letters, 1), sample(0:9, 1))),
  speaker_age = sample(18:65, 100, replace = TRUE),
  english_native = sample(c(TRUE, FALSE), 100, replace = TRUE),
  modality = sample(c("spoken", "written"), 100, replace = TRUE),
  token = replicate(100, paste(sample(c("love", "book", "justice", "phone", "success", "coffee"), 1, replace = TRUE))), #nolint
  token_length = str_count(token),
  token_freq_pmw = (token_length * sample(1:10, 100, replace = TRUE)/ 1345119) * 1000000 #nolint
)

# Create vectors from each column

speaker_id <- df$speaker_id
speaker_age <- df$speaker_age
english_native <- df$english_native
modality <- df$modality
token <- df$token
token_length <- df$token_length
token_freq_pmw <- df$token_freq_pmw

# Remove the df
rm(df)
