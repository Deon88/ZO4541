
# CJS Open CMR ------------------------------------------------------------

set.seed(2020) # Setting seed maintains "randomness"

# Parameter values --------------------------------------------------------

# Number of occasions -----------------------------------------------------
n.occasions <- 11                        # Trapped every year on 1st July from 2003 until 2013

# Number marked every year ------------------------------------------------
marked.y <- rpois(n.occasions - 1, 17) # rep(17, n.occasions - 1)            # Number of new marked yearlings every year
marked.s <- rpois(n.occasions - 1, 9)  # rep(9, n.occasions - 1)            # 10 subadults marked in first year, none subsequently
marked.a <- rpois(n.occasions - 1, 5)  # rep(6, n.occasions - 1)             # 20 adults marked in first year, none subsequently

# Phi ---------------------------------------------------------------------

# Phi covariates ----------------------------------------------------------
# Mongoose predation
mongoose <- c(1, 1, 1, 0, 1, 0, 0, 0, 0, 0)          # Mongoose observed in 2003, 04, 05, 07

beta_mongoose <- -0.3                                # -0.3 gradient for yearlings

# Nearest human infrastructure (km)
trend <- 0.5                                         # Human impact increases by 0.1 every year
human <- 10 -cumsum(rnorm(n.occasions - 1, 0.1) + trend) # And is a cumulative effect

beta_human <- 0.02                                   # 0.02 gradient

# Yearling phi ------------------------------------------------------------
mean.phi.yrl <- 0.3                                  # Mean yearling annual survival

# Subadult phi ------------------------------------------------------------
mean.phi.sa <- 0.55                                  # Mean sub-adult annual survival

# Adult phi ---------------------------------------------------------------
mean.phi.a <- 0.7                                    # Mean adult annual survival

# Age specific survival ---------------------------------------------------
phi.yr <- c(mean.phi.yrl, mean.phi.sa, rep(mean.phi.a, n.occasions - 3))
phi.sa <- c(mean.phi.sa, rep(mean.phi.a, n.occasions - 2))
phi.ad <- rep(mean.phi.a, n.occasions - 1)

# P -----------------------------------------------------------------------

p <- rep(0.4, n.occasions - 1) # Recapture

# Define matrices with survival and recapture probabilities

# Yearlings
PHI.Y <- matrix(0, 
                ncol = n.occasions - 1, 
                nrow = sum(marked.y))

for (i in 1:length(marked.y)) {
  PHI.Y[(sum(marked.y[1:i]) - marked.y[i] + 1):sum(marked.y[1:i]), 
        i:(n.occasions - 1)] <- matrix(rep(phi.yr[1:(n.occasions - i)], 
                                           marked.y[i]), 
                                       ncol = n.occasions - i, 
                                       byrow = TRUE)
}

for(i in 1:ncol(PHI.Y)){
  PHI.Y[,i] <- ifelse(PHI.Y[,i] != 0, PHI.Y[,i] + beta_mongoose * mongoose[i] + beta_human * human[i], PHI.Y[,i])
}

P.Y <- matrix(rep(p, sum(marked.y)), 
              ncol = n.occasions-1, 
              nrow = sum(marked.y), 
              byrow = TRUE)

# Sub-adults
PHI.S <- matrix(0, 
                ncol = n.occasions - 1, 
                nrow = sum(marked.s))

for (i in 1:length(marked.s)) {
  PHI.S[(sum(marked.s[1:i]) - marked.s[i] + 1):sum(marked.s[1:i]), 
        i:(n.occasions - 1)] <- matrix(rep(phi.sa[1:(n.occasions - i)], 
                                           marked.s[i]), 
                                       ncol = n.occasions - i, 
                                       byrow = TRUE)
}

for(i in 1:ncol(PHI.S)){
  PHI.S[,i] <- ifelse(PHI.S[,i] != 0, PHI.S[,i] + beta_mongoose * mongoose[i] + beta_human * human[i], PHI.S[,i])
}

P.S <- matrix(rep(p, sum(marked.s)), 
              ncol = n.occasions-1, 
              nrow = sum(marked.s), 
              byrow = TRUE)

# Adults
PHI.A <- matrix(rep(phi.ad, sum(marked.a)), 
                ncol = n.occasions-1,
                nrow = sum(marked.a), 
                byrow = TRUE)


for(i in 1:ncol(PHI.A)){
  PHI.A[,i] <- ifelse(PHI.A[,i] != 0, PHI.A[,i] + beta_mongoose * mongoose[i] + beta_human * human[i], PHI.A[,i])
}

P.A <- matrix(rep(p, sum(marked.a)), 
              ncol = n.occasions - 1, 
              nrow = sum(marked.a), 
              byrow = TRUE)


# Simulation function -----------------------------------------------------

simul.cjs <- function(PHI, P, marked) {
  n.occasions <- dim(PHI)[2] +1
  CH <- matrix(0, ncol = n.occasions, nrow = sum(marked))
  mark.occ <- rep(1:length(marked), marked[1:length(marked)])
  
  # fill CH
  for(i in 1:sum(marked)) {
    CH[i, mark.occ[i]] <- 1
    if(mark.occ[i] == n.occasions) next
    
    for(t in (mark.occ[i] + 1):n.occasions) {
      sur <- rbinom(1, 1, PHI[i,t-1])
      if(sur == 0) break
      rp <- rbinom(1, 1, P[i, t-1])
      if(rp == 1) CH[i,t] <- 1
    } # t
  } # i
  return(CH)
} # function


# Capture histories -------------------------------------------------------

# Yearling capture history ------------------------------------------------
CH.Y <- simul.cjs(PHI.Y, P.Y, marked.y)  # individuals marked as yearlings

# Subadult capture history ------------------------------------------------
CH.S <- simul.cjs(PHI.S, P.S, marked.s)  # individuals marked as sub-adults

# Adult capture history ---------------------------------------------------
CH.A <- simul.cjs(PHI.A, P.A, marked.a)  # individuals marked as adults 

CH <- rbind(CH.Y, CH.S, CH.A)

# Create vector with occasion of marking
get.first <- function(x) min(which(x!=0))
f.y <- apply(CH.Y, 1, get.first)
f.s <- apply(CH.S, 1, get.first)
f.a <- apply(CH.A, 1, get.first)

# Create matrices X indicating age classes
x.y <- matrix(NA, ncol = dim(CH.Y)[2]-1, nrow = dim(CH.Y)[1])
x.s <- matrix(NA, ncol = dim(CH.S)[2]-1, nrow = dim(CH.S)[1])
x.a <- matrix(NA, ncol = dim(CH.A)[2]-1, nrow = dim(CH.A)[1])

# Yearling data
for (i in 1:nrow(CH.Y)){
  for (t in f.y[i]:(ncol(CH.Y)-1)){
    x.y[i, t] <- 3
    x.y[i, f.y[i]] <- 1   

  } #t
} #i

for( c in 2:ncol(x.y)){
  x.y[,c]<- ifelse(!is.na(x.y[,c-1]) & x.y[,c-1]==1,2,x.y[,c])
  
}

# Subadult data
for (i in 1:nrow(CH.S)){
  for (t in f.s[i]:(ncol(CH.S)-1)){
    x.s[i,t] <- 3
    x.s[i,f.s[i]] <- 2   
  } #t
} #i

# Adult data
for (i in 1:nrow(CH.A)){
  for (t in f.a[i]:(ncol(CH.A)-1)){
    x.a[i,t] <- 3
  } #t
} #i



# Covariate extraction ----------------------------------------------------
setwd("C:\\Users\\deonr\\Desktop\\teaching\\Open-CMR")  

# Unique animal IDs
library(ids)
rabbit_names <- adjective_animal(n = nrow(CH))

# Starting with age
age <- rbind(x.y, x.s, x.a)

for(i in 1:ncol(age)) {
  age[,i] <- ifelse(age[,i] == 1, 
                    "Yearling", 
                    ifelse(age[,i] == 2,
                           "Sub-Adult",
                           ifelse(age[,i] == 3,
                                  "Adult",
                                  age[,i])))
}

age <- as.data.frame(age) 
age$ID <- rabbit_names
age <- age %>% 
  rename("2004" = V1, "2005" = V2, "2006" = V3, "2007" = V4,
         "2008" = V5, "2009" = V6, "2010" = V7, "2011" = V8,
         "2012" = V9, "2013" = V10
  )
age <- age[, c(11, 1:10)]

write.csv(age, "open_CMR_age_covariate.csv", row.names = FALSE)

# Mongoose

mongoose_df <- matrix(NA, ncol = 10, nrow = nrow(CH))

for(i in 1:ncol(mongoose_df)){
  mongoose_df[,i] <- mongoose[i]
}
mongoose_df <- as.data.frame(mongoose_df)

mongoose_df$ID <- rabbit_names

mongoose_df <- mongoose_df %>% 
  rename("2004" = V1, "2005" = V2, "2006" = V3, "2007" = V4,
         "2008" = V5, "2009" = V6, "2010" = V7, "2011" = V8,
         "2012" = V9, "2013" = V10
  )
mongoose_df <- mongoose_df[, c(11, 1:10)]

write.csv(mongoose_df, "open_CMR_mongoose_covariate.csv", row.names = FALSE)

# Distance from humans
         
human_df <- matrix(NA, ncol = 10, nrow = nrow(CH))
for(i in 1:nrow(human_df)) {
  human_df[i,] <- human
}

human_df <- as.data.frame(human_df)
human_df$ID <- rabbit_names

human_df <- human_df %>% 
  rename("2004" = V1, "2005" = V2, "2006" = V3, "2007" = V4,
         "2008" = V5, "2009" = V6, "2010" = V7, "2011" = V8,
         "2012" = V9, "2013" = V10
  )
human_df <- human_df[, c(11, 1:10)]

write.csv(human_df, "open_CMR_human_distance_covariate.csv", row.names = FALSE)

# Extracting capture history ----------------------------------------------

CH_df <- as.data.frame(CH)
CH_df$ID <- rabbit_names
CH_df <- CH_df %>% 
  rename("2003" = V1, "2004" = V2, "2005" = V3, "2006" = V4,
         "2007" = V5, "2008" = V6, "2009" = V7, "2010" = V8,
         "2011" = V9, "2012" = V10, "2013" = V11
  )
CH_df <- CH_df[, c(12, 1:11)]

write.csv(CH_df, "open_CMR_capture_history.csv", row.names = FALSE)




