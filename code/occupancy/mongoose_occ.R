
# Mongoose simulated occupancy data ---------------------------------------

set.seed(2020)

# Number of regions -------------------------------------------------------

n.region <- 7

# Sites per region --------------------------------------------------------

n.site <- 15

# Number of years ---------------------------------------------------------

# Years when surveying took place
survey.year <- seq(1990, 2010, by = 2)

# Total number of years
n.year <- (2010 - 1990) + 1

# Creating empty array ----------------------------------------------------

# With dimensions [Year, Site, Region]
dyn.occ <- array(0, dim = c(nrow = n.year, ncol = n.site, n.region))

# Row names are the years
rownames(dyn.occ) <- c(1990:2010) # 21 years

# Survey Covariates -------------------------------------------------------

# Rabbit presence ---------------------------------------------------------

# Array with [Year, Site, Region]
rabbit.pres <- array(0, dim = c(nrow = n.year, ncol = n.site, n.region))

rabbit.pres[1:15, , 1] <- 1           # Present in years 1:15
rabbit.pres[1:5, , 2] <- 1            # Present in years 1:5
rabbit.pres[c(1:7, 19:21), , 3] <- 1  # Present in years 1:7 and 19:21
rabbit.pres[1:20, , 4] <- 1           # Present in years 1:20
rabbit.pres[1:19, , 5] <- 1           # Present in years 1:19
rabbit.pres[1:16, , 6] <- 1           # Present in years 1:16
rabbit.pres[1:15, , 7] <- 1           # Present in years 1:15

# Storing as dataframe

rabbit_df <- data.frame(
  Edateku_1 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 1],
  Edateku_2 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 1],
  Edateku_3 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 1],
  Edateku_4 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 1],
  Edateku_5 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 1],
  Edateku_6 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 1],
  Edateku_7 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 1],
  Edateku_8 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 1],
  Edateku_9 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 1],
  Edateku_10 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 1],
  Edateku_11 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 1],
  Edateku_12 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 1],
  Edateku_13 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 1],
  Edateku_14 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 1],
  Edateku_15 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 1],
  
  Oshima_1 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 2],
  Oshima_2 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 2],
  Oshima_3 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 2],
  Oshima_4 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 2],
  Oshima_5 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 2],
  Oshima_6 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 2],
  Oshima_7 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 2],
  Oshima_8 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 2],
  Oshima_9 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 2],
  Oshima_10 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 2],
  Oshima_11 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 2],
  Oshima_12 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 2],
  Oshima_13 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 2],
  Oshima_14 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 2],
  Oshima_15 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 2],
  
  Kakeromajima_1 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 3],
  Kakeromajima_2 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 3],
  Kakeromajima_3 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 3],
  Kakeromajima_4 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 3],
  Kakeromajima_5 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 3],
  Kakeromajima_6 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 3],
  Kakeromajima_7 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 3],
  Kakeromajima_8 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 3],
  Kakeromajima_9 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 3],
  Kakeromajima_10 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 3],
  Kakeromajima_11 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 3],
  Kakeromajima_12 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 3],
  Kakeromajima_13 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 3],
  Kakeromajima_14 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 3],
  Kakeromajima_15 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 3],
  
  Ukejima_1 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 4],
  Ukejima_2 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 4],
  Ukejima_3 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 4],
  Ukejima_4 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 4],
  Ukejima_5 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 4],
  Ukejima_6 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 4],
  Ukejima_7 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 4],
  Ukejima_8 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 4],
  Ukejima_9 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 4],
  Ukejima_10 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 4],
  Ukejima_11 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 4],
  Ukejima_12 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 4],
  Ukejima_13 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 4],
  Ukejima_14 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 4],
  Ukejima_15 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 4],
  
  Yoroshima_1 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 5],
  Yoroshima_2 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 5],
  Yoroshima_3 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 5],
  Yoroshima_4 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 5],
  Yoroshima_5 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 5],
  Yoroshima_6 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 5],
  Yoroshima_7 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 5],
  Yoroshima_8 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 5],
  Yoroshima_9 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 5],
  Yoroshima_10 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 5],
  Yoroshima_11 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 5],
  Yoroshima_12 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 5],
  Yoroshima_13 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 5],
  Yoroshima_14 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 5],
  Yoroshima_15 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 5],
  
  Tatsugo_1 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 6],
  Tatsugo_2 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 6],
  Tatsugo_3 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 6],
  Tatsugo_4 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 6],
  Tatsugo_5 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 6],
  Tatsugo_6 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 6],
  Tatsugo_7 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 6],
  Tatsugo_8 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 6],
  Tatsugo_9 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 6],
  Tatsugo_10 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 6],
  Tatsugo_11 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 6],
  Tatsugo_12 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 6],
  Tatsugo_13 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 6],
  Tatsugo_14 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 6],
  Tatsugo_15 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 6],
  
  Kikai_1 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 7],
  Kikai_2 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 7],
  Kikai_3 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 7],
  Kikai_4 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 7],
  Kikai_5 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 7],
  Kikai_6 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 7],
  Kikai_7 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 7],
  Kikai_8 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 7],
  Kikai_9 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 7],
  Kikai_10 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 7],
  Kikai_11 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 7],
  Kikai_12 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 7],
  Kikai_13 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 7],
  Kikai_14 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 7],
  Kikai_15 = rabbit.pres[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 7]
)

rabbit_df <- data.frame(t(rabbit_df))
rabbit_df <- rabbit_df %>% 
  rename("1990" = X1, "1992" = X2, "1994" = X3, "1996" = X4,
         "1998" = X5, "2000" = X6, "2002" = X7, "2004" = X8,
         "2006" = X9, "2008" = X10, "2010" = X11
  )

write.csv(rabbit_df, "Rabbit_presence.csv")

# Habu snake presence -----------------------------------------------------

# Array with [Year, Site, Region]
snake.pres <- array(0, dim = c(nrow = n.year, ncol = n.site, n.region))

# Random sites where snake is present
id.snake.1 <- sample(c(1:n.site), 10)
id.snake.2 <- sample(c(1:n.site), 5)
id.snake.3 <- sample(c(1:n.site), 1)
id.snake.4 <- sample(c(1:n.site), 13)
id.snake.5 <- sample(c(1:n.site), 4)
id.snake.6 <- sample(c(1:n.site), 7)
id.snake.7 <- sample(c(1:n.site), 15)

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
  Edateku_6 = snake.pres[1, 6, 1],
  Edateku_7 = snake.pres[1, 7, 1],
  Edateku_8 = snake.pres[1, 8, 1],
  Edateku_9 = snake.pres[1, 9, 1],
  Edateku_10 = snake.pres[1, 10, 1],
  Edateku_11 = snake.pres[1, 11, 1],
  Edateku_12 = snake.pres[1, 12, 1],
  Edateku_13 = snake.pres[1, 13, 1],
  Edateku_14 = snake.pres[1, 14, 1],
  Edateku_15 = snake.pres[1, 15, 1],
  
  Oshima_1 = snake.pres[1, 1, 2],
  Oshima_2 = snake.pres[1, 2, 2],
  Oshima_3 = snake.pres[1, 3, 2],
  Oshima_4 = snake.pres[1, 4, 2],
  Oshima_5 = snake.pres[1, 5, 2],
  Oshima_6 = snake.pres[1, 6, 2],
  Oshima_7 = snake.pres[1, 7, 2],
  Oshima_8 = snake.pres[1, 8, 2],
  Oshima_9 = snake.pres[1, 9, 2],
  Oshima_10 = snake.pres[1, 10, 2],
  Oshima_11 = snake.pres[1, 11, 2],
  Oshima_12 = snake.pres[1, 12, 2],
  Oshima_13 = snake.pres[1, 13, 2],
  Oshima_14 = snake.pres[1, 14, 2],
  Oshima_15 = snake.pres[1, 15, 2],
  
  Kakeromajima_1 = snake.pres[1, 1, 3],
  Kakeromajima_2 = snake.pres[1, 2, 3],
  Kakeromajima_3 = snake.pres[1, 3, 3],
  Kakeromajima_4 = snake.pres[1, 4, 3],
  Kakeromajima_5 = snake.pres[1, 5, 3],
  Kakeromajima_6 = snake.pres[1, 6, 3],
  Kakeromajima_7 = snake.pres[1, 7, 3],
  Kakeromajima_8 = snake.pres[1, 8, 3],
  Kakeromajima_9 = snake.pres[1, 9, 3],
  Kakeromajima_10 = snake.pres[1, 10, 3],
  Kakeromajima_11 = snake.pres[1, 11, 3],
  Kakeromajima_12 = snake.pres[1, 12, 3],
  Kakeromajima_13 = snake.pres[1, 13, 3],
  Kakeromajima_14 = snake.pres[1, 14, 3],
  Kakeromajima_15 = snake.pres[1, 15, 3],
  
  Ukejima_1 = snake.pres[1, 1, 4],
  Ukejima_2 = snake.pres[1, 2, 4],
  Ukejima_3 = snake.pres[1, 3, 4],
  Ukejima_4 = snake.pres[1, 4, 4],
  Ukejima_5 = snake.pres[1, 5, 4],
  Ukejima_6 = snake.pres[1, 6, 4],
  Ukejima_7 = snake.pres[1, 7, 4],
  Ukejima_8 = snake.pres[1, 8, 4],
  Ukejima_9 = snake.pres[1, 9, 4],
  Ukejima_10 = snake.pres[1, 10, 4],
  Ukejima_11 = snake.pres[1, 11, 4],
  Ukejima_12 = snake.pres[1, 12, 4],
  Ukejima_13 = snake.pres[1, 13, 4],
  Ukejima_14 = snake.pres[1, 14, 4],
  Ukejima_15 = snake.pres[1, 15, 4],
  
  Yoroshima_1 = snake.pres[1, 1, 5],
  Yoroshima_2 = snake.pres[1, 2, 5],
  Yoroshima_3 = snake.pres[1, 3, 5],
  Yoroshima_4 = snake.pres[1, 4, 5],
  Yoroshima_5 = snake.pres[1, 5, 5],
  Yoroshima_6 = snake.pres[1, 6, 5],
  Yoroshima_7 = snake.pres[1, 7, 5],
  Yoroshima_8 = snake.pres[1, 8, 5],
  Yoroshima_9 = snake.pres[1, 9, 5],
  Yoroshima_10 = snake.pres[1, 10, 5],
  Yoroshima_11 = snake.pres[1, 11, 5],
  Yoroshima_12 = snake.pres[1, 12, 5],
  Yoroshima_13 = snake.pres[1, 13, 5],
  Yoroshima_14 = snake.pres[1, 14, 5],
  Yoroshima_15 = snake.pres[1, 15, 5],
  
  Tatsugo_1 = snake.pres[1, 1, 6],
  Tatsugo_2 = snake.pres[1, 2, 6],
  Tatsugo_3 = snake.pres[1, 3, 6],
  Tatsugo_4 = snake.pres[1, 4, 6],
  Tatsugo_5 = snake.pres[1, 5, 6],
  Tatsugo_6 = snake.pres[1, 6, 6],
  Tatsugo_7 = snake.pres[1, 7, 6],
  Tatsugo_8 = snake.pres[1, 8, 6],
  Tatsugo_9 = snake.pres[1, 9, 6],
  Tatsugo_10 = snake.pres[1, 10, 6],
  Tatsugo_11 = snake.pres[1, 11, 6],
  Tatsugo_12 = snake.pres[1, 12, 6],
  Tatsugo_13 = snake.pres[1, 13, 6],
  Tatsugo_14 = snake.pres[1, 14, 6],
  Tatsugo_15 = snake.pres[1, 15, 6],
  
  Kikai_1 = snake.pres[1, 1, 7],
  Kikai_2 = snake.pres[1, 2, 7],
  Kikai_3 = snake.pres[1, 3, 7],
  Kikai_4 = snake.pres[1, 4, 7],
  Kikai_5 = snake.pres[1, 5, 7],
  Kikai_6 = snake.pres[1, 6, 7],
  Kikai_7 = snake.pres[1, 7, 7],
  Kikai_8 = snake.pres[1, 8, 7],
  Kikai_9 = snake.pres[1, 9, 7],
  Kikai_10 = snake.pres[1, 10, 7],
  Kikai_11 = snake.pres[1, 11, 7],
  Kikai_12 = snake.pres[1, 12, 7],
  Kikai_13 = snake.pres[1, 13, 7],
  Kikai_14 = snake.pres[1, 14, 7],
  Kikai_15 = snake.pres[1, 15, 7]
)

snake_df <- data.frame(t(snake_df))
snake_df <- snake_df %>% 
  rename("All Years" = X1
  )

write.csv(snake_df, "Snake_presence.csv")

# Forest area -------------------------------------------------------------

# Array with [Year, Site, Region]
forest.area <- array(0, dim = c(nrow = n.year, ncol = n.site, n.region))

# Random number for forest area in each of 7 regions
site1 <- round(runif(n.site, 2, 100), digits = 1)
site2 <- round(runif(n.site, 2, 100), digits = 1)
site3 <- round(runif(n.site, 2, 100), digits = 1)
site4 <- round(runif(n.site, 2, 100), digits = 1)
site5 <- round(runif(n.site, 2, 100), digits = 1)
site6 <- round(runif(n.site, 2, 100), digits = 1)
site7 <- round(runif(n.site, 2, 100), digits = 1)

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
  Edateku_6 = forest.area[1, 6, 1],
  Edateku_7 = forest.area[1, 7, 1],
  Edateku_8 = forest.area[1, 8, 1],
  Edateku_9 = forest.area[1, 9, 1],
  Edateku_10 = forest.area[1, 10, 1],
  Edateku_11 = forest.area[1, 11, 1],
  Edateku_12 = forest.area[1, 12, 1],
  Edateku_13 = forest.area[1, 13, 1],
  Edateku_14 = forest.area[1, 14, 1],
  Edateku_15 = forest.area[1, 15, 1],
  
  Oshima_1 = forest.area[1, 1, 2],
  Oshima_2 = forest.area[1, 2, 2],
  Oshima_3 = forest.area[1, 3, 2],
  Oshima_4 = forest.area[1, 4, 2],
  Oshima_5 = forest.area[1, 5, 2],
  Oshima_6 = forest.area[1, 6, 2],
  Oshima_7 = forest.area[1, 7, 2],
  Oshima_8 = forest.area[1, 8, 2],
  Oshima_9 = forest.area[1, 9, 2],
  Oshima_10 = forest.area[1, 10, 2],
  Oshima_11 = forest.area[1, 11, 2],
  Oshima_12 = forest.area[1, 12, 2],
  Oshima_13 = forest.area[1, 13, 2],
  Oshima_14 = forest.area[1, 14, 2],
  Oshima_15 = forest.area[1, 15, 2],
  
  Kakeromajima_1 = forest.area[1, 1, 3],
  Kakeromajima_2 = forest.area[1, 2, 3],
  Kakeromajima_3 = forest.area[1, 3, 3],
  Kakeromajima_4 = forest.area[1, 4, 3],
  Kakeromajima_5 = forest.area[1, 5, 3],
  Kakeromajima_6 = forest.area[1, 6, 3],
  Kakeromajima_7 = forest.area[1, 7, 3],
  Kakeromajima_8 = forest.area[1, 8, 3],
  Kakeromajima_9 = forest.area[1, 9, 3],
  Kakeromajima_10 = forest.area[1, 10, 3],
  Kakeromajima_11 = forest.area[1, 11, 3],
  Kakeromajima_12 = forest.area[1, 12, 3],
  Kakeromajima_13 = forest.area[1, 13, 3],
  Kakeromajima_14 = forest.area[1, 14, 3],
  Kakeromajima_15 = forest.area[1, 15, 3],
  
  Ukejima_1 = forest.area[1, 1, 4],
  Ukejima_2 = forest.area[1, 2, 4],
  Ukejima_3 = forest.area[1, 3, 4],
  Ukejima_4 = forest.area[1, 4, 4],
  Ukejima_5 = forest.area[1, 5, 4],
  Ukejima_6 = forest.area[1, 6, 4],
  Ukejima_7 = forest.area[1, 7, 4],
  Ukejima_8 = forest.area[1, 8, 4],
  Ukejima_9 = forest.area[1, 9, 4],
  Ukejima_10 = forest.area[1, 10, 4],
  Ukejima_11 = forest.area[1, 11, 4],
  Ukejima_12 = forest.area[1, 12, 4],
  Ukejima_13 = forest.area[1, 13, 4],
  Ukejima_14 = forest.area[1, 14, 4],
  Ukejima_15 = forest.area[1, 15, 4],
  
  Yoroshima_1 = forest.area[1, 1, 5],
  Yoroshima_2 = forest.area[1, 2, 5],
  Yoroshima_3 = forest.area[1, 3, 5],
  Yoroshima_4 = forest.area[1, 4, 5],
  Yoroshima_5 = forest.area[1, 5, 5],
  Yoroshima_6 = forest.area[1, 6, 5],
  Yoroshima_7 = forest.area[1, 7, 5],
  Yoroshima_8 = forest.area[1, 8, 5],
  Yoroshima_9 = forest.area[1, 9, 5],
  Yoroshima_10 = forest.area[1, 10, 5],
  Yoroshima_11 = forest.area[1, 11, 5],
  Yoroshima_12 = forest.area[1, 12, 5],
  Yoroshima_13 = forest.area[1, 13, 5],
  Yoroshima_14 = forest.area[1, 14, 5],
  Yoroshima_15 = forest.area[1, 15, 5],
  
  Tatsugo_1 = forest.area[1, 1, 6],
  Tatsugo_2 = forest.area[1, 2, 6],
  Tatsugo_3 = forest.area[1, 3, 6],
  Tatsugo_4 = forest.area[1, 4, 6],
  Tatsugo_5 = forest.area[1, 5, 6],
  Tatsugo_6 = forest.area[1, 6, 6],
  Tatsugo_7 = forest.area[1, 7, 6],
  Tatsugo_8 = forest.area[1, 8, 6],
  Tatsugo_9 = forest.area[1, 9, 6],
  Tatsugo_10 = forest.area[1, 10, 6],
  Tatsugo_11 = forest.area[1, 11, 6],
  Tatsugo_12 = forest.area[1, 12, 6],
  Tatsugo_13 = forest.area[1, 13, 6],
  Tatsugo_14 = forest.area[1, 14, 6],
  Tatsugo_15 = forest.area[1, 15, 6],
  
  Kikai_1 = forest.area[1, 1, 7],
  Kikai_2 = forest.area[1, 2, 7],
  Kikai_3 = forest.area[1, 3, 7],
  Kikai_4 = forest.area[1, 4, 7],
  Kikai_5 = forest.area[1, 5, 7],
  Kikai_6 = forest.area[1, 6, 7],
  Kikai_7 = forest.area[1, 7, 7],
  Kikai_8 = forest.area[1, 8, 7],
  Kikai_9 = forest.area[1, 9, 7],
  Kikai_10 = forest.area[1, 10, 7],
  Kikai_11 = forest.area[1, 11, 7],
  Kikai_12 = forest.area[1, 12, 7],
  Kikai_13 = forest.area[1, 13, 7],
  Kikai_14 = forest.area[1, 14, 7],
  Kikai_15 = forest.area[1, 15, 7]
)

forest_area_df <- data.frame(t(forest_area_df))
forest_area_df <- forest_area_df %>% 
  rename("All Years" = t.forest_area_df.
  )

write.csv(forest_area_df, "Forest_area.csv")

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
  Edateku_6 = rain[1, 6, 1],
  Edateku_7 = rain[1, 7, 1],
  Edateku_8 = rain[1, 8, 1],
  Edateku_9 = rain[1, 9, 1],
  Edateku_10 = rain[1, 10, 1],
  Edateku_11 = rain[1, 11, 1],
  Edateku_12 = rain[1, 12, 1],
  Edateku_13 = rain[1, 13, 1],
  Edateku_14 = rain[1, 14, 1],
  Edateku_15 = rain[1, 15, 1],
  
  Oshima_1 = rain[1, 1, 2],
  Oshima_2 = rain[1, 2, 2],
  Oshima_3 = rain[1, 3, 2],
  Oshima_4 = rain[1, 4, 2],
  Oshima_5 = rain[1, 5, 2],
  Oshima_6 = rain[1, 6, 2],
  Oshima_7 = rain[1, 7, 2],
  Oshima_8 = rain[1, 8, 2],
  Oshima_9 = rain[1, 9, 2],
  Oshima_10 = rain[1, 10, 2],
  Oshima_11 = rain[1, 11, 2],
  Oshima_12 = rain[1, 12, 2],
  Oshima_13 = rain[1, 13, 2],
  Oshima_14 = rain[1, 14, 2],
  Oshima_15 = rain[1, 15, 2],
  
  Kakeromajima_1 = rain[1, 1, 3],
  Kakeromajima_2 = rain[1, 2, 3],
  Kakeromajima_3 = rain[1, 3, 3],
  Kakeromajima_4 = rain[1, 4, 3],
  Kakeromajima_5 = rain[1, 5, 3],
  Kakeromajima_6 = rain[1, 6, 3],
  Kakeromajima_7 = rain[1, 7, 3],
  Kakeromajima_8 = rain[1, 8, 3],
  Kakeromajima_9 = rain[1, 9, 3],
  Kakeromajima_10 = rain[1, 10, 3],
  Kakeromajima_11 = rain[1, 11, 3],
  Kakeromajima_12 = rain[1, 12, 3],
  Kakeromajima_13 = rain[1, 13, 3],
  Kakeromajima_14 = rain[1, 14, 3],
  Kakeromajima_15 = rain[1, 15, 3],
  
  Ukejima_1 = rain[1, 1, 4],
  Ukejima_2 = rain[1, 2, 4],
  Ukejima_3 = rain[1, 3, 4],
  Ukejima_4 = rain[1, 4, 4],
  Ukejima_5 = rain[1, 5, 4],
  Ukejima_6 = rain[1, 6, 4],
  Ukejima_7 = rain[1, 7, 4],
  Ukejima_8 = rain[1, 8, 4],
  Ukejima_9 = rain[1, 9, 4],
  Ukejima_10 = rain[1, 10, 4],
  Ukejima_11 = rain[1, 11, 4],
  Ukejima_12 = rain[1, 12, 4],
  Ukejima_13 = rain[1, 13, 4],
  Ukejima_14 = rain[1, 14, 4],
  Ukejima_15 = rain[1, 15, 4],
  
  Yoroshima_1 = rain[1, 1, 5],
  Yoroshima_2 = rain[1, 2, 5],
  Yoroshima_3 = rain[1, 3, 5],
  Yoroshima_4 = rain[1, 4, 5],
  Yoroshima_5 = rain[1, 5, 5],
  Yoroshima_6 = rain[1, 6, 5],
  Yoroshima_7 = rain[1, 7, 5],
  Yoroshima_8 = rain[1, 8, 5],
  Yoroshima_9 = rain[1, 9, 5],
  Yoroshima_10 = rain[1, 10, 5],
  Yoroshima_11 = rain[1, 11, 5],
  Yoroshima_12 = rain[1, 12, 5],
  Yoroshima_13 = rain[1, 13, 5],
  Yoroshima_14 = rain[1, 14, 5],
  Yoroshima_15 = rain[1, 15, 5],
  
  Tatsugo_1 = rain[1, 1, 6],
  Tatsugo_2 = rain[1, 2, 6],
  Tatsugo_3 = rain[1, 3, 6],
  Tatsugo_4 = rain[1, 4, 6],
  Tatsugo_5 = rain[1, 5, 6],
  Tatsugo_6 = rain[1, 6, 6],
  Tatsugo_7 = rain[1, 7, 6],
  Tatsugo_8 = rain[1, 8, 6],
  Tatsugo_9 = rain[1, 9, 6],
  Tatsugo_10 = rain[1, 10, 6],
  Tatsugo_11 = rain[1, 11, 6],
  Tatsugo_12 = rain[1, 12, 6],
  Tatsugo_13 = rain[1, 13, 6],
  Tatsugo_14 = rain[1, 14, 6],
  Tatsugo_15 = rain[1, 15, 6],
  
  Kikai_1 = rain[1, 1, 7],
  Kikai_2 = rain[1, 2, 7],
  Kikai_3 = rain[1, 3, 7],
  Kikai_4 = rain[1, 4, 7],
  Kikai_5 = rain[1, 5, 7],
  Kikai_6 = rain[1, 6, 7],
  Kikai_7 = rain[1, 7, 7],
  Kikai_8 = rain[1, 8, 7],
  Kikai_9 = rain[1, 9, 7],
  Kikai_10 = rain[1, 10, 7],
  Kikai_11 = rain[1, 11, 7],
  Kikai_12 = rain[1, 12, 7],
  Kikai_13 = rain[1, 13, 7],
  Kikai_14 = rain[1, 14, 7],
  Kikai_15 = rain[1, 15, 7]
)

rain_df <- data.frame(t(rain_df))
rain_df <- rain_df %>% 
  rename("All Years" = t.rain_df.
  )

write.csv(rain_df, "Rain.csv")

# Human development index -------------------------------------------------

# Array with [Year, Site, Region]
hdi.occ <- array(0, dim = c(nrow = n.year, ncol = n.site, n.region))

# Random value between 0 and 1
hdi.sim <- runif(n.year, 0, 1)

for (i in 1:n.site) {
  hdi.occ[, i, 1] <- hdi.sim
  hdi.occ[, i, 2] <- hdi.sim
  hdi.occ[, i, 3] <- hdi.sim
  hdi.occ[, i, 4] <- hdi.sim
  hdi.occ[, i, 5] <- hdi.sim
  hdi.occ[, i, 6] <- hdi.sim
  hdi.occ[, i, 7] <- hdi.sim
}

# Storing as dataframe

hdi_df <- data.frame(
  Edateku_1 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 1],
  Edateku_2 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 1],
  Edateku_3 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 1],
  Edateku_4 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 1],
  Edateku_5 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 1],
  Edateku_6 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 1],
  Edateku_7 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 1],
  Edateku_8 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 1],
  Edateku_9 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 1],
  Edateku_10 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 1],
  Edateku_11 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 1],
  Edateku_12 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 1],
  Edateku_13 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 1],
  Edateku_14 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 1],
  Edateku_15 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 1],
  
  Oshima_1 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 2],
  Oshima_2 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 2],
  Oshima_3 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 2],
  Oshima_4 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 2],
  Oshima_5 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 2],
  Oshima_6 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 2],
  Oshima_7 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 2],
  Oshima_8 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 2],
  Oshima_9 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 2],
  Oshima_10 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 2],
  Oshima_11 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 2],
  Oshima_12 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 2],
  Oshima_13 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 2],
  Oshima_14 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 2],
  Oshima_15 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 2],
  
  Kakeromajima_1 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 3],
  Kakeromajima_2 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 3],
  Kakeromajima_3 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 3],
  Kakeromajima_4 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 3],
  Kakeromajima_5 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 3],
  Kakeromajima_6 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 3],
  Kakeromajima_7 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 3],
  Kakeromajima_8 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 3],
  Kakeromajima_9 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 3],
  Kakeromajima_10 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 3],
  Kakeromajima_11 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 3],
  Kakeromajima_12 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 3],
  Kakeromajima_13 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 3],
  Kakeromajima_14 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 3],
  Kakeromajima_15 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 3],
  
  Ukejima_1 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 4],
  Ukejima_2 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 4],
  Ukejima_3 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 4],
  Ukejima_4 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 4],
  Ukejima_5 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 4],
  Ukejima_6 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 4],
  Ukejima_7 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 4],
  Ukejima_8 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 4],
  Ukejima_9 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 4],
  Ukejima_10 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 4],
  Ukejima_11 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 4],
  Ukejima_12 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 4],
  Ukejima_13 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 4],
  Ukejima_14 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 4],
  Ukejima_15 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 4],
  
  Yoroshima_1 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 5],
  Yoroshima_2 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 5],
  Yoroshima_3 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 5],
  Yoroshima_4 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 5],
  Yoroshima_5 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 5],
  Yoroshima_6 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 5],
  Yoroshima_7 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 5],
  Yoroshima_8 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 5],
  Yoroshima_9 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 5],
  Yoroshima_10 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 5],
  Yoroshima_11 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 5],
  Yoroshima_12 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 5],
  Yoroshima_13 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 5],
  Yoroshima_14 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 5],
  Yoroshima_15 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 5],
  
  Tatsugo_1 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 6],
  Tatsugo_2 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 6],
  Tatsugo_3 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 6],
  Tatsugo_4 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 6],
  Tatsugo_5 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 6],
  Tatsugo_6 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 6],
  Tatsugo_7 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 6],
  Tatsugo_8 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 6],
  Tatsugo_9 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 6],
  Tatsugo_10 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 6],
  Tatsugo_11 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 6],
  Tatsugo_12 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 6],
  Tatsugo_13 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 6],
  Tatsugo_14 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 6],
  Tatsugo_15 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 6],
  
  Kikai_1 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 7],
  Kikai_2 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 7],
  Kikai_3 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 7],
  Kikai_4 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 7],
  Kikai_5 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 7],
  Kikai_6 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 7],
  Kikai_7 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 7],
  Kikai_8 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 7],
  Kikai_9 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 7],
  Kikai_10 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 7],
  Kikai_11 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 7],
  Kikai_12 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 7],
  Kikai_13 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 7],
  Kikai_14 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 7],
  Kikai_15 = hdi.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 7]
)

hdi_df <- data.frame(t(hdi_df))
hdi_df <- hdi_df %>% 
  rename("1990" = X1, "1992" = X2, "1994" = X3, "1996" = X4,
         "1998" = X5, "2000" = X6, "2002" = X7, "2004" = X8,
         "2006" = X9, "2008" = X10, "2010" = X11
  )

write.csv(hdi_df, "HDI.csv")

# Mongoose Busters --------------------------------------------------------

# Array with [Year, Site, Region]
bust.occ <- array(0, dim = c(nrow = n.year, ncol = n.site, n.region))

# Cumulative years of mongoose control
bust.occ[16:21, , 1] <- 1:6
bust.occ[16:21, , 2] <- 1:6
bust.occ[16:21, , 3] <- 1:6
bust.occ[16:21, , 4] <- 1:6
bust.occ[16:21, , 5] <- 1:6
bust.occ[16:21, , 6] <- 1:6
bust.occ[16:21, , 7] <- 1:6

# Storing as dataframe

bust_df <- data.frame(
  Edateku_1 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 1],
  Edateku_2 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 1],
  Edateku_3 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 1],
  Edateku_4 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 1],
  Edateku_5 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 1],
  Edateku_6 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 1],
  Edateku_7 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 1],
  Edateku_8 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 1],
  Edateku_9 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 1],
  Edateku_10 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 1],
  Edateku_11 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 1],
  Edateku_12 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 1],
  Edateku_13 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 1],
  Edateku_14 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 1],
  Edateku_15 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 1],
  
  Oshima_1 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 2],
  Oshima_2 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 2],
  Oshima_3 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 2],
  Oshima_4 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 2],
  Oshima_5 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 2],
  Oshima_6 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 2],
  Oshima_7 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 2],
  Oshima_8 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 2],
  Oshima_9 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 2],
  Oshima_10 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 2],
  Oshima_11 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 2],
  Oshima_12 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 2],
  Oshima_13 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 2],
  Oshima_14 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 2],
  Oshima_15 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 2],
  
  Kakeromajima_1 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 3],
  Kakeromajima_2 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 3],
  Kakeromajima_3 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 3],
  Kakeromajima_4 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 3],
  Kakeromajima_5 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 3],
  Kakeromajima_6 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 3],
  Kakeromajima_7 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 3],
  Kakeromajima_8 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 3],
  Kakeromajima_9 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 3],
  Kakeromajima_10 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 3],
  Kakeromajima_11 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 3],
  Kakeromajima_12 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 3],
  Kakeromajima_13 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 3],
  Kakeromajima_14 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 3],
  Kakeromajima_15 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 3],
  
  Ukejima_1 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 4],
  Ukejima_2 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 4],
  Ukejima_3 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 4],
  Ukejima_4 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 4],
  Ukejima_5 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 4],
  Ukejima_6 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 4],
  Ukejima_7 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 4],
  Ukejima_8 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 4],
  Ukejima_9 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 4],
  Ukejima_10 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 4],
  Ukejima_11 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 4],
  Ukejima_12 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 4],
  Ukejima_13 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 4],
  Ukejima_14 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 4],
  Ukejima_15 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 4],
  
  Yoroshima_1 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 5],
  Yoroshima_2 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 5],
  Yoroshima_3 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 5],
  Yoroshima_4 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 5],
  Yoroshima_5 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 5],
  Yoroshima_6 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 5],
  Yoroshima_7 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 5],
  Yoroshima_8 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 5],
  Yoroshima_9 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 5],
  Yoroshima_10 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 5],
  Yoroshima_11 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 5],
  Yoroshima_12 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 5],
  Yoroshima_13 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 5],
  Yoroshima_14 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 5],
  Yoroshima_15 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 5],
  
  Tatsugo_1 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 6],
  Tatsugo_2 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 6],
  Tatsugo_3 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 6],
  Tatsugo_4 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 6],
  Tatsugo_5 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 6],
  Tatsugo_6 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 6],
  Tatsugo_7 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 6],
  Tatsugo_8 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 6],
  Tatsugo_9 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 6],
  Tatsugo_10 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 6],
  Tatsugo_11 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 6],
  Tatsugo_12 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 6],
  Tatsugo_13 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 6],
  Tatsugo_14 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 6],
  Tatsugo_15 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 6],
  
  Kikai_1 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 1, 7],
  Kikai_2 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 2, 7],
  Kikai_3 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 3, 7],
  Kikai_4 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 4, 7],
  Kikai_5 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 5, 7],
  Kikai_6 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 6, 7],
  Kikai_7 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 7, 7],
  Kikai_8 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 8, 7],
  Kikai_9 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 9, 7],
  Kikai_10 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 10, 7],
  Kikai_11 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 11, 7],
  Kikai_12 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 12, 7],
  Kikai_13 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 13, 7],
  Kikai_14 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 14, 7],
  Kikai_15 = bust.occ[c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21), 15, 7]
)

bust_df <- data.frame(t(bust_df))
bust_df <- bust_df %>% 
  rename("1990" = X1, "1992" = X2, "1994" = X3, "1996" = X4,
         "1998" = X5, "2000" = X6, "2002" = X7, "2004" = X8,
         "2006" = X9, "2008" = X10, "2010" = X11
  )

write.csv(bust_df, "bust.csv")


# Simulation --------------------------------------------------------------

# Initial occupancy -------------------------------------------------------

# Equation: Initial occupancy = 1 + 0.55 * Forest - 0.09 * Rain + 2.5 * Rabbit + 0.5 HDI
init.occ <- plogis(1 + 0.55 * forest.area[1, , ] - 0.09 * rain[1, , ] + 2.5 * rabbit.pres[1, , ] + 0.5 * hdi.occ[1, , ])

# Give high initial occupancy in most regions and sites

# Use probability and draw from binomial distribution to determine presence/absence
dyn.occ[1, , ] <- rbinom(length(init.occ), size = 1, prob = init.occ)


# Dynamics ----------------------------------------------------------------

# Occupancy in subsequent years
for (t in 2:n.year) {
  # Probability of extinction
  # P_Ext = -0.1 - 2.5 * Snake + 0.5 * Rabbit + 0.1 * HDI + 10 * Buster
  p.ext <- plogis(-0.1 - 2.5 * snake.pres[t, , ] + 0.5 * rabbit.pres[t, , ] + 0.1 * hdi.occ[t, , ] + 10 * bust.occ[t, , ])

  # Probability of colonisation
  # P_Col = -1 + 0.75 * Forest + 0.05 * Rain + 0.5 * Rabbit - 0.01 * HDI - 10 * Buster
  p.col <- plogis(-1 + 0.75 * forest.area[t, , ] + 0.05 * rain[t, , ] + 0.5 * rabbit.pres[t, , ] - 0.01 * hdi.occ[t, , ] - 10 * bust.occ[t, , ])

  # Probability of presence
  # If previously unoccupied, then colonisaiton probability, otherwise extinction probability
  p.pres <- ifelse(dyn.occ[t - 1, , ] == 0, p.col, 1 - p.ext)

  # Use probability of presence to determine presence/absence in current year
  dyn.occ[t, , ] <- rbinom(length(p.pres), size = 1, prob = p.pres)
}


### Plotting

par(mfrow = c(3, 3))

matplot(c(1990:2010), dyn.occ[, , 1], main = "Edateku", xlab = "Years", ylab = "Proportion occupied (out of 15 sites)")
lines(c(1990:2010), rowMeans(dyn.occ[, , 1]), lwd = 4)

matplot(c(1990:2010), dyn.occ[, , 2], main = "Oshima", xlab = "Years", ylab = "Proportion occupied (out of 15 sites)")
lines(c(1990:2010), rowMeans(dyn.occ[, , 2]), lwd = 4)

matplot(c(1990:2010), dyn.occ[, , 3], , main = "Kakeromajima", xlab = "Years", ylab = "Proportion occupied (out of 15 sites)")
lines(c(1990:2010), rowMeans(dyn.occ[, , 3]), lwd = 4)

matplot(c(1990:2010), dyn.occ[, , 4], main = "Ukejima", xlab = "Years", ylab = "Proportion occupied (out of 15 sites)")
lines(c(1990:2010), rowMeans(dyn.occ[, , 4]), lwd = 4)

matplot(c(1990:2010), dyn.occ[, , 5], main = "Yoroshima", xlab = "Years", ylab = "Proportion occupied (out of 15 sites)")
lines(c(1990:2010), rowMeans(dyn.occ[, , 5]), lwd = 4)

matplot(c(1990:2010), dyn.occ[, , 6], , main = "Tatsugo", xlab = "Years", ylab = "Proportion occupied (out of 15 sites)")
lines(c(1990:2010), rowMeans(dyn.occ[, , 6]), lwd = 4)

matplot(c(1990:2010), dyn.occ[, , 7], , main = "Kikai", xlab = "Years", ylab = "Proportion occupied (out of 15 sites)")
lines(c(1990:2010), rowMeans(dyn.occ[, , 7]), lwd = 4)


# Detection simulation ----------------------------------------------------

# When surveys occured out of all years
## Set to survey every 2 years
survey.times <- seq(1, 21, by = 2)

# Extract occupancies for survey times
occ.surv <- dyn.occ[survey.times, , ]

# Sampling covariate ------------------------------------------------------

# Road length in site (proxy for easy of access)

road <- array(0, dim = c(nrow = length(survey.times), ncol = n.site, n.region))

road[, , 1] <- runif(1, 15, 50) # between 20 and 200 km of road in each region
road[, , 2] <- runif(1, 15, 50)
road[, , 3] <- runif(1, 15, 50)
road[, , 4] <- runif(1, 15, 50)
road[, , 5] <- runif(1, 15, 50)
road[, , 6] <- runif(1, 15, 50)
road[, , 7] <- runif(1, 15, 50)


# Simulating detection ----------------------------------------------------

p.det <- array(0, dim = c(nrow = length(survey.times), ncol = n.site, n.region))

# Detection probability is 0.3 * length of road

for (i in 1:length(survey.times)) {
  p.det[i, , 1] <- plogis(-4 + 0.15 * road[i, , 1])
  p.det[i, , 2] <- plogis(-4 + 0.15 * road[i, , 2])
  p.det[i, , 3] <- plogis(-4 + 0.15 * road[i, , 3])
  p.det[i, , 4] <- plogis(-4 + 0.15 * road[i, , 4])
  p.det[i, , 5] <- plogis(-4 + 0.15 * road[i, , 5])
  p.det[i, , 6] <- plogis(-4 + 0.15 * road[i, , 6])
  p.det[i, , 7] <- plogis(-4 + 0.15 * road[i, , 7])
}

### Plot histogramme of probability of detection
par(mfrow = c(1,1))
hist(c(unlist(p.det)), xlab = "Probability of detection")
# Detection varies between 0.1 and 
range(c(unlist(p.det)))

# Number of surveys per site in each region in each year
n.rep <- 4

# Array with [Sampling year, Site, Region]
det <- array(0, dim = c(nrow = length(survey.times) * n.rep, ncol = n.site, n.region))

for (i in 1:n.site) {
  det[, i, 1] <- rbinom(length(survey.times) * n.rep, 1, rep(p.det[, i, 1], each = n.rep) * occ.surv[, i, 1])
  det[, i, 2] <- rbinom(length(survey.times) * n.rep, 1, rep(p.det[, i, 2], each = n.rep) * occ.surv[, i, 2])
  det[, i, 3] <- rbinom(length(survey.times) * n.rep, 1, rep(p.det[, i, 3], each = n.rep) * occ.surv[, i, 3])
  det[, i, 4] <- rbinom(length(survey.times) * n.rep, 1, rep(p.det[, i, 4], each = n.rep) * occ.surv[, i, 4])
  det[, i, 5] <- rbinom(length(survey.times) * n.rep, 1, rep(p.det[, i, 5], each = n.rep) * occ.surv[, i, 5])
  det[, i, 6] <- rbinom(length(survey.times) * n.rep, 1, rep(p.det[, i, 6], each = n.rep) * occ.surv[, i, 6])
  det[, i, 7] <- rbinom(length(survey.times) * n.rep, 1, rep(p.det[, i, 7], each = n.rep) * occ.surv[, i, 7])
}

# Years when sampling occured as row names
rownames(det) <- rep(survey.year, each = n.rep)

# Region names
colnames(det[, , 1]) <- rep("Edateku", 15)
colnames(det[, , 2]) <- rep("Oshima", 15)
colnames(det[, , 3]) <- rep("Kakeromajima", 15)
colnames(det[, , 1]) <- rep("Ukejima", 15)
colnames(det[, , 2]) <- rep("Yoroshima", 15)
colnames(det[, , 3]) <- rep("Tatsugo", 15)
colnames(det[, , 3]) <- rep("Kikai", 15)

### Plotting

par(mfrow = c(3, 3))

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
  rename(site_1 = V1,
         site_2 = V2,
         site_3 = V3,
         site_4 = V4,
         site_5 = V5,
         site_6 = V6,
         site_7 = V7,
         site_8 = V8,
         site_9 = V9,
         site_10 = V10,
         site_11 = V11,
         site_12 = V12,
         site_13 = V13,
         site_14 = V14,
         site_15 = V15)

det_edateku2 <- data.frame(t(det_edateku))

det_edateku2 <- det_edateku2 %>% 
  rename("1990_1" = X1990, "1990_2" = X1990.1, "1990_3" = X1990.2, "1990_4" = X1990.3,
         "1992_1" = X1992, "1992_2" = X1992.1, "1992_3" = X1992.2, "1992_4" = X1992.3,
         "1994_1" = X1994, "1994_2" = X1994.1, "1994_3" = X1994.2, "1994_4" = X1994.3,
         "1996_1" = X1996, "1996_2" = X1996.1, "1996_3" = X1996.2, "1996_4" = X1996.3,
         "1998_1" = X1998, "1998_2" = X1998.1, "1998_3" = X1998.2, "1998_4" = X1998.3,
         "2000_1" = X2000, "2000_2" = X2000.1, "2000_3" = X2000.2, "2000_4" = X2000.3,
         "2002_1" = X2002, "2002_2" = X2002.1, "2002_3" = X2002.2, "2002_4" = X2002.3,
         "2004_1" = X2004, "2004_2" = X2004.1, "2004_3" = X2004.2, "2004_4" = X2004.3,
         "2006_1" = X2006, "2006_2" = X2006.1, "2006_3" = X2006.2, "2006_4" = X2006.3,
         "2008_1" = X2008, "2008_2" = X2008.1, "2008_3" = X2008.2, "2008_4" = X2008.3,
         "2010_1" = X2010, "2010_2" = X2010.1, "2010_3" = X2010.2, "2010_4" = X2010.3
)

det_edateku2$region <- "Edateku"
det_edateku2$site <- rownames(det_edateku2)

# Oshima ------------------------------------------------------------------

det_oshima <- as.data.frame(det[, , 2])
det_oshima <- det_oshima %>% 
  rename(site_16 = V1,
         site_17 = V2,
         site_18 = V3,
         site_19 = V4,
         site_20 = V5,
         site_21 = V6,
         site_22 = V7,
         site_23 = V8,
         site_24 = V9,
         site_25 = V10,
         site_26 = V11,
         site_27 = V12,
         site_28 = V13,
         site_29 = V14,
         site_30 = V15)

det_oshima2 <- data.frame(t(det_oshima))

det_oshima2 <- det_oshima2 %>% 
  rename("1990_1" = X1990, "1990_2" = X1990.1, "1990_3" = X1990.2, "1990_4" = X1990.3,
         "1992_1" = X1992, "1992_2" = X1992.1, "1992_3" = X1992.2, "1992_4" = X1992.3,
         "1994_1" = X1994, "1994_2" = X1994.1, "1994_3" = X1994.2, "1994_4" = X1994.3,
         "1996_1" = X1996, "1996_2" = X1996.1, "1996_3" = X1996.2, "1996_4" = X1996.3,
         "1998_1" = X1998, "1998_2" = X1998.1, "1998_3" = X1998.2, "1998_4" = X1998.3,
         "2000_1" = X2000, "2000_2" = X2000.1, "2000_3" = X2000.2, "2000_4" = X2000.3,
         "2002_1" = X2002, "2002_2" = X2002.1, "2002_3" = X2002.2, "2002_4" = X2002.3,
         "2004_1" = X2004, "2004_2" = X2004.1, "2004_3" = X2004.2, "2004_4" = X2004.3,
         "2006_1" = X2006, "2006_2" = X2006.1, "2006_3" = X2006.2, "2006_4" = X2006.3,
         "2008_1" = X2008, "2008_2" = X2008.1, "2008_3" = X2008.2, "2008_4" = X2008.3,
         "2010_1" = X2010, "2010_2" = X2010.1, "2010_3" = X2010.2, "2010_4" = X2010.3
  )

det_oshima2$region <- "Oshima"
det_oshima2$site <- rownames(det_oshima2)

# Kakeromajima ------------------------------------------------------------

det_kakeromajima <- as.data.frame(det[, , 3])
det_kakeromajima <- det_kakeromajima %>% 
  rename(site_31 = V1,
         site_32 = V2,
         site_33 = V3,
         site_34 = V4,
         site_35 = V5,
         site_36 = V6,
         site_37 = V7,
         site_38 = V8,
         site_39 = V9,
         site_40 = V10,
         site_41 = V11,
         site_42 = V12,
         site_43 = V13,
         site_44 = V14,
         site_45 = V15)

det_kakeromajima2 <- data.frame(t(det_kakeromajima))

det_kakeromajima2 <- det_kakeromajima2 %>% 
  rename("1990_1" = X1990, "1990_2" = X1990.1, "1990_3" = X1990.2, "1990_4" = X1990.3,
         "1992_1" = X1992, "1992_2" = X1992.1, "1992_3" = X1992.2, "1992_4" = X1992.3,
         "1994_1" = X1994, "1994_2" = X1994.1, "1994_3" = X1994.2, "1994_4" = X1994.3,
         "1996_1" = X1996, "1996_2" = X1996.1, "1996_3" = X1996.2, "1996_4" = X1996.3,
         "1998_1" = X1998, "1998_2" = X1998.1, "1998_3" = X1998.2, "1998_4" = X1998.3,
         "2000_1" = X2000, "2000_2" = X2000.1, "2000_3" = X2000.2, "2000_4" = X2000.3,
         "2002_1" = X2002, "2002_2" = X2002.1, "2002_3" = X2002.2, "2002_4" = X2002.3,
         "2004_1" = X2004, "2004_2" = X2004.1, "2004_3" = X2004.2, "2004_4" = X2004.3,
         "2006_1" = X2006, "2006_2" = X2006.1, "2006_3" = X2006.2, "2006_4" = X2006.3,
         "2008_1" = X2008, "2008_2" = X2008.1, "2008_3" = X2008.2, "2008_4" = X2008.3,
         "2010_1" = X2010, "2010_2" = X2010.1, "2010_3" = X2010.2, "2010_4" = X2010.3
  )

det_kakeromajima2$region <- "Kakeromajima"
det_kakeromajima2$site <- rownames(det_kakeromajima2)

# Ukejima -----------------------------------------------------------------

det_ukejima <- as.data.frame(det[, , 4])
det_ukejima <- det_ukejima %>% 
  rename(site_46 = V1,
         site_47 = V2,
         site_48 = V3,
         site_49 = V4,
         site_50 = V5,
         site_51 = V6,
         site_52 = V7,
         site_53 = V8,
         site_54 = V9,
         site_55 = V10,
         site_56 = V11,
         site_57 = V12,
         site_58 = V13,
         site_59 = V14,
         site_60 = V15)

det_ukejima2 <- data.frame(t(det_ukejima))

det_ukejima2 <- det_ukejima2 %>% 
  rename("1990_1" = X1990, "1990_2" = X1990.1, "1990_3" = X1990.2, "1990_4" = X1990.3,
         "1992_1" = X1992, "1992_2" = X1992.1, "1992_3" = X1992.2, "1992_4" = X1992.3,
         "1994_1" = X1994, "1994_2" = X1994.1, "1994_3" = X1994.2, "1994_4" = X1994.3,
         "1996_1" = X1996, "1996_2" = X1996.1, "1996_3" = X1996.2, "1996_4" = X1996.3,
         "1998_1" = X1998, "1998_2" = X1998.1, "1998_3" = X1998.2, "1998_4" = X1998.3,
         "2000_1" = X2000, "2000_2" = X2000.1, "2000_3" = X2000.2, "2000_4" = X2000.3,
         "2002_1" = X2002, "2002_2" = X2002.1, "2002_3" = X2002.2, "2002_4" = X2002.3,
         "2004_1" = X2004, "2004_2" = X2004.1, "2004_3" = X2004.2, "2004_4" = X2004.3,
         "2006_1" = X2006, "2006_2" = X2006.1, "2006_3" = X2006.2, "2006_4" = X2006.3,
         "2008_1" = X2008, "2008_2" = X2008.1, "2008_3" = X2008.2, "2008_4" = X2008.3,
         "2010_1" = X2010, "2010_2" = X2010.1, "2010_3" = X2010.2, "2010_4" = X2010.3
  )

det_ukejima2$region <- "Ukejima"
det_ukejima2$site <- rownames(det_ukejima2)

# Yoroshima ---------------------------------------------------------------

det_yoroshima <- as.data.frame(det[, , 5])
det_yoroshima <- det_yoroshima %>% 
  rename(site_61 = V1,
         site_62 = V2,
         site_63 = V3,
         site_64 = V4,
         site_65 = V5,
         site_66 = V6,
         site_67 = V7,
         site_68 = V8,
         site_69 = V9,
         site_70 = V10,
         site_71 = V11,
         site_72 = V12,
         site_73 = V13,
         site_74 = V14,
         site_75 = V15)

det_yoroshima2 <- data.frame(t(det_yoroshima))

det_yoroshima2 <- det_yoroshima2 %>% 
  rename("1990_1" = X1990, "1990_2" = X1990.1, "1990_3" = X1990.2, "1990_4" = X1990.3,
         "1992_1" = X1992, "1992_2" = X1992.1, "1992_3" = X1992.2, "1992_4" = X1992.3,
         "1994_1" = X1994, "1994_2" = X1994.1, "1994_3" = X1994.2, "1994_4" = X1994.3,
         "1996_1" = X1996, "1996_2" = X1996.1, "1996_3" = X1996.2, "1996_4" = X1996.3,
         "1998_1" = X1998, "1998_2" = X1998.1, "1998_3" = X1998.2, "1998_4" = X1998.3,
         "2000_1" = X2000, "2000_2" = X2000.1, "2000_3" = X2000.2, "2000_4" = X2000.3,
         "2002_1" = X2002, "2002_2" = X2002.1, "2002_3" = X2002.2, "2002_4" = X2002.3,
         "2004_1" = X2004, "2004_2" = X2004.1, "2004_3" = X2004.2, "2004_4" = X2004.3,
         "2006_1" = X2006, "2006_2" = X2006.1, "2006_3" = X2006.2, "2006_4" = X2006.3,
         "2008_1" = X2008, "2008_2" = X2008.1, "2008_3" = X2008.2, "2008_4" = X2008.3,
         "2010_1" = X2010, "2010_2" = X2010.1, "2010_3" = X2010.2, "2010_4" = X2010.3
  )

det_yoroshima2$region <- "Yoroshima"
det_yoroshima2$site <- rownames(det_yoroshima2)

# Tatsugo -----------------------------------------------------------------

det_tatsugo <- as.data.frame(det[, , 6])
det_tatsugo <- det_tatsugo %>% 
  rename(site_76 = V1,
         site_77 = V2,
         site_78 = V3,
         site_79 = V4,
         site_80 = V5,
         site_81 = V6,
         site_82 = V7,
         site_83 = V8,
         site_84 = V9,
         site_85 = V10,
         site_86 = V11,
         site_87 = V12,
         site_88 = V13,
         site_89 = V14,
         site_90 = V15)

det_tatsugo2 <- data.frame(t(det_tatsugo))

det_tatsugo2 <- det_tatsugo2 %>% 
  rename("1990_1" = X1990, "1990_2" = X1990.1, "1990_3" = X1990.2, "1990_4" = X1990.3,
         "1992_1" = X1992, "1992_2" = X1992.1, "1992_3" = X1992.2, "1992_4" = X1992.3,
         "1994_1" = X1994, "1994_2" = X1994.1, "1994_3" = X1994.2, "1994_4" = X1994.3,
         "1996_1" = X1996, "1996_2" = X1996.1, "1996_3" = X1996.2, "1996_4" = X1996.3,
         "1998_1" = X1998, "1998_2" = X1998.1, "1998_3" = X1998.2, "1998_4" = X1998.3,
         "2000_1" = X2000, "2000_2" = X2000.1, "2000_3" = X2000.2, "2000_4" = X2000.3,
         "2002_1" = X2002, "2002_2" = X2002.1, "2002_3" = X2002.2, "2002_4" = X2002.3,
         "2004_1" = X2004, "2004_2" = X2004.1, "2004_3" = X2004.2, "2004_4" = X2004.3,
         "2006_1" = X2006, "2006_2" = X2006.1, "2006_3" = X2006.2, "2006_4" = X2006.3,
         "2008_1" = X2008, "2008_2" = X2008.1, "2008_3" = X2008.2, "2008_4" = X2008.3,
         "2010_1" = X2010, "2010_2" = X2010.1, "2010_3" = X2010.2, "2010_4" = X2010.3
  )

det_tatsugo2$region <- "Tatsugo"
det_tatsugo2$site <- rownames(det_tatsugo2)

# Kikai -------------------------------------------------------------------

det_kikai <- as.data.frame(det[, , 7])
det_kikai <- det_kikai %>% 
  rename(site_91 = V1,
         site_92 = V2,
         site_93 = V3,
         site_94 = V4,
         site_95 = V5,
         site_96 = V6,
         site_97 = V7,
         site_98 = V8,
         site_99 = V9,
         site_100 = V10,
         site_101 = V11,
         site_102 = V12,
         site_103 = V13,
         site_104 = V14,
         site_105 = V15)

det_kikai2 <- data.frame(t(det_kikai))

det_kikai2 <- det_kikai2 %>% 
  rename("1990_1" = X1990, "1990_2" = X1990.1, "1990_3" = X1990.2, "1990_4" = X1990.3,
         "1992_1" = X1992, "1992_2" = X1992.1, "1992_3" = X1992.2, "1992_4" = X1992.3,
         "1994_1" = X1994, "1994_2" = X1994.1, "1994_3" = X1994.2, "1994_4" = X1994.3,
         "1996_1" = X1996, "1996_2" = X1996.1, "1996_3" = X1996.2, "1996_4" = X1996.3,
         "1998_1" = X1998, "1998_2" = X1998.1, "1998_3" = X1998.2, "1998_4" = X1998.3,
         "2000_1" = X2000, "2000_2" = X2000.1, "2000_3" = X2000.2, "2000_4" = X2000.3,
         "2002_1" = X2002, "2002_2" = X2002.1, "2002_3" = X2002.2, "2002_4" = X2002.3,
         "2004_1" = X2004, "2004_2" = X2004.1, "2004_3" = X2004.2, "2004_4" = X2004.3,
         "2006_1" = X2006, "2006_2" = X2006.1, "2006_3" = X2006.2, "2006_4" = X2006.3,
         "2008_1" = X2008, "2008_2" = X2008.1, "2008_3" = X2008.2, "2008_4" = X2008.3,
         "2010_1" = X2010, "2010_2" = X2010.1, "2010_3" = X2010.2, "2010_4" = X2010.3
  )

det_kikai2$region <- "Kikai"
det_kikai2$site <- rownames(det_kikai2)

# Combining ---------------------------------------------------------------

detection_history <- rbind(det_edateku2, det_oshima2, det_kakeromajima2, det_ukejima2,
                           det_yoroshima2, det_tatsugo2, det_kikai2)

write.csv(detection_history, "mongoose_occupancy_detection_history.csv", row.names = FALSE)








