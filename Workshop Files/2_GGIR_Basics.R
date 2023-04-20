# Let's do the basics of running GGIR
library(GGIR)

# It's a good idea to put the key arguements into variables. It makes it easier
# to tweak the settings later.

setwd("Workshop Files") # TODO: Remove
datadir <- file.path(getwd(), "data", "GeneActiv")
outputdir <- file.path(getwd(), "output", "GGIR_Basics")
# These are from Hildebrand
lig_thresh <- 51.6
mod_thresh <- 191.6
vig_thresh <- 695.8

# This is the main GGIR call from the slides
GGIR(
  mode = c(1, 2, 3, 4, 5),
  datadir = datadir,
  outputdir = outputdir,
  # =====================
  # Part 2
  # =====================
  strategy = 2,
  maxdur = 9,
  includedaycrit = 16,
  qwindow = c(0, 24),
  qlevels = c(
    960 / 1440, # Top 8 hours
    1320 / 1440, # Top 120min
    1380 / 1440, # Top 60min
    1410 / 1440, # Top 30min
    1425 / 1440, # Top 15min
    1435 / 1440
  ), # Top 5min
  ilevels = seq(0, 4000, 50),
  iglevels = 1,
  mvpathreshold = c(mod_thresh),
  mvpadur = c(1, 5, 10),
  boutcriter = 0.8,
  # =====================
  # Part 3 + 4
  # =====================
  def.noc.sleep = 1,
  excludefirstlast = FALSE,
  includenightcrit = 16,
  # =====================
  # Part 5
  # =====================
  threshold.lig = c(lig_thresh), threshold.mod = c(mod_thresh),
  threshold.vig = c(vig_thresh),
  boutcriter.in = 0.9, boutcriter.lig = 0.8, boutcriter.mvpa = 0.8,
  boutdur.in = c(1, 10, 30), boutdur.lig = c(1, 10), boutdur.mvpa = c(1),
  includedaycrit.part5 = 16,
  timewindow = c("MM", "WW"),
  # =====================
  # Reports
  # =====================
  visualreport = TRUE,
  do.report = c(2, 4, 5)
)

GENEAread::read.bin(file.path(datadir, "201.bin"))
