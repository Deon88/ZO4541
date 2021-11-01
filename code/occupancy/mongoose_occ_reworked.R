
# Mongoose simulated occupancy data ---------------------------------------

set.seed(2020)

library(dplyr)

# Number of regions -------------------------------------------------------

n.region <- 7

# Sites per region --------------------------------------------------------

n.site <- 5

# Number of years ---------------------------------------------------------

# Years when surveying took place
survey.year <- seq(1999, 2019, by = 1)

# Total number of years
n.year <- (2019 - 1999) + 1

# Creating empty array ----------------------------------------------------

# With dimensions [Year, Site, Region]
dyn.occ <- array(0, dim = c(nrow = n.year, ncol = n.site, n.region))

# Row names are the years
rownames(dyn.occ) <- c(1999:2019) # 20 years

# Survey Covariates -------------------------------------------------------

# Rabbit presence ---------------------------------------------------------

# Array with [Year, Site, Region]
rabbit.pres <- array(0, dim = c(nrow = n.year, ncol = n.site, n.region))

# Replace first batch of number with years when you want rabbits to be present
# E.g. 1st line has rabbits from year 7 to 12, then again from 15 to 21
# Add or remove rows with the number of regions you have, changing [, , x] to region number

rabbit.pres[c(7:12, 15:21), , 1]    <- 1           # Present in years 7:12 and 15:21
rabbit.pres[c(1:5, 17:21), , 2]     <- 1           # Present in years 1:5 and 17:21
rabbit.pres[c(1:7, 19:20), , 3]     <- 1           # Present in years 1:7 and 19:20
rabbit.pres[c(1:13, 21), , 4]       <- 1           # Present in years 1:13 and 21
rabbit.pres[1:11, , 5]              <- 1           # Present in years 1:11
rabbit.pres[c(1, 3:12, 19:21), , 6] <- 1           # Present in years 1,3:12 and 19:21
rabbit.pres[1:15, , 7]              <- 1           # Present in years 1:15

# Storing as dataframe
  # Labour intensive manual process
  # Name each site (here it's region_site) and store relevant matrices from array
  # E.g. 1st site uses rabbit.pres[all years, site 1, region 1]

rabbit_df <- data.frame(
  Edateku_1 = rabbit.pres[, 1, 1],
  Edateku_2 = rabbit.pres[, 2, 1],
  Edateku_3 = rabbit.pres[, 3, 1],
  Edateku_4 = rabbit.pres[, 4, 1],
  Edateku_5 = rabbit.pres[, 5, 1],
  
  Oshima_1 = rabbit.pres[, 1, 2],
  Oshima_2 = rabbit.pres[, 2, 2],
  Oshima_3 = rabbit.pres[, 3, 2],
  Oshima_4 = rabbit.pres[, 4, 2],
  Oshima_5 = rabbit.pres[, 5, 2],
  
  Kakeromajima_1 = rabbit.pres[, 1, 3],
  Kakeromajima_2 = rabbit.pres[, 2, 3],
  Kakeromajima_3 = rabbit.pres[, 3, 3],
  Kakeromajima_4 = rabbit.pres[, 4, 3],
  Kakeromajima_5 = rabbit.pres[, 5, 3],
  
  Ukejima_1 = rabbit.pres[, 1, 4],
  Ukejima_2 = rabbit.pres[, 2, 4],
  Ukejima_3 = rabbit.pres[, 3, 4],
  Ukejima_4 = rabbit.pres[, 4, 4],
  Ukejima_5 = rabbit.pres[, 5, 4],
  
  Yoroshima_1 = rabbit.pres[ , 1, 5],
  Yoroshima_2 = rabbit.pres[ , 2, 5],
  Yoroshima_3 = rabbit.pres[ , 3, 5],
  Yoroshima_4 = rabbit.pres[ , 4, 5],
  Yoroshima_5 = rabbit.pres[ , 5, 5],
  
  Tatsugo_1 = rabbit.pres[ , 1, 6],
  Tatsugo_2 = rabbit.pres[ , 2, 6],
  Tatsugo_3 = rabbit.pres[ , 3, 6],
  Tatsugo_4 = rabbit.pres[ , 4, 6],
  Tatsugo_5 = rabbit.pres[ , 5, 6],
  
  Kikai_1 = rabbit.pres[ , 1, 7],
  Kikai_2 = rabbit.pres[ , 2, 7],
  Kikai_3 = rabbit.pres[ , 3, 7],
  Kikai_4 = rabbit.pres[ , 4, 7],
  Kikai_5 = rabbit.pres[ , 5, 7]
)

# Converting to dataframe to save as csv

rabbit_df <- data.frame(t(rabbit_df))

# Renaming column names to years
rabbit_df <- rabbit_df %>% 
  rename("1999" = X1, "2000" = X2, "2001" = X3, "2002" = X4,
         "2003" = X5, "2004" = X6, "2005" = X7, "2006" = X8,
         "2007" = X9, "2008" = X10, "2009" = X11, "2010" = X12,
         "2011" = X13, "2012" = X14, "2013" = X15, "2014" = X16,
         "2015" = X17, "2016" = X18, "2017" = X19, "2018" = X20,
         "2019" = X21
  )
rabbit_df <- data.frame(
  "1999_1" = rabbit_df$"1999",
  "1999_2" = rabbit_df$"1999",
  "1999_3" = rabbit_df$"1999",
  
  "2000_1" = rabbit_df$"2000",
  "2000_2" = rabbit_df$"2000",
  "2000_3" = rabbit_df$"2000",
  
  "2001_1" = rabbit_df$"2001",
  "2001_2" = rabbit_df$"2001",
  "2001_3" = rabbit_df$"2001",
  
  "2002_1" = rabbit_df$"2002",
  "2002_2" = rabbit_df$"2002",
  "2002_3" = rabbit_df$"2002",
  
  "2003_1" = rabbit_df$"2003",
  "2003_2" = rabbit_df$"2003",
  "2003_3" = rabbit_df$"2003",
  
  "2004_1" = rabbit_df$"2004",
  "2004_2" = rabbit_df$"2004",
  "2004_3" = rabbit_df$"2004",
  
  "2005_1" = rabbit_df$"2005",
  "2005_2" = rabbit_df$"2005",
  "2005_3" = rabbit_df$"2005",
  
  "2006_1" = rabbit_df$"2006",
  "2006_2" = rabbit_df$"2006",
  "2006_3" = rabbit_df$"2006",
  
  "2007_1" = rabbit_df$"2007",
  "2007_2" = rabbit_df$"2007",
  "2007_3" = rabbit_df$"2007",
  
  "2008_1" = rabbit_df$"2008",
  "2008_2" = rabbit_df$"2008",
  "2008_3" = rabbit_df$"2008",
  
  "2009_1" = rabbit_df$"2009",
  "2009_2" = rabbit_df$"2009",
  "2009_3" = rabbit_df$"2009",
  
  "2010_1" = rabbit_df$"2010",
  "2010_2" = rabbit_df$"2010",
  "2010_3" = rabbit_df$"2010",
  
  "2011_1" = rabbit_df$"2011",
  "2011_2" = rabbit_df$"2011",
  "2011_3" = rabbit_df$"2011",
  
  "2012_1" = rabbit_df$"2012",
  "2012_2" = rabbit_df$"2012",
  "2012_3" = rabbit_df$"2012",
  
  "2013_1" = rabbit_df$"2013",
  "2013_2" = rabbit_df$"2013",
  "2013_3" = rabbit_df$"2013",
  
  "2014_1" = rabbit_df$"2014",
  "2014_2" = rabbit_df$"2014",
  "2014_3" = rabbit_df$"2014",
  
  "2015_1" = rabbit_df$"2015",
  "2015_2" = rabbit_df$"2015",
  "2015_3" = rabbit_df$"2015",
  
  "2016_1" = rabbit_df$"2016",
  "2016_2" = rabbit_df$"2016",
  "2016_3" = rabbit_df$"2016",
  
  "2017_1" = rabbit_df$"2017",
  "2017_2" = rabbit_df$"2017",
  "2017_3" = rabbit_df$"2017",
  
  "2018_1" = rabbit_df$"2018",
  "2018_2" = rabbit_df$"2018",
  "2018_3" = rabbit_df$"2018",

  "2019_1" = rabbit_df$"2019",
  "2019_2" = rabbit_df$"2019",
  "2019_3" = rabbit_df$"2019"
)
names(rabbit_df) <- sub("^X", "", names(rabbit_df))
names(rabbit_df)
# setwd("C:\\Users\\deonr\\Desktop\\ZO4541\\Practicals\\simulated data\\occupancy")
# write.csv(rabbit_df, "Rabbit_presence_new_wednesday.csv")

# Human Distance ---------------------------------------------------------------

# Array with [Year, Site, Region]
hd.occ <- array(0, dim = c(nrow = n.year, ncol = n.site, n.region))

# Decreasing distance of humans over years for each region
library(emon)

site_1 <- generate.trend(nyears = n.year, mu1 = runif(1, 8, 20), change = -8)
site_2 <- generate.trend(nyears = n.year, mu1 = runif(1, 8, 20), change = -8)
site_3 <- generate.trend(nyears = n.year, mu1 = runif(1, 8, 20), change = -8)
site_4 <- generate.trend(nyears = n.year, mu1 = runif(1, 8, 20), change = -8)
site_5 <- generate.trend(nyears = n.year, mu1 = runif(1, 8, 20), change = -8)
site_6 <- generate.trend(nyears = n.year, mu1 = runif(1, 8, 20), change = -8)
site_7 <- generate.trend(nyears = n.year, mu1 = runif(1, 8, 20), change = -8)

for (i in 1:n.year) {
  hd.occ[i, , 1] <- site_1$mu[i]
  hd.occ[i, , 2] <- site_2$mu[i]
  hd.occ[i, , 3] <- site_3$mu[i]
  hd.occ[i, , 4] <- site_4$mu[i]
  hd.occ[i, , 5] <- site_5$mu[i]
  hd.occ[i, , 6] <- site_6$mu[i]
  hd.occ[i, , 7] <- site_7$mu[i]
}

rm(list = c("site_1", "site_2", "site_3", "site_4", "site_5", "site_6", "site_7"))

# Storing as dataframe

hd_df <- data.frame(
  Edateku_1 = hd.occ[ , 1, 1],
  Edateku_2 = hd.occ[ , 2, 1],
  Edateku_3 = hd.occ[ , 3, 1],
  Edateku_4 = hd.occ[ , 4, 1],
  Edateku_5 = hd.occ[ , 5, 1],
  
  Oshima_1 = hd.occ[ , 1, 2],
  Oshima_2 = hd.occ[ , 2, 2],
  Oshima_3 = hd.occ[ , 3, 2],
  Oshima_4 = hd.occ[ , 4, 2],
  Oshima_5 = hd.occ[ , 5, 2],
  
  Kakeromajima_1 = hd.occ[ , 1, 3],
  Kakeromajima_2 = hd.occ[ , 2, 3],
  Kakeromajima_3 = hd.occ[ , 3, 3],
  Kakeromajima_4 = hd.occ[ , 4, 3],
  Kakeromajima_5 = hd.occ[ , 5, 3],
  
  Ukejima_1 = hd.occ[ , 1, 4],
  Ukejima_2 = hd.occ[ , 2, 4],
  Ukejima_3 = hd.occ[ , 3, 4],
  Ukejima_4 = hd.occ[ , 4, 4],
  Ukejima_5 = hd.occ[ , 5, 4],
  
  Yoroshima_1 = hd.occ[ , 1, 5],
  Yoroshima_2 = hd.occ[ , 2, 5],
  Yoroshima_3 = hd.occ[ , 3, 5],
  Yoroshima_4 = hd.occ[ , 4, 5],
  Yoroshima_5 = hd.occ[ , 5, 5],
  
  Tatsugo_1 = hd.occ[ , 1, 6],
  Tatsugo_2 = hd.occ[ , 2, 6],
  Tatsugo_3 = hd.occ[ , 3, 6],
  Tatsugo_4 = hd.occ[ , 4, 6],
  Tatsugo_5 = hd.occ[ , 5, 6],
  
  Kikai_1 = hd.occ[ , 1, 7],
  Kikai_2 = hd.occ[ , 2, 7],
  Kikai_3 = hd.occ[ , 3, 7],
  Kikai_4 = hd.occ[ , 4, 7],
  Kikai_5 = hd.occ[ , 5, 7]
)

hd_df <- data.frame(t(hd_df))
head(hd_df)
hd_df <- hd_df %>% 
  rename("1999" = X1, "2000" = X2, "2001" = X3, "2002" = X4,
         "2003" = X5, "2004" = X6, "2005" = X7, "2006" = X8,
         "2007" = X9, "2008" = X10, "2009" = X11, "2010" = X12,
         "2011" = X13, "2012" = X14, "2013" = X15, "2014" = X16,
         "2015" = X17, "2016" = X18, "2017" = X19, "2018" = X20,
         "2019" = X21
  )

head(hd_df)
hd_df <- data.frame(
  "1999_1" = hd_df$"1999",
  "1999_2" = hd_df$"1999",
  "1999_3" = hd_df$"1999",
  
  "2000_1" = hd_df$"2000",
  "2000_2" = hd_df$"2000",
  "2000_3" = hd_df$"2000",
  
  "2001_1" = hd_df$"2001",
  "2001_2" = hd_df$"2001",
  "2001_3" = hd_df$"2001",
  
  "2002_1" = hd_df$"2002",
  "2002_2" = hd_df$"2002",
  "2002_3" = hd_df$"2002",
  
  "2003_1" = hd_df$"2003",
  "2003_2" = hd_df$"2003",
  "2003_3" = hd_df$"2003",
  
  "2004_1" = hd_df$"2004",
  "2004_2" = hd_df$"2004",
  "2004_3" = hd_df$"2004",
  
  "2005_1" = hd_df$"2005",
  "2005_2" = hd_df$"2005",
  "2005_3" = hd_df$"2005",
  
  "2006_1" = hd_df$"2006",
  "2006_2" = hd_df$"2006",
  "2006_3" = hd_df$"2006",
  
  "2007_1" = hd_df$"2007",
  "2007_2" = hd_df$"2007",
  "2007_3" = hd_df$"2007",
  
  "2008_1" = hd_df$"2008",
  "2008_2" = hd_df$"2008",
  "2008_3" = hd_df$"2008",
  
  "2009_1" = hd_df$"2009",
  "2009_2" = hd_df$"2009",
  "2009_3" = hd_df$"2009",
  
  "2010_1" = hd_df$"2010",
  "2010_2" = hd_df$"2010",
  "2010_3" = hd_df$"2010",
  
  "2011_1" = hd_df$"2011",
  "2011_2" = hd_df$"2011",
  "2011_3" = hd_df$"2011",
  
  "2012_1" = hd_df$"2012",
  "2012_2" = hd_df$"2012",
  "2012_3" = hd_df$"2012",
  
  "2013_1" = hd_df$"2013",
  "2013_2" = hd_df$"2013",
  "2013_3" = hd_df$"2013",
  
  "2014_1" = hd_df$"2014",
  "2014_2" = hd_df$"2014",
  "2014_3" = hd_df$"2014",
  
  "2015_1" = hd_df$"2015",
  "2015_2" = hd_df$"2015",
  "2015_3" = hd_df$"2015",
  
  "2016_1" = hd_df$"2016",
  "2016_2" = hd_df$"2016",
  "2016_3" = hd_df$"2016",
  
  "2017_1" = hd_df$"2017",
  "2017_2" = hd_df$"2017",
  "2017_3" = hd_df$"2017",
  
  "2018_1" = hd_df$"2018",
  "2018_2" = hd_df$"2018",
  "2018_3" = hd_df$"2018",
  
  "2019_1" = hd_df$"2019",
  "2019_2" = hd_df$"2019",
  "2019_3" = hd_df$"2019"
)
names(hd_df)
names(hd_df) <- sub("^X", "", names(hd_df))
names(hd_df)
# setwd("C:\\Users\\deonr\\Desktop\\ZO4541\\Practicals\\simulated data\\occupancy")
# write.csv(hd_df, "HD_new_wednesday.csv")

# Mongoose Busters --------------------------------------------------------

# Array with [Year, Site, Region]
bust.occ <- array(0, dim = c(nrow = n.year, ncol = n.site, n.region))

# Cumulative years of mongoose control
bust.occ[3:21, , 1] <- 1
bust.occ[11:21, , 2] <- 1
bust.occ[8:21, , 3] <- 1
bust.occ[7:21, , 4] <- 1
bust.occ[14:21, , 5] <- 1
bust.occ[9:21, , 6] <- 1
bust.occ[17:21, , 7] <- 1

# Storing as dataframe

bust_df <- data.frame(
  Edateku_1 = bust.occ[ , 1, 1],
  Edateku_2 = bust.occ[ , 2, 1],
  Edateku_3 = bust.occ[ , 3, 1],
  Edateku_4 = bust.occ[ , 4, 1],
  Edateku_5 = bust.occ[ , 5, 1],
  
  Oshima_1 = bust.occ[ , 1, 2],
  Oshima_2 = bust.occ[ , 2, 2],
  Oshima_3 = bust.occ[ , 3, 2],
  Oshima_4 = bust.occ[ , 4, 2],
  Oshima_5 = bust.occ[ , 5, 2],
  
  Kakeromajima_1 = bust.occ[ , 1, 3],
  Kakeromajima_2 = bust.occ[ , 2, 3],
  Kakeromajima_3 = bust.occ[ , 3, 3],
  Kakeromajima_4 = bust.occ[ , 4, 3],
  Kakeromajima_5 = bust.occ[ , 5, 3],
  
  Ukejima_1 = bust.occ[ , 1, 4],
  Ukejima_2 = bust.occ[ , 2, 4],
  Ukejima_3 = bust.occ[ , 3, 4],
  Ukejima_4 = bust.occ[ , 4, 4],
  Ukejima_5 = bust.occ[ , 5, 4],
  
  Yoroshima_1 = bust.occ[ , 1, 5],
  Yoroshima_2 = bust.occ[ , 2, 5],
  Yoroshima_3 = bust.occ[ , 3, 5],
  Yoroshima_4 = bust.occ[ , 4, 5],
  Yoroshima_5 = bust.occ[ , 5, 5],
  
  Tatsugo_1 = bust.occ[ , 1, 6],
  Tatsugo_2 = bust.occ[ , 2, 6],
  Tatsugo_3 = bust.occ[ , 3, 6],
  Tatsugo_4 = bust.occ[ , 4, 6],
  Tatsugo_5 = bust.occ[ , 5, 6],
  
  Kikai_1 = bust.occ[ , 1, 7],
  Kikai_2 = bust.occ[ , 2, 7],
  Kikai_3 = bust.occ[ , 3, 7],
  Kikai_4 = bust.occ[ , 4, 7],
  Kikai_5 = bust.occ[ , 5, 7]
)

bust_df <- data.frame(t(bust_df))
bust_df <- bust_df %>% 
  rename("1999" = X1, "2000" = X2, "2001" = X3, "2002" = X4,
         "2003" = X5, "2004" = X6, "2005" = X7, "2006" = X8,
         "2007" = X9, "2008" = X10, "2009" = X11, "2010" = X12,
         "2011" = X13, "2012" = X14, "2013" = X15, "2014" = X16,
         "2015" = X17, "2016" = X18, "2017" = X19, "2018" = X20,
         "2019" = X21
  )
head(bust_df)
bust_df <- data.frame(
  "1999_1" = bust_df$"1999",
  "1999_2" = bust_df$"1999",
  "1999_3" = bust_df$"1999",
  
  "2000_1" = bust_df$"2000",
  "2000_2" = bust_df$"2000",
  "2000_3" = bust_df$"2000",
  
  "2001_1" = bust_df$"2001",
  "2001_2" = bust_df$"2001",
  "2001_3" = bust_df$"2001",
  
  "2002_1" = bust_df$"2002",
  "2002_2" = bust_df$"2002",
  "2002_3" = bust_df$"2002",
  
  "2003_1" = bust_df$"2003",
  "2003_2" = bust_df$"2003",
  "2003_3" = bust_df$"2003",
  
  "2004_1" = bust_df$"2004",
  "2004_2" = bust_df$"2004",
  "2004_3" = bust_df$"2004",
  
  "2005_1" = bust_df$"2005",
  "2005_2" = bust_df$"2005",
  "2005_3" = bust_df$"2005",
  
  "2006_1" = bust_df$"2006",
  "2006_2" = bust_df$"2006",
  "2006_3" = bust_df$"2006",
  
  "2007_1" = bust_df$"2007",
  "2007_2" = bust_df$"2007",
  "2007_3" = bust_df$"2007",
  
  "2008_1" = bust_df$"2008",
  "2008_2" = bust_df$"2008",
  "2008_3" = bust_df$"2008",
  
  "2009_1" = bust_df$"2009",
  "2009_2" = bust_df$"2009",
  "2009_3" = bust_df$"2009",
  
  "2010_1" = bust_df$"2010",
  "2010_2" = bust_df$"2010",
  "2010_3" = bust_df$"2010",
  
  "2011_1" = bust_df$"2011",
  "2011_2" = bust_df$"2011",
  "2011_3" = bust_df$"2011",
  
  "2012_1" = bust_df$"2012",
  "2012_2" = bust_df$"2012",
  "2012_3" = bust_df$"2012",
  
  "2013_1" = bust_df$"2013",
  "2013_2" = bust_df$"2013",
  "2013_3" = bust_df$"2013",
  
  "2014_1" = bust_df$"2014",
  "2014_2" = bust_df$"2014",
  "2014_3" = bust_df$"2014",
  
  "2015_1" = bust_df$"2015",
  "2015_2" = bust_df$"2015",
  "2015_3" = bust_df$"2015",
  
  "2016_1" = bust_df$"2016",
  "2016_2" = bust_df$"2016",
  "2016_3" = bust_df$"2016",
  
  "2017_1" = bust_df$"2017",
  "2017_2" = bust_df$"2017",
  "2017_3" = bust_df$"2017",
  
  "2018_1" = bust_df$"2018",
  "2018_2" = bust_df$"2018",
  "2018_3" = bust_df$"2018",
  
  "2019_1" = bust_df$"2019",
  "2019_2" = bust_df$"2019",
  "2019_3" = bust_df$"2019"
)
names(bust_df)
names(bust_df) <- sub("^X", "", names(bust_df))
names(bust_df)
# setwd("C:\\Users\\deonr\\Desktop\\ZO4541\\Practicals\\simulated data\\occupancy")
# write.csv(bust_df, "bust_new_wendnesday.csv")

# Site covariates ---------------------------------------------------------

# Habu snake presence -----------------------------------------------------

# Array with [Year, Site, Region]
snake.pres <- array(0, dim = c(nrow = n.year, ncol = n.site, n.region))

# Random sites where snake is present
id.snake.1 <- sample(c(1:n.site), round(runif(1, 0, 5), digit = 0))
id.snake.2 <- sample(c(1:n.site), round(runif(1, 0, 5), digit = 0))
id.snake.3 <- sample(c(1:n.site), round(runif(1, 0, 5), digit = 0))
id.snake.4 <- sample(c(1:n.site), round(runif(1, 0, 5), digit = 0))
id.snake.5 <- sample(c(1:n.site), round(runif(1, 0, 5), digit = 0))
id.snake.6 <- sample(c(1:n.site), round(runif(1, 0, 5), digit = 0))
id.snake.7 <- sample(c(1:n.site), round(runif(1, 0, 5), digit = 0))

# Including snake presence in those random sites
snake.pres[ , id.snake.1, 1] <- 1
snake.pres[ , id.snake.2, 2] <- 1
snake.pres[ , id.snake.3, 3] <- 1
snake.pres[ , id.snake.4, 4] <- 1
snake.pres[ , id.snake.5, 5] <- 1
snake.pres[ , id.snake.6, 6] <- 1
snake.pres[ , id.snake.7, 7] <- 1

# Storing as dataframe

snake_df <- data.frame(
  Edateku_1 = snake.pres[1, 1, 1],
  Edateku_2 = snake.pres[1, 2, 1],
  Edateku_3 = snake.pres[1, 3, 1],
  Edateku_4 = snake.pres[1, 4, 1],
  Edateku_5 = snake.pres[1, 5, 1],
  
  Oshima_1 = snake.pres[1, 1, 2],
  Oshima_2 = snake.pres[1, 2, 2],
  Oshima_3 = snake.pres[1, 3, 2],
  Oshima_4 = snake.pres[1, 4, 2],
  Oshima_5 = snake.pres[1, 5, 2],
  
  Kakeromajima_1 = snake.pres[1, 1, 3],
  Kakeromajima_2 = snake.pres[1, 2, 3],
  Kakeromajima_3 = snake.pres[1, 3, 3],
  Kakeromajima_4 = snake.pres[1, 4, 3],
  Kakeromajima_5 = snake.pres[1, 5, 3],
  
  Ukejima_1 = snake.pres[1, 1, 4],
  Ukejima_2 = snake.pres[1, 2, 4],
  Ukejima_3 = snake.pres[1, 3, 4],
  Ukejima_4 = snake.pres[1, 4, 4],
  Ukejima_5 = snake.pres[1, 5, 4],
  
  Yoroshima_1 = snake.pres[1, 1, 5],
  Yoroshima_2 = snake.pres[1, 2, 5],
  Yoroshima_3 = snake.pres[1, 3, 5],
  Yoroshima_4 = snake.pres[1, 4, 5],
  Yoroshima_5 = snake.pres[1, 5, 5],
  
  Tatsugo_1 = snake.pres[1, 1, 6],
  Tatsugo_2 = snake.pres[1, 2, 6],
  Tatsugo_3 = snake.pres[1, 3, 6],
  Tatsugo_4 = snake.pres[1, 4, 6],
  Tatsugo_5 = snake.pres[1, 5, 6],
  
  Kikai_1 = snake.pres[1, 1, 7],
  Kikai_2 = snake.pres[1, 2, 7],
  Kikai_3 = snake.pres[1, 3, 7],
  Kikai_4 = snake.pres[1, 4, 7],
  Kikai_5 = snake.pres[1, 5, 7]
)

snake_df <- data.frame(t(snake_df))
snake_df <- snake_df %>% 
  rename("Snakes" = t.snake_df.
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
site6 <- round(runif(1, 2, 100), digits = 1)
site7 <- round(runif(1, 2, 100), digits = 1)

for (i in 1:n.year) {
  forest.area[i, , 1] <- site1
  forest.area[i, , 2] <- site2
  forest.area[i, , 3] <- site3
  forest.area[i, , 4] <- site4
  forest.area[i, , 5] <- site5
  forest.area[i, , 6] <- site6
  forest.area[i, , 7] <- site7
}

# Storing as dataframe

forest_area_df <- data.frame(
  Edateku_1 = forest.area[1, 1, 1],
  Edateku_2 = forest.area[1, 2, 1],
  Edateku_3 = forest.area[1, 3, 1],
  Edateku_4 = forest.area[1, 4, 1],
  Edateku_5 = forest.area[1, 5, 1],
  
  Oshima_1 = forest.area[1, 1, 2],
  Oshima_2 = forest.area[1, 2, 2],
  Oshima_3 = forest.area[1, 3, 2],
  Oshima_4 = forest.area[1, 4, 2],
  Oshima_5 = forest.area[1, 5, 2],
  
  Kakeromajima_1 = forest.area[1, 1, 3],
  Kakeromajima_2 = forest.area[1, 2, 3],
  Kakeromajima_3 = forest.area[1, 3, 3],
  Kakeromajima_4 = forest.area[1, 4, 3],
  Kakeromajima_5 = forest.area[1, 5, 3],
  
  Ukejima_1 = forest.area[1, 1, 4],
  Ukejima_2 = forest.area[1, 2, 4],
  Ukejima_3 = forest.area[1, 3, 4],
  Ukejima_4 = forest.area[1, 4, 4],
  Ukejima_5 = forest.area[1, 5, 4],
  
  Yoroshima_1 = forest.area[1, 1, 5],
  Yoroshima_2 = forest.area[1, 2, 5],
  Yoroshima_3 = forest.area[1, 3, 5],
  Yoroshima_4 = forest.area[1, 4, 5],
  Yoroshima_5 = forest.area[1, 5, 5],
  
  Tatsugo_1 = forest.area[1, 1, 6],
  Tatsugo_2 = forest.area[1, 2, 6],
  Tatsugo_3 = forest.area[1, 3, 6],
  Tatsugo_4 = forest.area[1, 4, 6],
  Tatsugo_5 = forest.area[1, 5, 6],
  
  Kikai_1 = forest.area[1, 1, 7],
  Kikai_2 = forest.area[1, 2, 7],
  Kikai_3 = forest.area[1, 3, 7],
  Kikai_4 = forest.area[1, 4, 7],
  Kikai_5 = forest.area[1, 5, 7]
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
site6 <- round(runif(n.site, 0, 100), digits = 1)
site7 <- round(runif(n.site, 0, 100), digits = 1)

for (i in 1:n.year) {
  rain[i, , 1] <- site1
  rain[i, , 2] <- site2
  rain[i, , 3] <- site3
  rain[i, , 4] <- site4
  rain[i, , 5] <- site5
  rain[i, , 6] <- site6
  rain[i, , 7] <- site7
}

# Storing as dataframe

rain_df <- data.frame(
  Edateku_1 = rain[1, 1, 1],
  Edateku_2 = rain[1, 2, 1],
  Edateku_3 = rain[1, 3, 1],
  Edateku_4 = rain[1, 4, 1],
  Edateku_5 = rain[1, 5, 1],
  
  Oshima_1 = rain[1, 1, 2],
  Oshima_2 = rain[1, 2, 2],
  Oshima_3 = rain[1, 3, 2],
  Oshima_4 = rain[1, 4, 2],
  Oshima_5 = rain[1, 5, 2],
  
  Kakeromajima_1 = rain[1, 1, 3],
  Kakeromajima_2 = rain[1, 2, 3],
  Kakeromajima_3 = rain[1, 3, 3],
  Kakeromajima_4 = rain[1, 4, 3],
  Kakeromajima_5 = rain[1, 5, 3],
  
  Ukejima_1 = rain[1, 1, 4],
  Ukejima_2 = rain[1, 2, 4],
  Ukejima_3 = rain[1, 3, 4],
  Ukejima_4 = rain[1, 4, 4],
  Ukejima_5 = rain[1, 5, 4],
  
  Yoroshima_1 = rain[1, 1, 5],
  Yoroshima_2 = rain[1, 2, 5],
  Yoroshima_3 = rain[1, 3, 5],
  Yoroshima_4 = rain[1, 4, 5],
  Yoroshima_5 = rain[1, 5, 5],
  
  Tatsugo_1 = rain[1, 1, 6],
  Tatsugo_2 = rain[1, 2, 6],
  Tatsugo_3 = rain[1, 3, 6],
  Tatsugo_4 = rain[1, 4, 6],
  Tatsugo_5 = rain[1, 5, 6],
  
  Kikai_1 = rain[1, 1, 7],
  Kikai_2 = rain[1, 2, 7],
  Kikai_3 = rain[1, 3, 7],
  Kikai_4 = rain[1, 4, 7],
  Kikai_5 = rain[1, 5, 7]
)

rain_df <- data.frame(t(rain_df))
rain_df <- rain_df %>% 
  rename("Rain (mm)" = t.rain_df.
  )

# Storing all site covariates in single csv -------------------------------

site_covar <- data.frame(
  "Site" = row.names(snake_df), 
  "Snake Presence" = snake_df$Snakes, 
  "Forest Area (km2)" = forest_area_df$`Forest Area`,
  "Rain (mm)" = rain_df$`Rain (mm)`
  )

# setwd("C:\\Users\\deonr\\Desktop\\ZO4541\\Practicals\\simulated data\\occupancy")
# write.csv(site_covar, "Site Covariates_new_wednesday.csv", row.names = FALSE)

# Simulation --------------------------------------------------------------

# Initial occupancy -------------------------------------------------------

# Equation: Initial occupancy = -2.5 + 0.25 HD
init.occ <- plogis(-2 + 0.25 * hd.occ[1, , ])

# Give high initial occupancy in most regions and sites

# Use probability and draw from binomial distribution to determine presence/absence
dyn.occ[1, , ] <- rbinom(length(init.occ), size = 1, prob = init.occ)


# Dynamics ----------------------------------------------------------------

# Occupancy in subsequent years
for (t in 2:n.year) {

# Probability of colonization ---------------------------------------------
  # P_Col = -2 + 0.5 * Rabbit + 0.01 * Forest
  p.col <- plogis(-1 + 0.05 * forest.area[t, , ])

# Probability of extinction -----------------------------------------------
  # P_Ext = -0.5 + 2 * Busters + 0.25 * Snake
  p.ext <- plogis(-2 + 5.4 * bust.occ[t, , ])

# Probability of presence -------------------------------------------------
  # If previously unoccupied, then colonisaiton probability, otherwise extinction probability
  p.pres <- ifelse(dyn.occ[t - 1, , ] == 0, p.col, 1 - p.ext)

# Presence in subsequent years -------------------------------------------
  # Use probability of presence to determine presence/absence in current year
  dyn.occ[t, , ] <- rbinom(length(p.pres), size = 1, prob = p.pres)
}


### Plotting

par(mfrow = c(3, 3))

matplot(c(1997:2017), dyn.occ[, , 1], main = "Edateku", xlab = "Years", ylab = "Proportion occupied (out of 15 sites)")
lines(c(1997:2017), rowMeans(dyn.occ[, , 1]), lwd = 4)

matplot(c(1997:2017), dyn.occ[, , 2], main = "Oshima", xlab = "Years", ylab = "Proportion occupied (out of 15 sites)")
lines(c(1997:2017), rowMeans(dyn.occ[, , 2]), lwd = 4)

matplot(c(1997:2017), dyn.occ[, , 3], , main = "Kakeromajima", xlab = "Years", ylab = "Proportion occupied (out of 15 sites)")
lines(c(1997:2017), rowMeans(dyn.occ[, , 3]), lwd = 4)

matplot(c(1997:2017), dyn.occ[, , 4], main = "Ukejima", xlab = "Years", ylab = "Proportion occupied (out of 15 sites)")
lines(c(1997:2017), rowMeans(dyn.occ[, , 4]), lwd = 4)

matplot(c(1997:2017), dyn.occ[, , 5], main = "Yoroshima", xlab = "Years", ylab = "Proportion occupied (out of 15 sites)")
lines(c(1997:2017), rowMeans(dyn.occ[, , 5]), lwd = 4)

matplot(c(1997:2017), dyn.occ[, , 6], , main = "Tatsugo", xlab = "Years", ylab = "Proportion occupied (out of 15 sites)")
lines(c(1997:2017), rowMeans(dyn.occ[, , 6]), lwd = 4)

matplot(c(1997:2017), dyn.occ[, , 7], , main = "Kikai", xlab = "Years", ylab = "Proportion occupied (out of 15 sites)")
lines(c(1997:2017), rowMeans(dyn.occ[, , 7]), lwd = 4)


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
  p.det[i, , 1] <- plogis(2 - 0.025 * rain[i, , 1])
  p.det[i, , 2] <- plogis(2 - 0.025 * rain[i, , 2])
  p.det[i, , 3] <- plogis(2 - 0.025 * rain[i, , 3])
  p.det[i, , 4] <- plogis(2 - 0.025 * rain[i, , 4])
  p.det[i, , 5] <- plogis(2 - 0.025 * rain[i, , 5])
  p.det[i, , 6] <- plogis(2 - 0.025 * rain[i, , 6])
  p.det[i, , 7] <- plogis(2 - 0.025 * rain[i, , 7])
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
  det[, i, 6] <- rbinom(length(survey.times) * n.rep, 1, rep(p.det[, i, 6], each = n.rep) * rep(occ.surv[, i, 6], each = n.rep))
  det[, i, 7] <- rbinom(length(survey.times) * n.rep, 1, rep(p.det[, i, 7], each = n.rep) * rep(occ.surv[, i, 7], each = n.rep))
}

# Years when sampling occured as row names
rownames(det) <- rep(survey.year, each = n.rep)

# Region names
colnames(det[, , 1]) <- rep("Edateku", 5)
colnames(det[, , 2]) <- rep("Oshima", 5)
colnames(det[, , 3]) <- rep("Kakeromajima", 5)
colnames(det[, , 1]) <- rep("Ukejima", 5)
colnames(det[, , 2]) <- rep("Yoroshima", 5)
colnames(det[, , 3]) <- rep("Tatsugo", 5)
colnames(det[, , 3]) <- rep("Kikai", 5)

### Plotting

par(mfrow = c(3, 3))

# Array with [Sampling year, Site, Region]

matplot(rep(survey.year, each = n.rep), det[, , 1], main = "Edateku", xlab = "Years", ylab = "Proportion detected occupied")
lines(rep(survey.year, each = n.rep), rowMeans(det[, , 1]), lwd = 4)

matplot(rep(survey.year, each = n.rep), det[, , 2], main = "Oshima", xlab = "Years", ylab = "Proportion detected occupied")
lines(rep(survey.year, each = n.rep), rowMeans(det[, , 2]), lwd = 4)

matplot(rep(survey.year, each = n.rep), det[, , 3], , main = "Kakeromajima", xlab = "Years", ylab = "Proportion detected occupied")
lines(rep(survey.year, each = n.rep), rowMeans(det[, , 3]), lwd = 4)

matplot(rep(survey.year, each = n.rep), det[, , 4], main = "Ukejima", xlab = "Years", ylab = "Proportion detected occupied")
lines(rep(survey.year, each = n.rep), rowMeans(det[, , 4]), lwd = 4)

matplot(rep(survey.year, each = n.rep), det[, , 5], main = "Yoroshima", xlab = "Years", ylab = "Proportion detected occupied")
lines(rep(survey.year, each = n.rep), rowMeans(det[, , 5]), lwd = 4)

matplot(rep(survey.year, each = n.rep), det[, , 6], , main = "Tatsugo", xlab = "Years", ylab = "Proportion detected occupied")
lines(rep(survey.year, each = n.rep), rowMeans(det[, , 6]), lwd = 4)

matplot(rep(survey.year, each = n.rep), det[, , 7], , main = "Kikai", xlab = "Years", ylab = "Proportion detected occupied")
lines(rep(survey.year, each = n.rep), rowMeans(det[, , 7]), lwd = 4)


# Exporting ---------------------------------------------------------------

# Edateku -----------------------------------------------------------------

library(dplyr)

det_edateku <- as.data.frame(det[, , 1])
det_edateku <- det_edateku %>% 
  rename(edateku_1 = V1,
         edateku_2 = V2,
         edateku_3 = V3,
         edateku_4 = V4,
         edateku_5 = V5)

det_edateku2 <- data.frame(t(det_edateku))
det_edateku2 <- det_edateku2 %>% 
  rename("1999_1" = X1999, "1999_2" = X1999.1, "1999_3" = X1999.2,
         "2000_1" = X2000, "2000_2" = X2000.1, "2000_3" = X2000.2,
         "2001_1" = X2001, "2001_2" = X2001.1, "2001_3" = X2001.2,
         "2002_1" = X2002, "2002_2" = X2002.1, "2002_3" = X2002.2,
         "2003_1" = X2003, "2003_2" = X2003.1, "2003_3" = X2003.2,
         "2004_1" = X2004, "2004_2" = X2004.1, "2004_3" = X2004.2,
         "2005_1" = X2005, "2005_2" = X2005.1, "2005_3" = X2005.2,
         "2006_1" = X2006, "2006_2" = X2006.1, "2006_3" = X2006.2,
         "2007_1" = X2007, "2007_2" = X2007.1, "2007_3" = X2007.2,
         "2008_1" = X2008, "2008_2" = X2008.1, "2008_3" = X2008.2,
         "2009_1" = X2009, "2009_2" = X2009.1, "2009_3" = X2009.2,
         "2010_1" = X2010, "2010_2" = X2010.1, "2010_3" = X2010.2,
         "2011_1" = X2011, "2011_2" = X2011.1, "2011_3" = X2011.2,
         "2012_1" = X2012, "2012_2" = X2012.1, "2012_3" = X2012.2,
         "2013_1" = X2013, "2013_2" = X2013.1, "2013_3" = X2013.2,
         "2014_1" = X2014, "2014_2" = X2014.1, "2014_3" = X2014.2,
         "2015_1" = X2015, "2015_2" = X2015.1, "2015_3" = X2015.2,
         "2016_1" = X2016, "2016_2" = X2016.1, "2016_3" = X2016.2,
         "2017_1" = X2017, "2017_2" = X2017.1, "2017_3" = X2017.2,
         "2018_1" = X2018, "2018_2" = X2018.1, "2018_3" = X2018.2,
         "2019_1" = X2019, "2019_2" = X2019.1, "2019_3" = X2019.2
)

# Oshima ------------------------------------------------------------------

det_oshima <- as.data.frame(det[, , 2])
det_oshima <- det_oshima %>% 
  rename(oshima_1 = V1,
         oshima_2 = V2,
         oshima_3 = V3,
         oshima_4 = V4,
         oshima_5 = V5)

det_oshima2 <- data.frame(t(det_oshima))

det_oshima2 <- det_oshima2 %>% 
  rename("1999_1" = X1999, "1999_2" = X1999.1, "1999_3" = X1999.2,
         "2000_1" = X2000, "2000_2" = X2000.1, "2000_3" = X2000.2,
         "2001_1" = X2001, "2001_2" = X2001.1, "2001_3" = X2001.2,
         "2002_1" = X2002, "2002_2" = X2002.1, "2002_3" = X2002.2,
         "2003_1" = X2003, "2003_2" = X2003.1, "2003_3" = X2003.2,
         "2004_1" = X2004, "2004_2" = X2004.1, "2004_3" = X2004.2,
         "2005_1" = X2005, "2005_2" = X2005.1, "2005_3" = X2005.2,
         "2006_1" = X2006, "2006_2" = X2006.1, "2006_3" = X2006.2,
         "2007_1" = X2007, "2007_2" = X2007.1, "2007_3" = X2007.2,
         "2008_1" = X2008, "2008_2" = X2008.1, "2008_3" = X2008.2,
         "2009_1" = X2009, "2009_2" = X2009.1, "2009_3" = X2009.2,
         "2010_1" = X2010, "2010_2" = X2010.1, "2010_3" = X2010.2,
         "2011_1" = X2011, "2011_2" = X2011.1, "2011_3" = X2011.2,
         "2012_1" = X2012, "2012_2" = X2012.1, "2012_3" = X2012.2,
         "2013_1" = X2013, "2013_2" = X2013.1, "2013_3" = X2013.2,
         "2014_1" = X2014, "2014_2" = X2014.1, "2014_3" = X2014.2,
         "2015_1" = X2015, "2015_2" = X2015.1, "2015_3" = X2015.2,
         "2016_1" = X2016, "2016_2" = X2016.1, "2016_3" = X2016.2,
         "2017_1" = X2017, "2017_2" = X2017.1, "2017_3" = X2017.2,
         "2018_1" = X2018, "2018_2" = X2018.1, "2018_3" = X2018.2,
         "2019_1" = X2019, "2019_2" = X2019.1, "2019_3" = X2019.2
  )

# Kakeromajima ------------------------------------------------------------

det_kakeromajima <- as.data.frame(det[, , 3])
det_kakeromajima <- det_kakeromajima %>% 
  rename(kakeromajima_1 = V1,
         kakeromajima_2 = V2,
         kakeromajima_3 = V3,
         kakeromajima_4 = V4,
         kakeromajima_5 = V5)

det_kakeromajima2 <- data.frame(t(det_kakeromajima))

det_kakeromajima2 <- det_kakeromajima2 %>% 
  rename("1999_1" = X1999, "1999_2" = X1999.1, "1999_3" = X1999.2,
         "2000_1" = X2000, "2000_2" = X2000.1, "2000_3" = X2000.2,
         "2001_1" = X2001, "2001_2" = X2001.1, "2001_3" = X2001.2,
         "2002_1" = X2002, "2002_2" = X2002.1, "2002_3" = X2002.2,
         "2003_1" = X2003, "2003_2" = X2003.1, "2003_3" = X2003.2,
         "2004_1" = X2004, "2004_2" = X2004.1, "2004_3" = X2004.2,
         "2005_1" = X2005, "2005_2" = X2005.1, "2005_3" = X2005.2,
         "2006_1" = X2006, "2006_2" = X2006.1, "2006_3" = X2006.2,
         "2007_1" = X2007, "2007_2" = X2007.1, "2007_3" = X2007.2,
         "2008_1" = X2008, "2008_2" = X2008.1, "2008_3" = X2008.2,
         "2009_1" = X2009, "2009_2" = X2009.1, "2009_3" = X2009.2,
         "2010_1" = X2010, "2010_2" = X2010.1, "2010_3" = X2010.2,
         "2011_1" = X2011, "2011_2" = X2011.1, "2011_3" = X2011.2,
         "2012_1" = X2012, "2012_2" = X2012.1, "2012_3" = X2012.2,
         "2013_1" = X2013, "2013_2" = X2013.1, "2013_3" = X2013.2,
         "2014_1" = X2014, "2014_2" = X2014.1, "2014_3" = X2014.2,
         "2015_1" = X2015, "2015_2" = X2015.1, "2015_3" = X2015.2,
         "2016_1" = X2016, "2016_2" = X2016.1, "2016_3" = X2016.2,
         "2017_1" = X2017, "2017_2" = X2017.1, "2017_3" = X2017.2,
         "2018_1" = X2018, "2018_2" = X2018.1, "2018_3" = X2018.2,
         "2019_1" = X2019, "2019_2" = X2019.1, "2019_3" = X2019.2
  )
# Ukejima -----------------------------------------------------------------

det_ukejima <- as.data.frame(det[, , 4])
det_ukejima <- det_ukejima %>% 
  rename(ukejima_1 = V1,
         ukejima_2 = V2,
         ukejima_3 = V3,
         ukejima_4 = V4,
         ukejima_5 = V5)

det_ukejima2 <- data.frame(t(det_ukejima))

det_ukejima2 <- det_ukejima2 %>% 
  rename("1999_1" = X1999, "1999_2" = X1999.1, "1999_3" = X1999.2,
         "2000_1" = X2000, "2000_2" = X2000.1, "2000_3" = X2000.2,
         "2001_1" = X2001, "2001_2" = X2001.1, "2001_3" = X2001.2,
         "2002_1" = X2002, "2002_2" = X2002.1, "2002_3" = X2002.2,
         "2003_1" = X2003, "2003_2" = X2003.1, "2003_3" = X2003.2,
         "2004_1" = X2004, "2004_2" = X2004.1, "2004_3" = X2004.2,
         "2005_1" = X2005, "2005_2" = X2005.1, "2005_3" = X2005.2,
         "2006_1" = X2006, "2006_2" = X2006.1, "2006_3" = X2006.2,
         "2007_1" = X2007, "2007_2" = X2007.1, "2007_3" = X2007.2,
         "2008_1" = X2008, "2008_2" = X2008.1, "2008_3" = X2008.2,
         "2009_1" = X2009, "2009_2" = X2009.1, "2009_3" = X2009.2,
         "2010_1" = X2010, "2010_2" = X2010.1, "2010_3" = X2010.2,
         "2011_1" = X2011, "2011_2" = X2011.1, "2011_3" = X2011.2,
         "2012_1" = X2012, "2012_2" = X2012.1, "2012_3" = X2012.2,
         "2013_1" = X2013, "2013_2" = X2013.1, "2013_3" = X2013.2,
         "2014_1" = X2014, "2014_2" = X2014.1, "2014_3" = X2014.2,
         "2015_1" = X2015, "2015_2" = X2015.1, "2015_3" = X2015.2,
         "2016_1" = X2016, "2016_2" = X2016.1, "2016_3" = X2016.2,
         "2017_1" = X2017, "2017_2" = X2017.1, "2017_3" = X2017.2,
         "2018_1" = X2018, "2018_2" = X2018.1, "2018_3" = X2018.2,
         "2019_1" = X2019, "2019_2" = X2019.1, "2019_3" = X2019.2
  )
# Yoroshima ---------------------------------------------------------------

det_yoroshima <- as.data.frame(det[, , 5])
det_yoroshima <- det_yoroshima %>% 
  rename(yoroshima_1 = V1,
         yoroshima_2 = V2,
         yoroshima_3 = V3,
         yoroshima_4 = V4,
         yoroshima_5 = V5)

det_yoroshima2 <- data.frame(t(det_yoroshima))

det_yoroshima2 <- det_yoroshima2 %>% 
  rename("1999_1" = X1999, "1999_2" = X1999.1, "1999_3" = X1999.2,
         "2000_1" = X2000, "2000_2" = X2000.1, "2000_3" = X2000.2,
         "2001_1" = X2001, "2001_2" = X2001.1, "2001_3" = X2001.2,
         "2002_1" = X2002, "2002_2" = X2002.1, "2002_3" = X2002.2,
         "2003_1" = X2003, "2003_2" = X2003.1, "2003_3" = X2003.2,
         "2004_1" = X2004, "2004_2" = X2004.1, "2004_3" = X2004.2,
         "2005_1" = X2005, "2005_2" = X2005.1, "2005_3" = X2005.2,
         "2006_1" = X2006, "2006_2" = X2006.1, "2006_3" = X2006.2,
         "2007_1" = X2007, "2007_2" = X2007.1, "2007_3" = X2007.2,
         "2008_1" = X2008, "2008_2" = X2008.1, "2008_3" = X2008.2,
         "2009_1" = X2009, "2009_2" = X2009.1, "2009_3" = X2009.2,
         "2010_1" = X2010, "2010_2" = X2010.1, "2010_3" = X2010.2,
         "2011_1" = X2011, "2011_2" = X2011.1, "2011_3" = X2011.2,
         "2012_1" = X2012, "2012_2" = X2012.1, "2012_3" = X2012.2,
         "2013_1" = X2013, "2013_2" = X2013.1, "2013_3" = X2013.2,
         "2014_1" = X2014, "2014_2" = X2014.1, "2014_3" = X2014.2,
         "2015_1" = X2015, "2015_2" = X2015.1, "2015_3" = X2015.2,
         "2016_1" = X2016, "2016_2" = X2016.1, "2016_3" = X2016.2,
         "2017_1" = X2017, "2017_2" = X2017.1, "2017_3" = X2017.2,
         "2018_1" = X2018, "2018_2" = X2018.1, "2018_3" = X2018.2,
         "2019_1" = X2019, "2019_2" = X2019.1, "2019_3" = X2019.2
  )

# Tatsugo -----------------------------------------------------------------

det_tatsugo <- as.data.frame(det[, , 6])
det_tatsugo <- det_tatsugo %>% 
  rename(tatsugo_1 = V1,
         tatsugo_2 = V2,
         tatsugo_3 = V3,
         tatsugo_4 = V4,
         tatsugo_5 = V5)

det_tatsugo2 <- data.frame(t(det_tatsugo))

det_tatsugo2 <- det_tatsugo2 %>% 
  rename("1999_1" = X1999, "1999_2" = X1999.1, "1999_3" = X1999.2,
         "2000_1" = X2000, "2000_2" = X2000.1, "2000_3" = X2000.2,
         "2001_1" = X2001, "2001_2" = X2001.1, "2001_3" = X2001.2,
         "2002_1" = X2002, "2002_2" = X2002.1, "2002_3" = X2002.2,
         "2003_1" = X2003, "2003_2" = X2003.1, "2003_3" = X2003.2,
         "2004_1" = X2004, "2004_2" = X2004.1, "2004_3" = X2004.2,
         "2005_1" = X2005, "2005_2" = X2005.1, "2005_3" = X2005.2,
         "2006_1" = X2006, "2006_2" = X2006.1, "2006_3" = X2006.2,
         "2007_1" = X2007, "2007_2" = X2007.1, "2007_3" = X2007.2,
         "2008_1" = X2008, "2008_2" = X2008.1, "2008_3" = X2008.2,
         "2009_1" = X2009, "2009_2" = X2009.1, "2009_3" = X2009.2,
         "2010_1" = X2010, "2010_2" = X2010.1, "2010_3" = X2010.2,
         "2011_1" = X2011, "2011_2" = X2011.1, "2011_3" = X2011.2,
         "2012_1" = X2012, "2012_2" = X2012.1, "2012_3" = X2012.2,
         "2013_1" = X2013, "2013_2" = X2013.1, "2013_3" = X2013.2,
         "2014_1" = X2014, "2014_2" = X2014.1, "2014_3" = X2014.2,
         "2015_1" = X2015, "2015_2" = X2015.1, "2015_3" = X2015.2,
         "2016_1" = X2016, "2016_2" = X2016.1, "2016_3" = X2016.2,
         "2017_1" = X2017, "2017_2" = X2017.1, "2017_3" = X2017.2,
         "2018_1" = X2018, "2018_2" = X2018.1, "2018_3" = X2018.2,
         "2019_1" = X2019, "2019_2" = X2019.1, "2019_3" = X2019.2
  )

# Kikai -------------------------------------------------------------------

det_kikai <- as.data.frame(det[, , 7])
det_kikai <- det_kikai %>% 
  rename(kikai_1 = V1,
         kikai_2 = V2,
         kikai_3 = V3,
         kikai_4 = V4,
         kikai_5 = V5)

det_kikai2 <- data.frame(t(det_kikai))

det_kikai2 <- det_kikai2 %>% 
  rename("1999_1" = X1999, "1999_2" = X1999.1, "1999_3" = X1999.2,
         "2000_1" = X2000, "2000_2" = X2000.1, "2000_3" = X2000.2,
         "2001_1" = X2001, "2001_2" = X2001.1, "2001_3" = X2001.2,
         "2002_1" = X2002, "2002_2" = X2002.1, "2002_3" = X2002.2,
         "2003_1" = X2003, "2003_2" = X2003.1, "2003_3" = X2003.2,
         "2004_1" = X2004, "2004_2" = X2004.1, "2004_3" = X2004.2,
         "2005_1" = X2005, "2005_2" = X2005.1, "2005_3" = X2005.2,
         "2006_1" = X2006, "2006_2" = X2006.1, "2006_3" = X2006.2,
         "2007_1" = X2007, "2007_2" = X2007.1, "2007_3" = X2007.2,
         "2008_1" = X2008, "2008_2" = X2008.1, "2008_3" = X2008.2,
         "2009_1" = X2009, "2009_2" = X2009.1, "2009_3" = X2009.2,
         "2010_1" = X2010, "2010_2" = X2010.1, "2010_3" = X2010.2,
         "2011_1" = X2011, "2011_2" = X2011.1, "2011_3" = X2011.2,
         "2012_1" = X2012, "2012_2" = X2012.1, "2012_3" = X2012.2,
         "2013_1" = X2013, "2013_2" = X2013.1, "2013_3" = X2013.2,
         "2014_1" = X2014, "2014_2" = X2014.1, "2014_3" = X2014.2,
         "2015_1" = X2015, "2015_2" = X2015.1, "2015_3" = X2015.2,
         "2016_1" = X2016, "2016_2" = X2016.1, "2016_3" = X2016.2,
         "2017_1" = X2017, "2017_2" = X2017.1, "2017_3" = X2017.2,
         "2018_1" = X2018, "2018_2" = X2018.1, "2018_3" = X2018.2,
         "2019_1" = X2019, "2019_2" = X2019.1, "2019_3" = X2019.2
  )

# Combining ---------------------------------------------------------------

detection_history <- rbind(det_edateku2, det_oshima2, det_kakeromajima2, det_ukejima2,
                           det_yoroshima2, det_tatsugo2, det_kikai2)

# setwd("C:\\Users\\deonr\\Desktop\\ZO4541\\Practicals\\simulated data\\occupancy")
# write.csv(detection_history, "Mongoose Detection History_new_wednesday.csv", row.names = TRUE)








