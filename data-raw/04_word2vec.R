library(text2vec)
library(tidyverse)
library(ptwikiwords)
library(rvest)
library(xml2)


textos <- list.files("data-raw/wikipages/", full.names = T) %>%
  map(~
        read_html(.x) %>%
        rvest::html_nodes("p") %>%
        rvest::html_text()
  ) %>%
  unlist()
# textos <- paste0(textos, collapse = " ")


# Create iterator over tokens
tokens <- space_tokenizer(textos)
# Create vocabulary. Terms will be unigrams (simple words).
it = itoken(tokens, progressbar = FALSE)
vocab <- create_vocabulary(it)


# Use our filtered vocabulary
vectorizer <- vocab_vectorizer(vocab,
                               # don't vectorize input
                               grow_dtm = FALSE,
                               # use window of 5 for context words
                               skip_grams_window = 5L)
tcm <- create_tcm(it, vectorizer)


glove = GlobalVectors$new(word_vectors_size = 50, vocabulary = vocab, x_max = 10)
glove$fit(tcm, n_iter = 20)

word_vectors <- glove$get_word_vectors()

berlin <- (word_vectors["cachorro", , drop = FALSE] +
  word_vectors["gato", , drop = FALSE])/2
  word_vectors["mulher", , drop = FALSE]

cos_sim = sim2(x = word_vectors, y = berlin, method = "cosine", norm = "l2")
head(sort(cos_sim[,1], decreasing = TRUE), 5)
