library(magrittr)

words <- list.files("data-raw/wikipages/", full.names = T) %>%
  plyr::llply(function(x){
    xml2::read_html(x) %>%
      rvest::html_nodes("p") %>%
      rvest::html_text()
  }, .progress = "text") %>%
  unlist() %>%
  stringr::str_extract_all("\\b[:alpha:]+\\b") %>%
  unlist() %>%
  tolower() %>%
  dplyr::data_frame(word = .) %>%
  dplyr::group_by(word) %>%
  dplyr::summarise(count = n()) %>%
  dplyr::arrange(desc(count))


# use hunspell to use only valid words
words$check <- hunspell::hunspell_check(
  words$word,
  dict = system.file("dict/Portuguese_Brazilian.dic", package = "ptstem")
  )







