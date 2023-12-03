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
    "Lessons", "Tidy_Datasets",
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

# Create a character vector with English as a first language

ns_chr <- c(
  "The sun sets over the ocean, a breathtaking sight.",
  "A small garden buzzes with life.\nNature's intricate balance is beautifully evident.",
  "The book on ancient civilizations is enlightening.\nIt reveals fascinating facts, like the true builders of the pyramids.",
  "Technology advances at a breakneck pace, reshaping our world and opening endless possibilities.",
  "Cooking is an art.\nA perfect blend of spices creates a masterpiece.\nA dash of salt can make or break a dish."
)

# Creating a character vector with English as a second language (French influence)

# nns_chr <- c(
#   "The sun, it sets over the ocean, a sight very beautiful.",
#   "In a small garden, life is buzzing.\nThe balance of nature, it is evident beautifully.",
#   "A book about ancient civilizations, it is very enlightening.\nFacts fascinating it reveals, like who really built the pyramids.",
#   "Technology, it advances very quickly, changing our world and possibilities many it opens.",
#   "Cooking, it is an art and a science.\nSpices perfect blended create a flavor masterpiece."
# )
