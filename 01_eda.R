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


# Generate plots ---------------------------------------------------------

# Scatter plot
df_clean |>
  ggplot(aes(body_mass, flipper_len, color = sex)) +
  geom_point(shape = 21) +
  facet_wrap(~species)

ggsave("figures/scatterplot.png", width = 1700, height = 1000, units = "px")

# Histogram
df_clean |>
  pivot_longer(c(body_mass, flipper_len)) |>
  ggplot(aes(value, fill = sex)) +
  geom_histogram() +
  facet_grid(species ~ name, scales = "free")

ggsave("figures/histogram.png", width = 1500, height = 1000, units = "px")
