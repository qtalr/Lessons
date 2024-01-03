# R Lessons

> R interactive lessons for the Quantitative Text Analysis for Linguists textbook.

💪🏻 Under development

## Overview

| Lesson                 | Description                                                                                                                                                                                                                                                                               | Chapter                  |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| Intro to Swirl         | Getting familiar with the Swirl interactive tutorial system for learning R                                                                                                                                                                                                                | Preface                  |
| Workspace              | Presents RStudio, a powerful IDE for R programming, explaining its user-friendly interface, the functions of its four main panes (Source, Console, Environment, Files), and how it enhances efficient R coding and project organization.                                                  | Text analysis in context |
| Vectors                | Introduces vectors, detailing their creation, types, properties, operations, and variable naming conventions, underscoring the importance of vectors in R's data handling.                                                                                                                | Text analysis in context |
| Objects                | Explains R objects, particularly vectors and data frames, detailing object inspection, creation, coercion, and subsetting, and introduces tibbles as modern data frames, essential for mastering object manipulation in R.                                                                | Understanding data       |
| Packages and Functions | Covers R packages and functions, detailing package management, function usage, argument handling, and introduces the Tidyverse piping concept, demonstrating how to chain functions for efficient data manipulation.                                                                      | Understanding data       |
| Summarizing Data       | Provides an in-depth guide to summarizing data in R, showcasing methods for statistical summaries of vectors and data frames with functions like mean(), summary(), table(), and skim(), as well as using dplyr's summarize() and group_by() for detailed and grouped data analysis.      | Approaching analysis     |
| Visual Summaries       | Teaches visual data summarization with ggplot2 in R, explaining the layering of plots using ggplot(), aes(), and geom_*() functions to create informative graphics that enhance data interpretation and analysis.                                                                         | Approaching analysis     |
| Project Environment    | Highlights the importance of the computing environment in R for project management and reproducibility, detailing how to use sessionInfo() and sessioninfo::session_info() to inspect session details and emphasizing the role of Quarto documents in maintaining independent R sessions. | Framing research         |
| Control Statements     | Delves into R's control statements, including conditionals and iteration, to improve programming flow control.                                                                                                                                                                            | Acquire data             |
| Custom Functions       | Covers creating and using custom functions in R, focusing on their development, arguments, and how to return values effectively.                                                                                                                                                          | Acquire data             |
| Pattern Matching       | Provides an introduction to pattern matching in text using regular expressions, covering basic syntax, literals, metacharacters, character classes, and quantifiers.                                                                                                                      | Curate datasets          |
| Tidy data              | Reviews various R object types and demonstrated how to manipulate data frames, including adding columns, working with nested structures, and using functions like mutate(), group_by(), and unnest().                                                                                     | Curate datasets          |
| Reshape by Rows        | Covers how to manipulate the number of rows in a dataset through various methods including separating and collapsing rows, tokenizing and unnesting text, and filtering out rows using functions from the dplyr, tidyr, stringr, tokenizers, and tidytext packages                        | Transform datasets       |
| Reshape by Columns     | Explore how to use stringr, tidyr, and dplyr packages to normalize values, separate and collapse columns, recode values, and join columns, which are key operations for reshaping datasets by their columns.                                                                              | Transform datasets       |
| Advanced Objects       | Focuses on matrices and lists, covering their definition, creation, naming, inspection, element access, and calculations, with practical examples and considerations for text analysis research.                                                                                          | Exploration              |
| Advanced Visualization | A deeper dive into the ggplot2 package to enhance visual summaries and provides an introduction to the factoextra and ggfortify packages that extend ggplot2 capabilities to model objects.                                                                                               | Prediction               |
| Advanced Tables        | A deeper dive into kableExtra for use with the knitr package to enhance tabular outpu.                                                                                                                                                                                                    | Inference                |
| Computing_Environment  | Introduces strategies for creating reproducible computing environments including hardware, operating system, and software using Docker and the renv package.                                                                                                                              | Contributing             |

## Installation

Install `swirl` package from CRAN:

```r
install.packages("swirl")
```

Install `swirl` lessons from GitHub:

```r
library(swirl)
install_course_github("qtalr/Lessons")
```

## Usage

Run `swirl()` to start working on the lessons:

```r
swirl()
```