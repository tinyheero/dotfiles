#!/usr/bin/env Rscript

script_description <- "
Setup a new R project by installing nvimcom and colorout.
"

devtools::install("~/.config/nvim/R/nvimcom")
devtools::install_github("jalvesaq/colorout", force = TRUE)
