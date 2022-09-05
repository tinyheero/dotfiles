local iron = require('iron')

iron.core.add_repl_definitions {
  snakemake = {
    snakemake_repl = {
      command = {"ipython"}
    }
  },
}

iron.core.set_config {
  preferred = {
    python = "ipython",
    clojure = "lein",
    sh = "bash"
  }
}
