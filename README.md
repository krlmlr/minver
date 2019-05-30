# minver

<!-- badges: start -->
[![Launch binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/krlmlr/minver/master)
<!-- badges: end -->

A workflow for finding the minimum required versions of all packages.

## How does it work?

1. It creates a baseline library via `remotes::install_deps(dependencies = TRUE)` .

2. Imported packages are sorted topologically, packages that depend on other packages come first. Versions are erased from the `DESCRIPTION` .

3. For each imported package, a bisection along the available versions (obtained via `crandb::package(version = "all")`) is made. The baseline library is copied (using symlinks), and the packages for which minimum versions are to be tested are installed using `remotes::install_version()`. The test criterion is a successful `R CMD check` without NOTEs.

4. The minimum version for each package is written to the `DESCRIPTION` .

## Prerequisites

1. Clone this project and install packages (or launch binder from the badge)

1. Clone the package you want to find minimum versions for

1. Adapt `00-*.R` to point to your package

## Run it

Copy the `minver` directory into the root of your package, call `usethis::use_build_ignore("minver")`.

Run each script `??-*.R` in sequence, the `05-*.R` script must be run repeatedly until the error `"All versions determined, move to next script."` is raised.

The following files are created:

- `gen.rds`: Imported packages sorted by "generation" (topologically)
- `baseline.rds`: All CRAN versions of imported packages
- `lib/`: The baseline library
- `candidate-####.rds`: Intermediate results of the bisection
