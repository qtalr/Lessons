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
    "Lessons", "Advanced_Visualization",
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

# For ggplot2

passives_df <-
  corpora::BrownLOBPassives |>
  tibble::as_tibble() |>
  dplyr::mutate(
    genre = stringr::str_to_title(genre)
  ) |>
  dplyr::mutate(
    genre = factor(genre)
  ) |>
  dplyr::select(id, genre, lang, num_passives = passive, num_words = n_w, num_sents = n_s)

# passives_df

# For factoextra

passives_dtm <-
  passives_df |>
  tidytext::cast_dtm(genre, id, num_passives) |>
  as.matrix()

passives_dtm <-
  passives_dtm / rowSums(passives_dtm)

# passives_dtm

passives_pca <-
  passives_dtm |>
  prcomp()


passives_dst <-
  passives_dtm |>
  dist()


passives_hcl <-
  passives_dtm |>
  dist() |>
  hclust()


passives_kcl <-
  passives_dtm |>
  kmeans(2, nstart = 10)


# For ggfortify
library(rsample)

class_df <-
  passives_df |>
  dplyr::filter(genre %in% c("Press Reportage", "Science Fiction")) |>
  dplyr::mutate(
    genre = forcats::fct_relevel(genre, "Press Reportage", "Science Fiction") |> forcats::fct_drop()
  ) |>
  dplyr::select(genre, num_passives, num_words, num_sents)

set.seed(123)
class_df_split <-
  class_df |>
  initial_split(class_df, prop = .75, strata = genre)

class_train <- training(class_df_split)
class_test <- testing(class_df_split)

library(recipes)

class_rec <-
  recipe(
    genre ~ num_passives + num_words + num_sents,
    data = class_train
  ) |>
  step_normalize(all_predictors())

library(parsnip)

class_mod_spec <-
  logistic_reg() |>
  set_engine("glm") |>
  set_mode("classification")

library(workflows)

class_wf <-
  workflow() |>
  add_recipe(class_rec) |>
  add_model(class_mod_spec)

class_wf_fit <-
  class_wf |>
  fit(data = class_train)

class_cls_preds <-
  bind_cols(class_train, predict(class_wf_fit, class_train))

class_prb_preds <-
  bind_cols(class_train, predict(class_wf_fit, class_train, type = "prob"))

library(yardstick)

class_cls_preds |>
  metrics(truth = genre, estimate = .pred_class)

genre_conf_mat <-
  class_cls_preds |>
  conf_mat(truth = genre, estimate = .pred_class)


genre_roc_curve <-
  class_prb_preds |>
  roc_curve(genre, `.pred_Press Reportage`)


# Clean up

rm(list = ls(pattern = "class"))

detach(package:yardstick)
detach(package:workflows)
detach(package:parsnip)
detach(package:recipes)
detach(package:rsample)
