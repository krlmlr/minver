library(tidyverse)

lib <- "lib"
unlink(lib, recursive = TRUE, force = TRUE)
dir.create(lib, showWarnings = FALSE)

invisible(remotes::install_deps)
withr::with_libpaths(lib, remotes::install_deps(pkg_path, dependencies = TRUE), action = lib_action)

# Some packages require memoise
withr::with_libpaths(lib, install.packages("memoise"), action = lib_action)
