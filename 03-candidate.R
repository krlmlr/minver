library(tidyverse)

baseline <- readRDS("baseline.rds")

baseline %>%
  select(package = 1) %>%
  pwalk(desc::desc_set_dep)

saveRDS(baseline, "candidate-0001.rds")
