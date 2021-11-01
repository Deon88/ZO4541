
# CJS Example data --------------------------------------------------------

# Define parameter values
n.occasions <- 7                       # Number of capture occasions
marked.j <- rpois(n.occasions - 1, 20) # Annual number of newly marked juveniles
marked.a <- rpois(n.occasions - 1, 10) # Annual number of newly marked adults
phi.juv <- 0.3                         # Juvenile annual survival
phi.ad <- 0.65                         # Adult annual survival
p <- rep(0.5, n.occasions-1)           # Recapture
phi.j <- c(phi.juv, rep(phi.ad, n.occasions-2))
phi.a <- rep(phi.ad, n.occasions-1)

# Define matrices with survival and recapture probabilities
PHI.J <- matrix(0, ncol = n.occasions-1, nrow = sum(marked.j))
for (i in 1:length(marked.j)){
  PHI.J[(sum(marked.j[1:i])-marked.j[i]+1):sum(marked.j[1:i]),i:(n.occasions-1)] <- matrix(rep(phi.j[1:(n.occasions-i)],marked.j[i]), ncol = n.occasions-i, byrow = TRUE)
}
P.J <- matrix(rep(p, sum(marked.j)), ncol = n.occasions-1, nrow = sum(marked.j), byrow = TRUE)
PHI.A <- matrix(rep(phi.a, sum(marked.a)), ncol = n.occasions-1, nrow = sum(marked.a), byrow = TRUE)
P.A <- matrix(rep(p, sum(marked.a)), ncol = n.occasions-1, nrow = sum(marked.a), byrow = TRUE)

# Apply simulation function
CH.J <- simul.cjs(PHI.J, P.J, marked.j)  # individuals marked as juveniles
CH.A <- simul.cjs(PHI.A, P.A, marked.a)  # individuals marked as adults 

# Create vector with occasion of marking
get.first <- function(x) min(which(x!=0))
f.j <- apply(CH.J, 1, get.first)
f.a <- apply(CH.A, 1, get.first)

# Create matrices X indicating age classes
x.j <- matrix(NA, ncol = dim(CH.J)[2]-1, nrow = dim(CH.J)[1])
x.a <- matrix(NA, ncol = dim(CH.A)[2]-1, nrow = dim(CH.A)[1])
for (i in 1:nrow(CH.J)){
  for (t in f.j[i]:(ncol(CH.J)-1)){
    x.j[i,t] <- 2
    x.j[i,f.j[i]] <- 1   
  } #t
} #i
for (i in 1:nrow(CH.A)){
  for (t in f.a[i]:(ncol(CH.A)-1)){
    x.a[i,t] <- 2
  } #t
} #i

CH_df <- as.data.frame(CH)

# Unique animal IDs
library(ids)
rabbit_names <- uuid(n = nrow(CH))

CH_df$ID <- rabbit_names
CH_df <- CH_df %>% 
  rename("1989" = V1, "1990" = V2, "1991" = V3, "1992" = V4,
         "1993" = V5, "1994" = V6, "1995" = V7
  )
CH_df <- CH_df[, c(8, 1:7)]
write.csv(CH_df, "open_CMR_CH_example.csv", row.names = FALSE)

f <- c(f.j, f.a)
x <- rbind(x.j, x.a)

x <- as.data.frame(x)
x$ID <- rabbit_names
x <- x %>% 
  rename("1989" = V1, "1990" = V2, "1991" = V3, "1992" = V4,
         "1993" = V5, "1994" = V6
  )
x <- x[, c(7, 1:6)]

write.csv(x, "open_CMR_CH_example_age.csv", row.names = FALSE)

