library(httr)
download_wikipedia <- function(path){
  fn <- sample(c(letters, 1:10), size = 10, replace = T) %>% paste0(collapse = "")
  GET("https://pt.wikipedia.org/wiki/Especial:Aleat%C3%B3ria",
      write_disk(sprintf("%s%s.html", path, fn)))
}

for (i in 1:10000) {
  download_wikipedia(path = "data-raw/wikipages/")
  Sys.sleep(1)
}

words <- list.files("data-raw/wikipages/", full.names = T) %>%
  plyr::llply(function(x){
    read_html(x) %>%
      html_nodes("p") %>%
      html_text()
  }, .progress = "text") %>%
  unlist() %>%
  stringr::str_extract_all("\\b[:alpha:]+\\b") %>%
  unlist() %>%
  tolower() %>%
  dplyr::data_frame(word = .) %>%
  dplyr::group_by(word) %>%
  dplyr::summarise(count = n()) %>%
  dplyr::arrange(desc(count))




