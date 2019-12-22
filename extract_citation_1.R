library(readr)
library(magrittr)
library(stringr)

my_txt <- read_file("02_text.md")
my_regex <- "([A-Z][a-z]+\\sand\\s)?[A-Z][a-z]+\\s(et\\sal.?,?\\s)?[(]?\\d{4}"
# str_view_all(my_txt, my_regex)

cite_found <- str_extract_all(my_txt, my_regex, simplify = TRUE) %>% 
  str_remove_all("\\(") %>% 
  unique() %>% 
  sort()

cite_name <- cite_found %>% 
  str_extract("^[A-Z][a-z]+")
cite_year <- cite_found %>% 
  str_extract("\\d{4}[a-z]?")

cite_out <- str_c("@", cite_name, cite_year) %>% 
  str_flatten(collapse = "\n") %>% 
  str_c(., "\n\n\n# Reference\n\n")
write(cite_out, "03_citation_list.md")

