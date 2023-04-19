create_accel_plot <- function() {
  require(dplyr)
  require(tidyr)
  require(ggplot2)
  accel_path <- "Workshop Files/data/gt3x/101.gt3x"

  df <- read.gt3x::read.gt3x(accel_path, asDataFrame = TRUE)

  df_long <- df %>%
    slice(which(row_number() %% 100 == 1)) %>%
    gather(axis, value, X:Z)

  accel_plot <-
    ggplot(df_long, aes(x = time, y = value, color = axis)) +
    geom_line(alpha = 0.5) +
    theme_void() +
    theme(legend.position = "none")

  ggsave("imgs/Accel_Plot.png", accel_plot, height = 3.5)
}
