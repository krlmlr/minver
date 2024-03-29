library(tidyverse)

# pak::pak("r-hub/crandb")

gen <-
  readRDS("gen.rds") %>%
  as_tibble()

gen_crandb <-
  gen %>%
  select(-type, -version) %>%
  mutate(crandb = map(package, ~ crandb::package(., version = "all")))

baseline <-
  gen_crandb %>%
  mutate(version = map(crandb, ~ names(pluck(., "versions")))) %>%
  mutate(first_version = map_chr(version, 1)) %>%
  mutate(last_version = map_chr(version, tail, 1)) %>%
  select(-crandb)

saveRDS(baseline, "baseline.rds")
