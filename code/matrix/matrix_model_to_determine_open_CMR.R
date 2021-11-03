library(popdemo)


# Minimum survivals

phi_1 <- 0.48
phi_2 <- 0.63
phi_a <- 0.81

sigma <- 0.5

m_2 <- 1.1
m_a <- 1.1

F_2 <- m_2 * phi_1 * sigma
F_a <- m_a * phi_1 * sigma

rabbit <- as.matrix(data.frame(
  one = c(0, phi_1, 0),
  two = c(F_2, 0, phi_2),
  adults = c(F_a, 0, phi_a)
))

row.names(rabbit) <- colnames(rabbit)

eigs(A = rabbit)

numbers_at_stage <- c(
  58,
  33,
  159
)

business_as_usual <- project(A = rabbit, vector = numbers_at_stage, time = 25)

plot(business_as_usual)







# Mean survival

phi_1 <- 0.51   # 0.52 (increase of 2%)
phi_2 <- 0.66   # 0.62 (increase of 7%)
phi_a <- 0.83

sigma <- 0.5

m_2 <- 1.1
m_a <- 1.1

F_2 <- m_2 * phi_1 * sigma
F_a <- m_a * phi_1 * sigma

rabbit <- as.matrix(data.frame(
  one = c(0, phi_1, 0),
  two = c(F_2, 0, phi_2),
  adults = c(F_a, 0, phi_a)
))

row.names(rabbit) <- colnames(rabbit) # Copy the column names to row names

eigs(A = rabbit)

numbers_at_stage <- c(
  58,
  33,
  159
)

business_as_usual <- project(A = rabbit, vector = numbers_at_stage, time = 25)

plot(business_as_usual)









# Maximum survival

phi_1 <- 0.54   # 0.52 (increase of 2%)
phi_2 <- 0.69   # 0.62 (increase of 7%)
phi_a <- 0.87   # 0.83 (increase of 4%)

sigma <- 0.5

m_2 <- 1.1
m_a <- 1.1

F_2 <- m_2 * phi_1 * sigma
F_a <- m_a * phi_1 * sigma

rabbit <- as.matrix(data.frame(
  one = c(0, phi_1, 0),
  two = c(F_2, 0, phi_2),
  adults = c(F_a, 0, phi_a)
))

row.names(rabbit) <- colnames(rabbit) # Copy the column names to row names

eigs(A = rabbit)

numbers_at_stage <- c(
  58,
  33,
  159
)

business_as_usual <- project(A = rabbit, vector = numbers_at_stage, time = 25)

plot(business_as_usual)






# Test survival (what is a reasonable maximum)

phi_1 <- 0.55
phi_2 <- 0.70
phi_a <- 0.90

sigma <- 0.5

m_2 <- 1.1
m_a <- 1.1

F_2 <- m_2 * phi_1 * sigma
F_a <- m_a * phi_1 * sigma

rabbit <- as.matrix(data.frame(
  one = c(0, phi_1, 0),
  two = c(F_2, 0, phi_2),
  adults = c(F_a, 0, phi_a)
))

row.names(rabbit) <- colnames(rabbit) # Copy the column names to row names

eigs(A = rabbit)

numbers_at_stage <- c(
  58,
  33,
  159
)

business_as_usual <- project(A = rabbit, vector = numbers_at_stage, time = 25)

plot(business_as_usual)
