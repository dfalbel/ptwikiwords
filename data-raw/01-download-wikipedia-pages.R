library(httr)
download_wikipedia <- function(path){
  fn <- sample(c(letters, 1:10), size = 10, replace = T) %>% paste0(collapse = "")
  dplyr::failwith(NULL, GET)("https://pt.wikipedia.org/wiki/Especial:Aleat%C3%B3ria",
      write_disk(sprintf("%s%s.html", path, fn)))
}

for (i in 1:2000) {
  download_wikipedia(path = "data-raw/wikipages/")
  Sys.sleep(1)
}
