
create_word_tokens <- function(text, lowercase = TRUE) {
  # Function: Create word tokens from a character string

  # 1. Check that `text` is a character string
  if (!is.character(text)) {
    stop("`text` must be a character string.")
  }

  # 2. Split `text` into tokens by whitespace
  tokens <- strsplit(text, " ") |> unlist()

  # 3. Convert to lowercase if `lowercase` is TRUE
  if (lowercase) {
    tokens <- tolower(tokens)
  }

  # 4. Count the number of characters in each token
  tokens_len <- nchar(tokens)

  # 5. Create a data frame with the results
  df <- data.frame(text, tokens, tokens_len)

  # 6. Return the data frame
  return(df)
}
