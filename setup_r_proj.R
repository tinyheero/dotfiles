#!/usr/bin/env Rscript

script_description <- "
Setup a new R project by installing nvimcom and colorout.
"

install.packages("rprojroot")
devtools::install("~/.config/nvim/R/nvimcom")
devtools::install_github("jalvesaq/colorout", force = TRUE)
