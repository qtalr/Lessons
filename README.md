# R Lessons

> R interactive lessons for the Quantitative Text Analysis for Linguists textbook.

💪🏻 Under development

## Overview

| Lesson                 | Description                                                                                                                | Chapter                  |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------------- | ------------------------ | ------------------------ |
| Intro to Swirl         | Getting familiar with the Swirl interactive tutorial system for learning R                                                 | Preface                  |
| Variables and Vectors  | Getting familiar with R basics like variables, vectors, and logical operators. Also, code comments and the pipe operator ` | >`.                      | Text analysis in context |
| Workspace              | Getting familiar with the RStudio workspace and its different components                                                   | Text analysis in context |
| Objects                | Understanding the different types of objects in R, how to create them, and how to subset them                                                                                                                        | Understanding data       |
| Packages and Functions | Understanding the role of packages and functions in R, how to use them, and how to write custom functions                                                                                                                        | Understanding data       |
| Summarizing Data       | Understanding how to summarize data in R                                                                                                                        | Approaching analysis     |
| Data Visualization     | Understanding how to visualize data in R using the Grammar of Graphics                                                                                                                        | Approaching analysis     |
| Project Management     | ...                                                                                                                        | Framing research         |
| Control Statements     | Understanding how to use control statements in R                                                                                                                        | Acquire data             |
| Custom Functions       | Understanding how to write custom functions in R and how to access them                                                                                                                        | Acquire data             |
| Vectorization          | Learn how to use vectorization and iteration to work with data in R.                                                                                                                        | Curate data              |
| Pattern Matching       | Learn how to use regular expressions to match patterns in text using the `stringr` package.                                                                                                                        | Curate data              |
| Reshaping Data         | Learn how to reshape data using the `dplyr` and `tidyr` packages.                                                                                                                        | Transform data           |
| Matrices                    | Learn how to work with matrices to store and analyze numeric data.                                                                                                                        | Exploratory analysis     |
| Nested Data Structures                    | Learn how to work with nested data structures in R.                                                                                                                        | Predictive analysis      |
| Model Objects                    | Learn how to work with model objects in R.                                                                                                                        | Inferential analysis     |
| ...                    | ...                                                                                                                        | Reporting                |
| ...                    | ...                                                                                                                        | Collaboration            |

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
