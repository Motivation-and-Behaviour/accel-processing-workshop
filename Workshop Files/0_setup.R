# Use the 'Source' button to run this file.
# This will do all of the setup for the workshop.

# Fetch and install required packages
if (!require("pacman")) install.packages("pacman")
pacman::p_load(googledrive, tidyverse, ggplot2)
pacman::p_install_version("GGIR", "2.9-0")

# Fetch example data files
drive_deauth()
gd_folder <-
  "https://drive.google.com/drive/folders/1JwtjMffn2ar-NuUBLuo8eu05z764CI75"
folder_id <- drive_get(as_id(gd_folder))
files <- drive_ls(folder_id)

if (basename(getwd()) == "Workshop Files") {
  base_dir <- "data"
  output_dir <- "output"
} else {
  base_dir <- "Workshop Files/data"
  output_dir <- "Workshop Files/output"
}

for (i in seq_along(files$name)) {
  # list files
  i_dir <- drive_ls(files[i, ])

  # mkdir
  dir.create(file.path(base_dir, files$name[i]))

  # download files
  for (file_i in seq_along(i_dir$name)) {
    # fails if already exists
    try({
      drive_download(
        as_id(i_dir$id[file_i]),
        path = file.path(base_dir, files$name[i], i_dir$name[file_i])
      )
    })
  }
}

# Setup an output folders
output_dirs <- c("GGIR_Basics", "GGIR_Other")

for (outdir in output_dirs) {
  dir.create(
    file.path(output_dir, outdir),
    showWarnings = FALSE, recursive = TRUE
  )
}
