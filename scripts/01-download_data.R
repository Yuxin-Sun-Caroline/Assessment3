#### Preamble ####
# Purpose: Downloads and saves the data from OpenDataToronto
# Author: Yuxin Sun
# Date: 19 September 2024 
# Contact: yuxin.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
# Load necessary libraries
library(opendatatoronto)
library(tidyverse)


#### Download data ####
package <- show_package("e28bc818-43d5-43f7-b5d9-bdfb4eda5feb")

resources <- list_package_resources("e28bc818-43d5-43f7-b5d9-bdfb4eda5feb")

str_res <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

marriage_licence_raw <- filter(str_res, row_number() == 1) %>% get_resource()


#### Create directory if it doesn't exist ####
# Define the directory path
dir_path <- "starter_folder-main/data/raw_data/"

# Create the directory if it does not exist
if (!dir.exists(dir_path)) {
  dir.create(dir_path, recursive = TRUE)
}


#### Save data ####
# Save the raw data to a CSV file in the specified directory
write.csv(marriage_licence_raw, file.path(dir_path, "raw_data.csv"), row.names = FALSE)

         
