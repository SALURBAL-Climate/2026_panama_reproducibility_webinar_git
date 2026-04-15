library(tidyverse)


# Load data --------------------------------------------------------------
df <- read_csv("data/penguins_clean.csv")


# Basic modelling --------------------------------------------------------

fit1 <- lm(flipper_len ~ body_mass, data = df)

summary(fit1)

saveRDS(fit1, "models/penguins_fit1.rds")
