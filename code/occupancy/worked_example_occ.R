
# Unicorn simulated occupancy data ---------------------------------------

set.seed(1905)

library(dplyr)

# Number of regions -------------------------------------------------------

n.region <- 5

# Sites per region --------------------------------------------------------

n.site <- 5

# Number of years ---------------------------------------------------------

# Years when surveying took place
survey.year <- seq(2000, 2020, by = 1)

# Total number of years
n.year <- (2020 - 1990) + 1

# Creating empty array ----------------------------------------------------

# With dimensions [Year, Site, Region]
dyn.occ <- array(0, dim = c(nrow = n.year, ncol = n.site, n.region))

# Row names are the years
rownames(dyn.occ) <- c(1990:2020) # 21 years

# Survey Covariates -------------------------------------------------------

# Skittle presence ---------------------------------------------------------

# Array with [Year, Site, Region]
skittle.pres <- array(0, dim = c(nrow = n.year, ncol = n.site, n.region))

# Replace first batch of number with years when you want skittles to be present
# E.g. 1st line has skittles from year 7 to 12, then again from 15 to 21
# Add or remove rows with the number of regions you have, changing [, , x] to region number

skittle.pres[sample(seq(from = 0, to = 21, by = 1), size = round(runif(1, 0, 21), digit = 0), replace = FALSE), , 1] <- 1
skittle.pres[sample(seq(from = 0, to = 21, by = 1), size = round(runif(1, 0, 21), digit = 0), replace = FALSE), , 2] <- 1
skittle.pres[sample(seq(from = 0, to = 21, by = 1), size = round(runif(1, 0, 21), digit = 0), replace = FALSE), , 3] <- 1
skittle.pres[sample(seq(from = 0, to = 21, by = 1), size = round(runif(1, 0, 21), digit = 0), replace = FALSE), , 4] <- 1
skittle.pres[sample(seq(from = 0, to = 21, by = 1), size = round(runif(1, 0, 21), digit = 0), replace = FALSE), , 5] <- 1

# Storing as dataframe
# Labour intensive manual process
# Name each site (here it's region_site) and store relevant matrices from array
# E.g. 1st site uses skittle.pres[all years, site 1, region 1]

skittle_df <- data.frame(
  A_1 = skittle.pres[, 1, 1],
  A_2 = skittle.pres[, 2, 1],
  A_3 = skittle.pres[, 3, 1],
  A_4 = skittle.pres[, 4, 1],
  A_5 = skittle.pres[, 5, 1],
  B_1 = skittle.pres[, 1, 2],
  B_2 = skittle.pres[, 2, 2],
  B_3 = skittle.pres[, 3, 2],
  B_4 = skittle.pres[, 4, 2],
  B_5 = skittle.pres[, 5, 2],
  C_1 = skittle.pres[, 1, 3],
  C_2 = skittle.pres[, 2, 3],
  C_3 = skittle.pres[, 3, 3],
  C_4 = skittle.pres[, 4, 3],
  C_5 = skittle.pres[, 5, 3],
  D_1 = skittle.pres[, 1, 4],
  D_2 = skittle.pres[, 2, 4],
  D_3 = skittle.pres[, 3, 4],
  D_4 = skittle.pres[, 4, 4],
  D_5 = skittle.pres[, 5, 4],
  E_1 = skittle.pres[ , 1, 5],
  E_2 = skittle.pres[ , 2, 5],
  E_3 = skittle.pres[ , 3, 5],
  E_4 = skittle.pres[ , 4, 5],
  E_5 = skittle.pres[ , 5, 5]
)

# Converting to dataframe to save as csv

skittle_df <- data.frame(t(skittle_df))

# Renaming column names to years
skittle_df <- skittle_df %>% 
  rename("2000" = X1, "2001" = X2, "2002" = X3, "2003" = X4,
         "2004" = X5, "2005" = X6, "2006" = X7, "2007" = X8,
         "2008" = X9, "2009" = X10, "2020" = X11, "2011" = X12,
         "2012" = X13, "2013" = X14, "2014" = X15, "2015" = X16,
         "2016" = X17, "2017" = X18, "2018" = X19, "2019" = X20,
         "2020" = X21
  )

# setwd("C:\\Users\\r01dr16\\Desktop\\worked_example_data\\sampling_covariates")
# write.csv(skittle_df, "skittle_presence.csv")

# Closest Fountain of Youth  ---------------------------------------------------------------

# Array with [Year, Site, Region]
foy.occ <- array(0, dim = c(nrow = n.year, ncol = n.site, n.region))

# Decreasing distance of humans over years for each region
library(emon)

site_1 <- generate.trend(nyears = n.year, mu1 = runif(1, 50, 90), change = -8)
site_2 <- generate.trend(nyears = n.year, mu1 = runif(1, 50, 90), change = -8)
site_3 <- generate.trend(nyears = n.year, mu1 = runif(1, 50, 90), change = -8)
site_4 <- generate.trend(nyears = n.year, mu1 = runif(1, 50, 90), change = -8)
site_5 <- generate.trend(nyears = n.year, mu1 = runif(1, 50, 90), change = -8)

for (i in 1:n.year) {
  foy.occ[i, , 1] <- site_1$mu[i]
  foy.occ[i, , 2] <- site_2$mu[i]
  foy.occ[i, , 3] <- site_3$mu[i]
  foy.occ[i, , 4] <- site_4$mu[i]
  foy.occ[i, , 5] <- site_5$mu[i]
}

# Storing as dataframe

foy_df <- data.frame(
  A_1 = foy.occ[ , 1, 1],
  A_2 = foy.occ[ , 2, 1],
  A_3 = foy.occ[ , 3, 1],
  A_4 = foy.occ[ , 4, 1],
  A_5 = foy.occ[ , 5, 1],
  B_1 = foy.occ[ , 1, 2],
  B_2 = foy.occ[ , 2, 2],
  B_3 = foy.occ[ , 3, 2],
  B_4 = foy.occ[ , 4, 2],
  B_5 = foy.occ[ , 5, 2],
  C_1 = foy.occ[ , 1, 3],
  C_2 = foy.occ[ , 2, 3],
  C_3 = foy.occ[ , 3, 3],
  C_4 = foy.occ[ , 4, 3],
  C_5 = foy.occ[ , 5, 3],
  D_1 = foy.occ[ , 1, 4],
  D_2 = foy.occ[ , 2, 4],
  D_3 = foy.occ[ , 3, 4],
  D_4 = foy.occ[ , 4, 4],
  D_5 = foy.occ[ , 5, 4],
  E_1 = foy.occ[ , 1, 5],
  E_2 = foy.occ[ , 2, 5],
  E_3 = foy.occ[ , 3, 5],
  E_4 = foy.occ[ , 4, 5],
  E_5 = foy.occ[ , 5, 5]
)

foy_df <- data.frame(t(foy_df))
head(foy_df)
foy_df <- foy_df %>% 
  rename("2000" = X1, "2001" = X2, "2002" = X3, "2003" = X4,
         "2004" = X5, "2005" = X6, "2006" = X7, "2007" = X8,
         "2008" = X9, "2009" = X10, "2020" = X11, "2011" = X12,
         "2012" = X13, "2013" = X14, "2014" = X15, "2015" = X16,
         "2016" = X17, "2017" = X18, "2018" = X19, "2019" = X20,
         "2020" = X21
  )

# setwd("C:\\Users\\r01dr16\\Desktop\\worked_example_data\\sampling_covariates")
# write.csv(foy_df, "nearest_fountain_of_youth.csv")

# Pollution Intensity --------------------------------------------------------

# Array with [Year, Site, Region]
pollution.occ <- array(0, dim = c(nrow = n.year, ncol = n.site, n.region))

# Cumulative pollution
site_1 <- generate.trend(nyears = n.year, mu1 = runif(1, 80, 250), change = 5)
site_2 <- generate.trend(nyears = n.year, mu1 = runif(1, 80, 250), change = 5)
site_3 <- generate.trend(nyears = n.year, mu1 = runif(1, 80, 250), change = 5)
site_4 <- generate.trend(nyears = n.year, mu1 = runif(1, 80, 250), change = 5)
site_5 <- generate.trend(nyears = n.year, mu1 = runif(1, 80, 250), change = 5)

for (i in 1:n.year) {
  pollution.occ[i, , 1] <- site_1$mu[i]
  pollution.occ[i, , 2] <- site_2$mu[i]
  pollution.occ[i, , 3] <- site_3$mu[i]
  pollution.occ[i, , 4] <- site_4$mu[i]
  pollution.occ[i, , 5] <- site_5$mu[i]
}

# Storing as dataframe

pollution_df <- data.frame(
  A_1 = pollution.occ[ , 1, 1],
  A_2 = pollution.occ[ , 2, 1],
  A_3 = pollution.occ[ , 3, 1],
  A_4 = pollution.occ[ , 4, 1],
  A_5 = pollution.occ[ , 5, 1],
  B_1 = pollution.occ[ , 1, 2],
  B_2 = pollution.occ[ , 2, 2],
  B_3 = pollution.occ[ , 3, 2],
  B_4 = pollution.occ[ , 4, 2],
  B_5 = pollution.occ[ , 5, 2],
  C_1 = pollution.occ[ , 1, 3],
  C_2 = pollution.occ[ , 2, 3],
  C_3 = pollution.occ[ , 3, 3],
  C_4 = pollution.occ[ , 4, 3],
  C_5 = pollution.occ[ , 5, 3],
  D_1 = pollution.occ[ , 1, 4],
  D_2 = pollution.occ[ , 2, 4],
  D_3 = pollution.occ[ , 3, 4],
  D_4 = pollution.occ[ , 4, 4],
  D_5 = pollution.occ[ , 5, 4],
  E_1 = pollution.occ[ , 1, 5],
  E_2 = pollution.occ[ , 2, 5],
  E_3 = pollution.occ[ , 3, 5],
  E_4 = pollution.occ[ , 4, 5],
  E_5 = pollution.occ[ , 5, 5]
)

pollution_df <- data.frame(t(pollution_df))
pollution_df <- pollution_df %>% 
  rename("2000" = X1, "2001" = X2, "2002" = X3, "2003" = X4,
         "2004" = X5, "2005" = X6, "2006" = X7, "2007" = X8,
         "2008" = X9, "2009" = X10, "2020" = X11, "2011" = X12,
         "2012" = X13, "2013" = X14, "2014" = X15, "2015" = X16,
         "2016" = X17, "2017" = X18, "2018" = X19, "2019" = X20,
         "2020" = X21
  )
head(pollution_df)

# setwd("C:\\Users\\r01dr16\\Desktop\\worked_example_data\\sampling_covariates")
# write.csv(pollution_df, "pollution.csv")

# Site covariates ---------------------------------------------------------

# Werewolf presence -----------------------------------------------------

# Array with [Year, Site, Region]
werewolf.pres <- array(0, dim = c(nrow = n.year, ncol = n.site, n.region))

# Random sites where werewolf is present
id.werewolf.1 <- sample(c(1:n.site), round(runif(1, 0, 5), digit = 0))
id.werewolf.2 <- sample(c(1:n.site), round(runif(1, 0, 5), digit = 0))
id.werewolf.3 <- sample(c(1:n.site), round(runif(1, 0, 5), digit = 0))
id.werewolf.4 <- sample(c(1:n.site), round(runif(1, 0, 5), digit = 0))
id.werewolf.5 <- sample(c(1:n.site), round(runif(1, 0, 5), digit = 0))

# Including werewolf presence in those random sites
werewolf.pres[ , id.werewolf.1, 1] <- 1
werewolf.pres[ , id.werewolf.2, 2] <- 1
werewolf.pres[ , id.werewolf.3, 3] <- 1
werewolf.pres[ , id.werewolf.4, 4] <- 1
werewolf.pres[ , id.werewolf.5, 5] <- 1

# Storing as dataframe

werewolf_df <- data.frame(
  A_1 = werewolf.pres[1, 1, 1],
  A_2 = werewolf.pres[1, 2, 1],
  A_3 = werewolf.pres[1, 3, 1],
  A_4 = werewolf.pres[1, 4, 1],
  A_5 = werewolf.pres[1, 5, 1],
  B_1 = werewolf.pres[1, 1, 2],
  B_2 = werewolf.pres[1, 2, 2],
  B_3 = werewolf.pres[1, 3, 2],
  B_4 = werewolf.pres[1, 4, 2],
  B_5 = werewolf.pres[1, 5, 2],
  C_1 = werewolf.pres[1, 1, 3],
  C_2 = werewolf.pres[1, 2, 3],
  C_3 = werewolf.pres[1, 3, 3],
  C_4 = werewolf.pres[1, 4, 3],
  C_5 = werewolf.pres[1, 5, 3],
  D_1 = werewolf.pres[1, 1, 4],
  D_2 = werewolf.pres[1, 2, 4],
  D_3 = werewolf.pres[1, 3, 4],
  D_4 = werewolf.pres[1, 4, 4],
  D_5 = werewolf.pres[1, 5, 4],
  E_1 = werewolf.pres[1, 1, 5],
  E_2 = werewolf.pres[1, 2, 5],
  E_3 = werewolf.pres[1, 3, 5],
  E_4 = werewolf.pres[1, 4, 5],
  E_5 = werewolf.pres[1, 5, 5]
)

werewolf_df <- data.frame(t(werewolf_df))
werewolf_df <- werewolf_df %>% 
  rename("werewolves" = t.werewolf_df.
  )

# Forest area -------------------------------------------------------------

# Array with [Year, Site, Region]
forest.area <- array(0, dim = c(nrow = n.year, ncol = n.site, n.region))

# Random number for forest area in each of 7 regions
site1 <- round(runif(1, 2, 100), digits = 1)
site2 <- round(runif(1, 2, 100), digits = 1)
site3 <- round(runif(1, 2, 100), digits = 1)
site4 <- round(runif(1, 2, 100), digits = 1)
site5 <- round(runif(1, 2, 100), digits = 1)

for (i in 1:n.year) {
  forest.area[i, , 1] <- site1
  forest.area[i, , 2] <- site2
  forest.area[i, , 3] <- site3
  forest.area[i, , 4] <- site4
  forest.area[i, , 5] <- site5
}

# Storing as dataframe

forest_area_df <- data.frame(
  A_1 = forest.area[1, 1, 1],
  A_2 = forest.area[1, 2, 1],
  A_3 = forest.area[1, 3, 1],
  A_4 = forest.area[1, 4, 1],
  A_5 = forest.area[1, 5, 1],
  B_1 = forest.area[1, 1, 2],
  B_2 = forest.area[1, 2, 2],
  B_3 = forest.area[1, 3, 2],
  B_4 = forest.area[1, 4, 2],
  B_5 = forest.area[1, 5, 2],
  C_1 = forest.area[1, 1, 3],
  C_2 = forest.area[1, 2, 3],
  C_3 = forest.area[1, 3, 3],
  C_4 = forest.area[1, 4, 3],
  C_5 = forest.area[1, 5, 3],
  D_1 = forest.area[1, 1, 4],
  D_2 = forest.area[1, 2, 4],
  D_3 = forest.area[1, 3, 4],
  D_4 = forest.area[1, 4, 4],
  D_5 = forest.area[1, 5, 4],
  E_1 = forest.area[1, 1, 5],
  E_2 = forest.area[1, 2, 5],
  E_3 = forest.area[1, 3, 5],
  E_4 = forest.area[1, 4, 5],
  E_5 = forest.area[1, 5, 5]
)

forest_area_df <- data.frame(t(forest_area_df))
forest_area_df <- forest_area_df %>% 
  rename("Forest Area" = t.forest_area_df.
  )

# Rainfall (mm) -----------------------------------------------------------

# Array with [Year, Site, Region]
rain <- array(0, dim = c(nrow = n.year, ncol = n.site, n.region))

# Rainfall for each region
site1 <- round(runif(n.site, 0, 100), digits = 1)
site2 <- round(runif(n.site, 0, 100), digits = 1)
site3 <- round(runif(n.site, 0, 100), digits = 1)
site4 <- round(runif(n.site, 0, 100), digits = 1)
site5 <- round(runif(n.site, 0, 100), digits = 1)

for (i in 1:n.year) {
  rain[i, , 1] <- site1
  rain[i, , 2] <- site2
  rain[i, , 3] <- site3
  rain[i, , 4] <- site4
  rain[i, , 5] <- site5
}

# Storing as dataframe

rain_df <- data.frame(
  A_1 = rain[1, 1, 1],
  A_2 = rain[1, 2, 1],
  A_3 = rain[1, 3, 1],
  A_4 = rain[1, 4, 1],
  A_5 = rain[1, 5, 1],
  B_1 = rain[1, 1, 2],
  B_2 = rain[1, 2, 2],
  B_3 = rain[1, 3, 2],
  B_4 = rain[1, 4, 2],
  B_5 = rain[1, 5, 2],
  C_1 = rain[1, 1, 3],
  C_2 = rain[1, 2, 3],
  C_3 = rain[1, 3, 3],
  C_4 = rain[1, 4, 3],
  C_5 = rain[1, 5, 3],
  D_1 = rain[1, 1, 4],
  D_2 = rain[1, 2, 4],
  D_3 = rain[1, 3, 4],
  D_4 = rain[1, 4, 4],
  D_5 = rain[1, 5, 4],
  E_1 = rain[1, 1, 5],
  E_2 = rain[1, 2, 5],
  E_3 = rain[1, 3, 5],
  E_4 = rain[1, 4, 5],
  E_5 = rain[1, 5, 5]
)

rain_df <- data.frame(t(rain_df))
rain_df <- rain_df %>% 
  rename("Rain (mm)" = t.rain_df.
  )

# Storing all site covariates in single csv -------------------------------

site_covar <- data.frame(
  "Site" = row.names(werewolf_df), 
  "werewolf Presence" = werewolf_df$werewolves, 
  "Forest Area (km2)" = forest_area_df$`Forest Area`,
  "Rain (mm)" = rain_df$`Rain (mm)`
)

setwd("C:\\Users\\r01dr16\\Desktop\\worked_example_data\\site_covariates")
write.csv(site_covar, "Site Covariates.csv", row.names = FALSE)

# Simulation --------------------------------------------------------------

# Initial occupancy -------------------------------------------------------

# Equation: Initial occupancy = -2.5 + 0.25 foy
init.occ <- plogis(1.8 - 0.02 * foy.occ[1, , ])

# Give high initial occupancy in most regions and sites

# Use probability and draw from binomial distribution to determine presence/absence
dyn.occ[1, , ] <- rbinom(length(init.occ), size = 1, prob = init.occ)


# Dynamics ----------------------------------------------------------------

# Occupancy in subsequent years
for (t in 2:n.year) {
  
  # Probability of colonization ---------------------------------------------
  # P_Col = -2 + 0.5 * skittle + 0.01 * Forest
  p.col <- plogis(-2 + 0.5 * skittle.pres[t, , ] + 0.01 * forest.area[t, , ])
  
  # Probability of extinction -----------------------------------------------
  # P_Ext = -0.5 + 2 * pollutioners + 0.25 * werewolf
  p.ext <- plogis(-3 + 0.01 * pollution.occ[t, , ] + 0.25 * werewolf.pres[t, , ])
  
  # Probability of presence -------------------------------------------------
  # If previously unoccupied, then colonisaiton probability, otherwise extinction probability
  p.pres <- ifelse(dyn.occ[t - 1, , ] == 0, p.col, 1 - p.ext)
  
  # Presence in subsequent years -------------------------------------------
  # Use probability of presence to determine presence/absence in current year
  dyn.occ[t, , ] <- rbinom(length(p.pres), size = 1, prob = p.pres)
}


### Plotting

par(mfrow = c(2, 3))

library(ggplot2)

site_a <- data.frame(
  years = 1990:2020,
  site_1 = dyn.occ[, 1, 1],
  site_2 = dyn.occ[, 2, 1],
  site_3 = dyn.occ[, 3, 1],
  site_4 = dyn.occ[, 4, 1],
  site_5 = dyn.occ[, 5, 1],
  occ_mean = rowMeans(site_a[,2:6])
)

a <- ggplot(site_a) +
  geom_jitter(aes(x = years, y = site_1), height = 0.05, width = 0, colour = "firebrick4") + 
  geom_jitter(aes(x = years, y = site_2), height = 0.05, width = 0, colour = "blue") + 
  geom_jitter(aes(x = years, y = site_3), height = 0.05, width = 0, colour = "steelblue") + 
  geom_jitter(aes(x = years, y = site_4), height = 0.05, width = 0, colour = "magenta4") + 
  geom_jitter(aes(x = years, y = site_5), height = 0.05, width = 0, colour = "purple") +
  geom_line(aes(x = years, y = occ_mean), size = 1.25) +
  labs(x = " ", y = "Proportion Occupied", title = "Average occupancy of all sites in Region A") +
  theme_classic()

site_b <- data.frame(
  years = 1990:2020,
  site_1 = dyn.occ[, 1, 2],
  site_2 = dyn.occ[, 2, 2],
  site_3 = dyn.occ[, 3, 2],
  site_4 = dyn.occ[, 4, 2],
  site_5 = dyn.occ[, 5, 2]
)
site_b$occ_mean <- rowMeans(site_b[,2:6])

b <- ggplot(site_b) +
  geom_jitter(aes(x = years, y = site_1), height = 0.05, width = 0, colour = "firebrick4") + 
  geom_jitter(aes(x = years, y = site_2), height = 0.05, width = 0, colour = "blue") + 
  geom_jitter(aes(x = years, y = site_3), height = 0.05, width = 0, colour = "steelblue") + 
  geom_jitter(aes(x = years, y = site_4), height = 0.05, width = 0, colour = "magenta4") + 
  geom_jitter(aes(x = years, y = site_5), height = 0.05, width = 0, colour = "purple") +
  geom_line(aes(x = years, y = occ_mean), size = 1.25) +
  labs(x = " ", y = " ", title = "Average occupancy of all sites in Region B") +
  theme_classic()

site_c <- data.frame(
  years = 1990:2020,
  site_1 = dyn.occ[, 1, 3],
  site_2 = dyn.occ[, 2, 3],
  site_3 = dyn.occ[, 3, 3],
  site_4 = dyn.occ[, 4, 3],
  site_5 = dyn.occ[, 5, 3]
)
site_c$occ_mean <- rowMeans(site_c[,2:6])

c <- ggplot(site_c) +
  geom_jitter(aes(x = years, y = site_1), height = 0.05, width = 0, colour = "firebrick4") + 
  geom_jitter(aes(x = years, y = site_2), height = 0.05, width = 0, colour = "blue") + 
  geom_jitter(aes(x = years, y = site_3), height = 0.05, width = 0, colour = "steelblue") + 
  geom_jitter(aes(x = years, y = site_4), height = 0.05, width = 0, colour = "magenta4") + 
  geom_jitter(aes(x = years, y = site_5), height = 0.05, width = 0, colour = "purple") +
  geom_line(aes(x = years, y = occ_mean), size = 1.25) +
  labs(x = " ", y = "Proportion Occupied", title = "Average occupancy of all sites in Region C") +
  theme_classic()

site_d <- data.frame(
  years = 1990:2020,
  site_1 = dyn.occ[, 1, 4],
  site_2 = dyn.occ[, 2, 4],
  site_3 = dyn.occ[, 3, 4],
  site_4 = dyn.occ[, 4, 4],
  site_5 = dyn.occ[, 5, 4]
)
site_d$occ_mean <- rowMeans(site_d[,2:6])

d <- ggplot(site_d) +
  geom_jitter(aes(x = years, y = site_1), height = 0.05, width = 0, colour = "firebrick4") + 
  geom_jitter(aes(x = years, y = site_2), height = 0.05, width = 0, colour = "blue") + 
  geom_jitter(aes(x = years, y = site_3), height = 0.05, width = 0, colour = "steelblue") + 
  geom_jitter(aes(x = years, y = site_4), height = 0.05, width = 0, colour = "magenta4") + 
  geom_jitter(aes(x = years, y = site_5), height = 0.05, width = 0, colour = "purple") +
  geom_line(aes(x = years, y = occ_mean), size = 1.25) +
  labs(x = " ", y = " ", title = "Average occupancy of all sites in Region D") +
  theme_classic()

site_e <- data.frame(
  years = 1990:2020,
  site_1 = dyn.occ[, 1, 5],
  site_2 = dyn.occ[, 2, 5],
  site_3 = dyn.occ[, 3, 5],
  site_4 = dyn.occ[, 4, 5],
  site_5 = dyn.occ[, 5, 5]
)
site_e$occ_mean <- rowMeans(site_e[,2:6])

e <- ggplot(site_e) +
  geom_jitter(aes(x = years, y = site_1), height = 0.05, width = 0, colour = "firebrick4") + 
  geom_jitter(aes(x = years, y = site_2), height = 0.05, width = 0, colour = "blue") + 
  geom_jitter(aes(x = years, y = site_3), height = 0.05, width = 0, colour = "steelblue") + 
  geom_jitter(aes(x = years, y = site_4), height = 0.05, width = 0, colour = "magenta4") + 
  geom_jitter(aes(x = years, y = site_5), height = 0.05, width = 0, colour = "purple") +
  geom_line(aes(x = years, y = occ_mean), size = 1.25) +
  labs(x = "Year", y = "Proportion Occupied", title = "Average occupancy of all sites in Region E") +
  theme_classic()

library(patchwork)

(a + b) /
  (c + d) /
  e

b

det_b

b + det_b

# Detection simulation ----------------------------------------------------

# When surveys occured out of all years
## Set to survey every 2 years
survey.times <- seq(1, 21, by = 1)

# Extract occupancies for survey times
occ.surv <- dyn.occ[survey.times, , ]

# Simulating detection ----------------------------------------------------

p.det <- array(0, dim = c(nrow = length(survey.times), ncol = n.site, n.region))

# Detection probability is 0 + 0.01 * rainfall

for (i in 1:length(survey.times)) {
  p.det[i, , 1] <- plogis(2 - 0.01 * rain[i, , 1])
  p.det[i, , 2] <- plogis(2 - 0.01 * rain[i, , 2])
  p.det[i, , 3] <- plogis(2 - 0.01 * rain[i, , 3])
  p.det[i, , 4] <- plogis(2 - 0.01 * rain[i, , 4])
  p.det[i, , 5] <- plogis(2 - 0.01 * rain[i, , 5])
}

# Detection range
range(c(unlist(p.det)))

# Number of surveys per site in each region in each year
n.rep <- 3

# Array with [Sampling year, Site, Region]
det <- array(0, dim = c(nrow = length(survey.times) * n.rep, ncol = n.site, n.region))

for (i in 1:n.site) {
  det[, i, 1] <- rbinom(length(survey.times) * n.rep, 1, rep(p.det[, i, 1], each = n.rep) * rep(occ.surv[, i, 1], each = n.rep))
  det[, i, 2] <- rbinom(length(survey.times) * n.rep, 1, rep(p.det[, i, 2], each = n.rep) * rep(occ.surv[, i, 2], each = n.rep))
  det[, i, 3] <- rbinom(length(survey.times) * n.rep, 1, rep(p.det[, i, 3], each = n.rep) * rep(occ.surv[, i, 3], each = n.rep))
  det[, i, 4] <- rbinom(length(survey.times) * n.rep, 1, rep(p.det[, i, 4], each = n.rep) * rep(occ.surv[, i, 4], each = n.rep))
  det[, i, 5] <- rbinom(length(survey.times) * n.rep, 1, rep(p.det[, i, 5], each = n.rep) * rep(occ.surv[, i, 5], each = n.rep))
}

# Years when sampling occured as row names
rownames(det) <- rep(survey.year, each = n.rep)

# Region names
colnames(det[, , 1]) <- rep("A", 5)
colnames(det[, , 2]) <- rep("B", 5)
colnames(det[, , 3]) <- rep("C", 5)
colnames(det[, , 1]) <- rep("D", 5)
colnames(det[, , 2]) <- rep("E", 5)

### Plotting

det_a <- data.frame(
  years = rep(survey.year, each = n.rep),
  site_1 = det[, 1, 1],
  site_2 = det[, 2, 1],
  site_3 = det[, 3, 1],
  site_4 = det[, 4, 1],
  site_5 = det[, 5, 1]
)
det_a$det_mean = rowMeans(det_a[,2:6])

det_a <- ggplot(det_a) +
  geom_jitter(aes(x = years, y = site_1), height = 0.05, width = 0, colour = "firebrick4") + 
  geom_jitter(aes(x = years, y = site_2), height = 0.05, width = 0, colour = "blue") + 
  geom_jitter(aes(x = years, y = site_3), height = 0.05, width = 0, colour = "steelblue") + 
  geom_jitter(aes(x = years, y = site_4), height = 0.05, width = 0, colour = "magenta4") + 
  geom_jitter(aes(x = years, y = site_5), height = 0.05, width = 0, colour = "purple") +
  geom_line(aes(x = years, y = det_mean), size = 1.25) +
  labs(x = " ", y = "Proportion Detected", title = "Average detection of all sites in Region A") +
  theme_classic()

det_b <- data.frame(
  years = rep(survey.year, each = n.rep),
  site_1 = det[, 1, 2],
  site_2 = det[, 2, 2],
  site_3 = det[, 3, 2],
  site_4 = det[, 4, 2],
  site_5 = det[, 5, 2]
)
det_b$det_mean = rowMeans(det_b[,2:6])

det_b <- ggplot(det_b) +
  geom_jitter(aes(x = years, y = site_1), height = 0.05, width = 0, colour = "firebrick4") + 
  geom_jitter(aes(x = years, y = site_2), height = 0.05, width = 0, colour = "blue") + 
  geom_jitter(aes(x = years, y = site_3), height = 0.05, width = 0, colour = "steelblue") + 
  geom_jitter(aes(x = years, y = site_4), height = 0.05, width = 0, colour = "magenta4") + 
  geom_jitter(aes(x = years, y = site_5), height = 0.05, width = 0, colour = "purple") +
  geom_line(aes(x = years, y = det_mean), size = 1.25) +
  labs(x = " ", y = "", title = "Average detection of all sites in Region B") +
  theme_classic()

det_c <- data.frame(
  years = rep(survey.year, each = n.rep),
  site_1 = det[, 1, 3],
  site_2 = det[, 2, 3],
  site_3 = det[, 3, 3],
  site_4 = det[, 4, 3],
  site_5 = det[, 5, 3]
)
det_c$det_mean = rowMeans(det_c[,2:6])

det_c <- ggplot(det_c) +
  geom_jitter(aes(x = years, y = site_1), height = 0.05, width = 0, colour = "firebrick4") + 
  geom_jitter(aes(x = years, y = site_2), height = 0.05, width = 0, colour = "blue") + 
  geom_jitter(aes(x = years, y = site_3), height = 0.05, width = 0, colour = "steelblue") + 
  geom_jitter(aes(x = years, y = site_4), height = 0.05, width = 0, colour = "magenta4") + 
  geom_jitter(aes(x = years, y = site_5), height = 0.05, width = 0, colour = "purple") +
  geom_line(aes(x = years, y = det_mean), size = 1.25) +
  labs(x = " ", y = "Proportion Detected", title = "Average detection of all sites in Region C") +
  theme_classic()

det_d <- data.frame(
  years = rep(survey.year, each = n.rep),
  site_1 = det[, 1, 4],
  site_2 = det[, 2, 4],
  site_3 = det[, 3, 4],
  site_4 = det[, 4, 4],
  site_5 = det[, 5, 4]
)
det_d$det_mean = rowMeans(det_d[,2:6])

det_d <- ggplot(det_d) +
  geom_jitter(aes(x = years, y = site_1), height = 0.05, width = 0, colour = "firebrick4") + 
  geom_jitter(aes(x = years, y = site_2), height = 0.05, width = 0, colour = "blue") + 
  geom_jitter(aes(x = years, y = site_3), height = 0.05, width = 0, colour = "steelblue") + 
  geom_jitter(aes(x = years, y = site_4), height = 0.05, width = 0, colour = "magenta4") + 
  geom_jitter(aes(x = years, y = site_5), height = 0.05, width = 0, colour = "purple") +
  geom_line(aes(x = years, y = det_mean), size = 1.25) +
  labs(x = " ", y = "", title = "Average detection of all sites in Region D") +
  theme_classic()

det_e <- data.frame(
  years = rep(survey.year, each = n.rep),
  site_1 = det[, 1, 5],
  site_2 = det[, 2, 5],
  site_3 = det[, 3, 5],
  site_4 = det[, 4, 5],
  site_5 = det[, 5, 5]
)
det_e$det_mean = rowMeans(det_e[,2:6])

det_e <- ggplot(det_e) +
  geom_jitter(aes(x = years, y = site_1), height = 0.05, width = 0, colour = "firebrick4") + 
  geom_jitter(aes(x = years, y = site_2), height = 0.05, width = 0, colour = "blue") + 
  geom_jitter(aes(x = years, y = site_3), height = 0.05, width = 0, colour = "steelblue") + 
  geom_jitter(aes(x = years, y = site_4), height = 0.05, width = 0, colour = "magenta4") + 
  geom_jitter(aes(x = years, y = site_5), height = 0.05, width = 0, colour = "purple") +
  geom_line(aes(x = years, y = det_mean), size = 1.25) +
  labs(x = "Year", y = "Proportion Detected", title = "Average detection of all sites in Region E") +
  theme_classic()

library(patchwork)

(det_a + det_b) /
  (det_c + det_d) /
  det_e

(det_a + a) /
  (det_b + b) /
  (det_c + c) /
  (det_d + d) /
  (det_e + e)

# Exporting ---------------------------------------------------------------

# A -----------------------------------------------------------------

library(dplyr)

det_A <- as.data.frame(det[, , 1])
det_A <- det_A %>% 
  rename(A_1 = V1,
         A_2 = V2,
         A_3 = V3,
         A_4 = V4,
         A_5 = V5)

det_A2 <- data.frame(t(det_A))

# B ------------------------------------------------------------------

det_B <- as.data.frame(det[, , 2])
det_B <- det_B %>% 
  rename(B_1 = V1,
         B_2 = V2,
         B_3 = V3,
         B_4 = V4,
         B_5 = V5)

det_B2 <- data.frame(t(det_B))

# C ------------------------------------------------------------

det_C <- as.data.frame(det[, , 3])
det_C <- det_C %>% 
  rename(C_1 = V1,
         C_2 = V2,
         C_3 = V3,
         C_4 = V4,
         C_5 = V5)

det_C2 <- data.frame(t(det_C))

# D -----------------------------------------------------------------

det_D <- as.data.frame(det[, , 4])
det_D <- det_D %>% 
  rename(D_1 = V1,
         D_2 = V2,
         D_3 = V3,
         D_4 = V4,
         D_5 = V5)

det_D2 <- data.frame(t(det_D))

# E ---------------------------------------------------------------

det_E <- as.data.frame(det[, , 5])
det_E <- det_E %>% 
  rename(E_1 = V1,
         E_2 = V2,
         E_3 = V3,
         E_4 = V4,
         E_5 = V5)

det_E2 <- data.frame(t(det_E))


# Combining ---------------------------------------------------------------

detection_history <- rbind(det_A2, det_B2, det_C2, det_D2, det_E2)

setwd("C:\\Users\\r01dr16\\Desktop\\worked_example_data\\detection_history")
write.csv(detection_history, "Unicorn Detection History.csv", row.names = TRUE)








