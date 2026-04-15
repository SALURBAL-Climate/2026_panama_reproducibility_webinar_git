library(tidyverse)
set_theme(theme_bw())

# Load data --------------------------------------------------------------
df <- read_csv("data/penguins.csv")

# View variables
glimpse(df)

# Check count of NA observations
df |>
  summarize(across(everything(), \(x) sum(is.na(x))))

# Remove NA observations
df_clean <- df |>
  filter_out(if_any(everything(), is.na))

# Save clean data
write_csv(df_clean, "data/penguins_clean.csv")

