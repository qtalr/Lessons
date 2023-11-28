# R Lessons

> R interactive lessons for the Quantitative Text Analysis for Linguists textbook.

💪🏻 Under development

## Overview

| Lesson                        | Description                                                                                                                                                                                                                                                                               | Chapter                  |
| ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| Intro to Swirl                | Getting familiar with the Swirl interactive tutorial system for learning R                                                                                                                                                                                                                | Preface                  |
| Workspace                     | Presents RStudio, a powerful IDE for R programming, explaining its user-friendly interface, the functions of its four main panes (Source, Console, Environment, Files), and how it enhances efficient R coding and project organization.                                                  | Text analysis in context |
| Vectors                       | Introduces vectors, detailing their creation, types, properties, operations, and variable naming conventions, underscoring the importance of vectors in R's data handling.                                                                                                                | Text analysis in context |
| Objects                       | Explains R objects, particularly vectors and data frames, detailing object inspection, creation, coercion, and subsetting, and introduces tibbles as modern data frames, essential for mastering object manipulation in R.                                                                | Understanding data       |
| Packages and Functions        | Covers R packages and functions, detailing package management, function usage, argument handling, and introduces the Tidyverse piping concept, demonstrating how to chain functions for efficient data manipulation.                                                                      | Understanding data       |
| Summarizing Data              | Provides an in-depth guide to summarizing data in R, showcasing methods for statistical summaries of vectors and data frames with functions like mean(), summary(), table(), and skim(), as well as using dplyr's summarize() and group_by() for detailed and grouped data analysis.      | Approaching analysis     |
| Visual Summaries              | Teaches visual data summarization with ggplot2 in R, explaining the layering of plots using ggplot(), aes(), and geom_*() functions to create informative graphics that enhance data interpretation and analysis.                                                                         | Approaching analysis     |
| Project Environment           | Highlights the importance of the computing environment in R for project management and reproducibility, detailing how to use sessionInfo() and sessioninfo::session_info() to inspect session details and emphasizing the role of Quarto documents in maintaining independent R sessions. | Framing research         |
| Control Statements            | Delves into R's control statements, including conditionals and iteration, advocating for vectorization and the purrr package's map() function to improve programming flow control.                                                                                                        | Acquire data             |
| Custom Functions              | Understanding how to write custom functions in R and how to access them                                                                                                                                                                                                                   | Acquire data             |
| Pattern Matching              | Introduces Regular Expressions, a powerful pattern matching syntax, and their use in R functions.                                                                                                                                                                                         | Curate data(sets)        |
| Tidy data                     | Provides an overview of how to apply functions from various Tidyverse packages to derive rectangular data from non-rectangular data and datasets.                                                                                                                                         | Curate data(sets)        |
| Reshaping Datasets by Rows    | Provides an overview of how to apply functions from various Tidyverse packages to reshape data in a row-wise fashion.                                                                                                                                                                     | Transform data           |
| Reshaping Datasets by Columns | Provides an overview of how to apply functions from various Tidyverse packages to reshape data in a column-wise fashion.                                                                                                                                                                  | Transform data           |
| Advanced Objects              | A deeper dive into R objects with special attention to nested data, matrices, and lists.                                                                                                                                                                                                  | Exploration              |
| Advanced Visualization        | A deeper dive into the ggplot2 package to enhance visual summaries.                                                                                                                                                                                                                                                                                       | Prediction               |
| Advanced Tables               | A deeper dive into kableExtra for use with the knitr package to enhance tabular outpu.                                                                                                                                                                                                                                                                                  | Inference                |
| Computing_Environment         | Introduces strategies for creating reproducible computing environments including hardware, operating system, and software using Docker and the renv package.                                                                                                                                                                                                                                                                                       | Contributing             |

## Installation

Install `swirl` package from CRAN:

```r
install.packages("swirl")
```

Install `swirl` lessons from GitHub:

```r
library(swirl)
install_course_github("qtalr/lessons")
```

## Usage

Run `swirl()` to start the lessons:

```r
swirl()
```