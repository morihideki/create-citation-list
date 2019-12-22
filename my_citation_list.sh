#! /bin/bash

pandoc --wrap=none  01_text.docx -o 02_text.md
Rscript --vanilla extract_citation_1.R
pandoc 03_citation_list.md -o 04_citation_list.docx --bibliography=ref.bib --csl springer-basic-author-date-no-et-al.csl
