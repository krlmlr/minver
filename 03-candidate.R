library(tidyverse)

baseline <- readRDS("baseline.rds")

baseline %>%
  select(package = 1) %>%
  pwalk(desc::desc_set_dep, file = pkg_path)

saveRDS(baseline, "candidate-0001.rds")
