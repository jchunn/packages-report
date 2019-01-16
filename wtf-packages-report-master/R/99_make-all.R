

if(!dir_exists(here("figs"))) {
  dir_create(here("figs"))
}

if(!dir_exists(here("data"))) {
  dir_create(here("data"))
}


source(here::here("R", "01_write-installed-packages.R"))
source(here::here("R", "02_wrangle-packages.R"))
source(here::here("R", "03_barchart-packages-built.R"))

#to source rmarkdown files use rmarkdown::render() function

# can also use callR function in devore package??  runs them in independent R sessions
#https://cran.r-project.org/web/packages/callr/index.html
