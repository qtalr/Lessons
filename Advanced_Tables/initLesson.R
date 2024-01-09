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
  file.path( #nolint
    .get_course_path(),
    "Lessons", "Advanced_Tables",
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

# Add variables to the user's environment ----------------

library(dplyr)
library(janitor)
library(kableExtra)

df <-
  corpora::BrownLOBPassives |>
  as_tibble() |>
  mutate(
    genre = stringr::str_to_title(genre)
  ) |>
  mutate(
    genre = factor(genre)
  ) |>
  select(id, genre, lang, num_passives = passive, num_words = n_w, num_sents = n_s)

lan_df <-
  df |>
  group_by(lang) |>
  summarize(
    num_passives = sum(num_passives),
    num_words = sum(num_words),
    num_sents = sum(num_sents)
  ) |>
  ungroup()

lan_gen_df <-
  df |>
  group_by(lang, genre) |>
  summarize(
    num_passives = sum(num_passives),
    num_words = sum(num_words),
    num_sents = sum(num_sents)
  ) |>
  ungroup()

ame_tbl <-
  filter(lan_gen_df, lang == "AmE") |>
  adorn_percentages("col") |>
  adorn_pct_formatting() |>
  adorn_ns()

bre_tbl <-
  filter(lan_gen_df, lang == "BrE") |>
  adorn_percentages("col") |>
  adorn_pct_formatting() |>
  adorn_ns()

ame_bre_tbl <- bind_rows(ame_tbl, bre_tbl)

ame_bre_kbe <-
  ame_bre_tbl |>
  select(-lang) |>
  kbl(col.names = c("", "Passives", "Words", "Sentences"), align = "lrrr") |>
  add_header_above(c("Metadata" = 1, "Linguistic Information" = 3)) |>
  pack_rows("American English", 1, 9) |>
  pack_rows("British English", 10, 18)

# Clean up the environment ------------------------------

detach("package:dplyr")

rm(df, lan_gen_df, ame_tbl, bre_tbl)
