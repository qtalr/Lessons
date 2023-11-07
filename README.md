# R Lessons

> R interactive lessons for the Quantitative Text Analysis for Linguists textbook.

💪🏻 Under development

## Overview

| Lesson                    | Description                                                                                             | Chapter                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------- | ------------------------ |
| Intro to Swirl            | Getting familiar with the Swirl interactive tutorial system for learning R                              | Preface                  |
| Workspace                 | Getting familiar with the RStudio workspace and its different components                                | Text analysis in context |
| Vectors                   | Getting familiar with vectors, variables, and operations.                                               | Text analysis in context |
| Objects                   | Understanding the different types of objects in R, how to create them, and how to subset them           | Understanding data       |
| Packages and Functions    | Understanding the role of packages and functions in R, how to use them. Use of pipes to chain functions | Understanding data       |
| Summarizing Data          | Understanding how to summarize data in R numerically                                                    | Approaching analysis     |
| Data Visualization        | Understanding how to visualize data in R using the Grammar of Graphics                                  | Approaching analysis     |
| Project Management        | ...                                                                                                     | Framing research         |
| Control Statements        | Understanding the concept of control statements in R                                                    | Acquire data             |
| Custom Functions          | Understanding how to write custom functions in R and how to access them                                 | Acquire data             |
| Pattern Matching          | Learn how to use regular expressions to match patterns in text using the stringr package.               | Curate data(sets)        |
| Data Wrangling            | Learn how to wrangle data using the dplyr package.                                                      | Curate data(sets)        |
| Reshaping Dataset Rows    | Learn how to reshape data using the dplyr and tidyr packages.                                           | Transform data           |
| Reshaping Dataset Columns | Learn how to reshape data using the dplyr and tidyr packages.                                           | Transform data           |
| Matrices                  | Learn how to work with matrices to store and analyze numeric data.                                      | Exploration              |
| Advanced visualization    | ...                                                                                                     | Prediction               |
| Advanced tables           | ...                                                                                                     | Inference                |
| ...                       | ...                                                                                                     | Contributing             |

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