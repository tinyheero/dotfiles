# Set the default CRAN repo without clobbering site-wide settings
r <- getOption("repos")
r["CRAN"] <- "https://cran.ma.imperial.ac.uk/"
options(repos = r)
rm(r)

# RGL should use the NULL device 
options(rgl.useNULL = TRUE)

# In the event of an error, print a stack trace:
options(
  error = function() {
    traceback(2)
    if(!interactive()) {
      print("Encountered an error")
      quit(save = "default", status = 1, runLast = FALSE)
    }
  }
)

.libPaths(c('~/R/library', '/usr/lib64/R/library', '/usr/share/R/library'))
