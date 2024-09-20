#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers
# Author: Yuxin Sun
# Date: 19 September 2024 
# Contact: yuxin.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: none
# Any other information needed? none

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

clean_data <-
  raw_data |>
  janitor::clean_names() |>
  separate(col = time_period,
           into = c("year", "month"),
           sep = "-") |>
  mutate(date = lubridate::ymd(paste(year, month, "01", sep = "-"))
  )

#### Save data ####
write_csv(clean_data, "data/analysis_data/marriage_data.csv")