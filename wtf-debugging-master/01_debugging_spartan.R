# Determine the bug when you run `get_climates()`
# Hint: Use `traceback()` to find where it occurs, add breakpoints / `browser()` calls
# Hint: look at types of input

library(tidyverse)

# Separate, flatten, and trim values in the vector
clean <- function(vec) {
  values <- strsplit(vec, ",")
  flat_values <- unlist(values)
  trimmed_values <- str_trim(flat_values)
  trimmed_values
}


# Clean vector and get the unique values
uniquify <- function(vec) {
  clean_values <- clean(vec)
  unique_values <- unique(clean_values)
  unique_values
}

# Read data and get unique climate values
get_climates <- function() {
  #planets <- read.csv2(here::here("activities/planets.csv"))
  planets <- read.csv2("C:/Users/by22/Desktop/wtf-debugging-master/planets.csv")
  unique_climate <- uniquify(planets$climate)
  unique_climate
}

# This example originally used in Amanda Gadrow's excellent debugging talk at rstudio::conf 2018,
# https://github.com/ajmcoqui/debuggingRStudio/blob/b70a3575a3ff5e7867b05fb5e84568abba426c4b/error_example.R

get_climates()
# Error in strsplit(vec, ",") : non-character argument

traceback()
#4: strsplit(vec, ",") at #2
#3: clean(vec) at #2
#2: uniquify(planets$climate) at #4
#1: get_climates()

# Separate, flatten, and trim values in the vector
clean <- function(vec) {
  browser()
  values <- strsplit(vec, ",")
  flat_values <- unlist(values)
  trimmed_values <- str_trim(flat_values)
  trimmed_values
}

get_climates()

##### ----- ADD BROWSER() -------

> get_climates()
Called from: clean(vec)
Browse[1]> str(vec)
Factor w/ 5 levels "frozen","murky",..: 3 5 1 2 3 3 3 3 3 4
Browse[1]> strsplit(as.character(vec), ",")
[[1]]
[1] "temperate"

[[2]]
[1] "temperate" " tropical"

[[3]]
[1] "frozen"

[[4]]
[1] "murky"

[[5]]
[1] "temperate"

[[6]]
[1] "temperate"

[[7]]
[1] "temperate"

[[8]]
[1] "temperate"

[[9]]
[1] "temperate"

[[10]]
[1] "temperate" " arid"


###--- update function with as.character
clean <- function(vec) {
  values <- strsplit(as.character(vec), ",")
  flat_values <- unlist(values)
  trimmed_values <- str_trim(flat_values)
  trimmed_values
}
get_climates()

#########----- ALTERATIVE ------

get_climates <- function() {
  #planets <- read.csv2(here::here("activities/planets.csv"))
  planets <- read.csv2("C:/Users/by22/Desktop/wtf-debugging-master/planets.csv")
  unique_climate <- uniquify(planets$climate)
  unique_climate
  browser()
}
get_climates()



get_climates <- function() {
  #planets <- read.csv2(here::here("activities/planets.csv"))
  planets <- read.csv2("C:/Users/by22/Desktop/wtf-debugging-master/planets.csv", stringsAsFactors = FALSE)
  unique_climate <- uniquify(planets$climate)
  unique_climate
  #browser()
}
get_climates()


#----- alternative 2
get_climates <- function() {
  #planets <- read.csv2(here::here("activities/planets.csv"))
  planets <- read_csv2("C:/Users/by22/Desktop/wtf-debugging-master/planets.csv")
  unique_climate <- uniquify(planets$climate)
  unique_climate
  #browser()
}
get_climates()

