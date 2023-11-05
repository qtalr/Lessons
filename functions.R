# ======================================
# Functions for developing swirl lessons
# ======================================


# Description: Create a new swirl lesson --------------------------------------

create_swirl_lesson <- function(lesson_name, course_name, open_lesson = FALSE) {
  # Load required packages
  if (!require(swirl)) {
    install.packages("swirl")
    library(swirl)
  }

  if (!require(swirlify)) {
    install.packages("swirlify")
    library(swirlify)
  }

  # Get the path to the current working directory
  cwd <- getwd()

  # Set the current working directory
  setwd("../") # one level up from the current directory

  # Create a new swirl lesson
  swirlify::new_lesson(
    lesson_name = lesson_name,
    course_name = course_name,
    open_lesson = open_lesson
  )

  # Set the current working directory back to the original directory
  setwd(cwd)

  # Verify that the lesson was created
  swirlify::get_current_lesson()

  # Add the lesson to the MANIFEST
  swirlify::add_to_manifest()

  message("Lesson created and added to MANIFEST.")
}


# Description: Easy-select lessons --------------------------------------------

edit_swirl_lesson <- function() {
  # Load required packages
  if (!require(swirl)) {
    install.packages("swirl")
    library(swirl)
  }

  if (!require(swirlify)) {
    install.packages("swirlify")
    library(swirlify)
  }

  # Read the MANIFEST file
  manifest <- readLines("MANIFEST")

  # Provide a menu to select a lesson
  lesson_index <-
    menu(manifest,
      title = "Please select a lesson to set as the working lesson:"
    )

  # Get the path to the selected lesson
  lesson_path <- file.path(manifest[lesson_index], "lesson.yaml")

  # Set the selected lesson as the working lesson
  swirlify::set_lesson(lesson_path, open_lesson = FALSE)

  # Add the lesson to the MANIFEST
  swirlify::add_to_manifest()

  message("Lesson created, set, and added to MANIFEST.")

}

# Description: Scaffold display questions -------------------------------------

scaffold_display_questions <- function() {
  # Check to see if lesson path is set
  if (!is.null(getOption("swirlify_lesson_file_pat"))) {
    stop("Lesson path is not set. Please run `edit_swirl_lesson()` to set the working lesson.", call. = FALSE) # nolint
  }

  # Get the relative directory path of the lesson file
  rel_dir <-
    getOption("swirlify_lesson_file_path") |>
    fs::path_dir()
  # Get the parent directory of the lesson file
  par_dir <-
    rel_dir |>
    fs::path_rel()

  # Append the following to the initLesson.R file
  cat('
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
      "lessons", "', par_dir, '",
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
  ',
    file = file.path(rel_dir, "initLesson.R"),
    append = TRUE, sep = ""
  )

  # Create and add the following code above to plot-ex.R
  cat("# plot-ex.R
p <- ggplot(mtcars, aes(x = mpg, y = disp)) +
  geom_point()

print(p)", file = file.path(rel_dir, "plot-ex.R"))

  # Create and add the following code to page-ex.R
  cat("# page-ex.R
.viewer_question('page-ex.html')", file = file.path(rel_dir, "page-ex.R"))

  # Create and add the following code to page.Rmd
  cat("---
title: \"Page Example\"
output: html_document
---

## Instructions

To create a new page for a swirl lesson, do the following:

1. Copy and rename the `page-ex.R`
2. Edit the contents to represent the .html file you want to display in the lesson
3. Copy and rename the `page-ex.Rmd` file
4. Edit the contents to represent the .Rmd file you want to display in the lesson
5. Knit the .Rmd file to create the .html file
6. Add a lesson of class `figure` to the lesson yaml file, example below

```yaml
- Class: figure
  Output: Check out this content!
  Figure: page-ex.R
  FigureType: new
```

## Show code example

Here's a code example with highlighing. It will not execute in the lesson, but it will be visible to the user.

```r
ggplot(mtcars, aes(x = mpg, y = disp)) +
  geom_point()
```

## Show plots

Now we'll show the plot that was created in the code example above.

```{r}
#| label: fig-plot-no-code
#| echo: false

library(ggplot2)

ggplot(mtcars, aes(x = mpg, y = disp)) +
  geom_point()
```
", file = file.path(rel_dir, "page-ex.Rmd"))

  # Add questions to the lesson.yaml file as examples
  cat("

# Plot example
- Class: figure
  Output: Check out this figure!
  Figure: plot-ex.R
  FigureType: new

# Page example
- Class: figure
  Output: Check out this content!
  Figure: page-ex.R
  FigureType: new
", file = file.path(rel_dir, "lesson.yaml"), append = TRUE)

  # Render the page-ex.Rmd file
  rmarkdown::render(
    file.path(rel_dir, "page-ex.Rmd"),
    output_file = file.path(rel_dir, "page-ex.html"),
    output_dir = rel_dir
  )
}
