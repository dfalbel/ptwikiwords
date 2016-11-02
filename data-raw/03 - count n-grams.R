# Packages ----------------------------------------------------------------
library(tidyverse)
library(tokenizers)
library(rvest)
library(xml2)


# Extract 2-Grams ---------------------------------------------------------

ngrams <- list.files("data-raw/wikipages/", full.names = T) %>%
  map(~
    read_html(.x) %>%
      rvest::html_nodes("p") %>%
      rvest::html_text()
  ) %>%
  unlist() %>%
  tokenize_ngrams(n = 2) %>%
  unlist() %>%
  data_frame(ngrams = .) %>%
  group_by(ngrams) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

devtools::use_data(ngrams, overwrite = T)



