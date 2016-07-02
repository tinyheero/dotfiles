
if (interactive()) {
  # Default repo
  local({r <- getOption("repos")
         r["CRAN"] <- "http://cran.stat.sfu.ca"
         options(repos=r)
  })

  #chooseCRANmirror(graphics = FALSE)

	library("setwidth")
	library("colorout")

  # Set working directory to alway the project root
  tryCatch(
    setwd(rprojroot::find_root("_rmdsetup.Rmd")),
    error = function(c) message("Current working directory: ", getwd())
  )

  message("Current working directory: ", getwd())
}
