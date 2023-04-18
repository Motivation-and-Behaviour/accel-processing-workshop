create_data <- function(n = 100) {
  df <- dplyr::tibble(
    id = 1:n,
    age = sample(8:12, n, replace = TRUE),
    sex = sample(c("male", "female"), n, replace = TRUE),
    bmi = 12.25 + (age * 0.62) + if_else(sex == "male", -.1, 0) + rnorm(n, 0, 0.75)
  )

  readr::write_csv(df, "Workshop Files/data/mock_data.csv")
}
