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
    "Lessons", "Reshape_by_Rows",
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

set.seed(123)

# Create a data frame for second language acquisition study
sla_df <- tibble(
  learner_id = 1:10,
  learner_age = sprintf("%d-%02d", sample(16:50, size = 10, replace = TRUE), sample(0:11, size = 10, replace = TRUE)),
  native_language = sample(c("Spanish", "Chinese", "Arabic", "Russian", "Hindi"), size = 10, replace = TRUE),
  time_studying = sprintf("%d-%02d", sample(0:10, size = 10, replace = TRUE), sample(0:11, size = 10, replace = TRUE)),
  level = sample(c("Beginner", "Intermediate", "Advanced"), size = 10, replace = TRUE),
  sentence = c(
    "I go to school every day by my bike.",
    "She have two childs and one dog.",
    "Yesterday night I can't sleep because too noisy.",
    "He don't like eat vegetables much.",
    "In my country, is very common to taking a nap after lunch.",
    "My teacher told that my writing has improved much.",
    "When I have question, I always to ask my classmate.",
    "Last weekend I go to beach with family.",
    "I needing help with my homeworks.",
    "The book was so interesting, so I read it in one day."
  )
)

# Add a column for home_languages where the learner's native language is repeated first, then 0, 1, or 2 other languages are added

set.seed(123)

sla_df <-
  sla_df |>
  mutate(
    home_languages = case_when(
      native_language == "Spanish" ~ paste(native_language, sample(c("English", "French", "German", ""), size = sample(1:2, 1)), sep = ", "),
      native_language == "Chinese" ~ paste(native_language, sample(c("English", "French", "German", ""), size = sample(1:2, 1)), sep = ", "),
      native_language == "Arabic" ~ paste(native_language, sample(c("English", "French", "German", ""), size = sample(1:2, 1)), sep = ", "),
      native_language == "Russian" ~ paste(native_language, sample(c("English", "French", "German", ""), size = sample(1:2, 1)), sep = ", "),
      native_language == "Hindi" ~ paste(native_language, sample(c("English", "French", "German", ""), size = sample(1:2, 1)), sep = ", ")
    )
  ) |>
  mutate(
    home_languages = str_remove_all(home_languages, ", $")
  )

sla_df <-
  sla_df |>
  select(learner_id, learner_age, native_language, home_languages, time_studying, level, sentence)
