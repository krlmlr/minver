pkg_path <- "~/git/R/dplyr"
my_package <- desc::desc_get_field("Package", file = pkg_path)

# Change to "prefix" if you are sure that you have an
# up-to-date R library
lib_action <- "replace"
