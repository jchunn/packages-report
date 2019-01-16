# Make clean file
# removes all output from the .R script files


here::here()

system("tree")


ls()

library(fs)
fs::dir_ls()

files_data <- fs::dir_ls(here::here("data"))
files_figs <- fs::dir_ls(here::here("figs"))



sapply(files_data,fs::file_delete())




library(fs)
libary(purr)

dirs <- c(here("data"), here("figs"))
dirs <- keep(dirs, dir_exists)
files <- map(dirs, dirs_ls) %>%  flatten_chr()
