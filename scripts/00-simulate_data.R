#### Preamble ####
# Purpose: Simulates marriage licence 
# Author: Yuxin Sun
# Date: 19 September 2024
# Contact: yuxin.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####

# Define the start and the end of the dates #
set.seed(1006925598)
start_date <- as.Date("2023-01-01")
end_date <- as.Date("2023-12-31")

# Set the number of random dates you want to generate #
number_of_dates <- 100

data <-
  tibble(
    date = as.Date(runif(n = number_of_dates, min = as.numeric(start_date), max = as.numeric(end_date)),origin = "1970-01-01"),
    number_of_marriage = rpois(n = 100, lambda  = 10)
  )



