## code to prepare `rtdeaths` dataset goes here

library(microdatasus)
library(tidyverse)

datasus_doext <- fetch_datasus(
  year_start = 1996,
  year_end = 2021,
  information_system = "SIM-DOEXT"
)

usethis::use_data(rtdeaths, overwrite = TRUE)
