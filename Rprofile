# vim: set ft=r:
if (interactive()) {
  # Default repo
  local({r <- getOption("repos")
         r["CRAN"] <- "https://cran.ma.imperial.ac.uk"
         options(repos=r)
  })

  #chooseCRANmirror(graphics = FALSE)

  library("colorout")

  # Set working directory to alway the project root
  tryCatch(
    setwd(rprojroot::find_root(rprojroot::has_file(".git/index"))),
    error = function(c) {
      message("Unable to find .git/index. Won't change the working directory")
    }
  )

  message("Current working directory: ", getwd())

  # Increase the display width of tibbles in the console
  options(tibble.width = 275)
}

#' Set the debug mode that happens when an error is thrown
#' 
#' @param debug_mode Set the debug mode to happen when an error is thrown
set_debug_mode <- function(debug_mode = c("off", "traceback")) {
  if (debug_mode == "traceback") {
    message("Turning debug mode to traceback")
    options(error = traceback)
  } else if (debug_mode == "off") {
    message("Turning debug mode off")
    options(error = NULL)
  }
}

#' List functions that have debugged flagged set
#'
#' @param items
ls_deb  <- function(items = search()){
  .ls.deb <-  function (i){
    f <- ls (i)
    f <- mget (f, as.environment (i), mode = "function",

               ## return a function that is not debugged
               ifnotfound = list (function (x) function () NULL)
               )

    if (length (f) == 0)
      return (NULL)

    f <- f [vapply (f, isdebugged)]
    f <- names (f)

    ## now check whether the debugged function is masked by a not debugged one
    masked <- !vapply (f, function (f) isdebugged (get (f)))

    ## generate pretty output format:
    ## "package::function"  and "(package::function)" for masked debugged functions
    if (length (f) > 0) {
      if (grepl ('^package:', i)) {
        i <- gsub ('^package:', '', i)
        f <- paste (i, f, sep = "::")
      }

      f [masked] <- paste ("(", f [masked], ")", sep = "")

      f
    } else {
      NULL
    }
  }

  functions <- lapply (items, .ls.deb)
  unlist (functions)
}
