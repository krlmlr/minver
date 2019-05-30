library(tidyverse)

db <- cranly::clean_CRAN_db()
network <- cranly::build_network(db)
tree <- cranly::compute_dependence_tree(network, my_package)

deps <- desc::desc_get_deps(file = pkg_path)

prios <-
  db %>%
  select(package, priority) %>%
  mutate(priority = coalesce(priority, "CRAN"))

gen <-
  tree %>%
  arrange(generation) %>%
  distinct(package, .keep_all = TRUE) %>%
  arrange(-generation) %>%
  inner_join(deps, by = "package") %>%
  left_join(prios, by = "package") %>%
  filter(priority == "CRAN") %>%
  select(-priority)

saveRDS(gen, "gen.rds")
