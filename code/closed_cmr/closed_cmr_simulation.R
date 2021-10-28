# References:
# https://animaldiversity.org/accounts/Pentalagus_furnessi/



# 1965 258 --------------------------------------------------------------------

# Capture rates -----------------------------------------------------------

p1_1965 <- 0.25
p2_1965 <- 0.5
p3_1965 <- 0.56

# Population --------------------------------------------------------------

# Density appears to be roughly 2 per ha (Yamada et al 2000; https://animaldiversity.org/accounts/Pentalagus_furnessi/#ADF4BAD4-39B3-11E2-8614-002500F14F28)
# So study site of 100 ha
N_1965 <- 258


# Encounter histories -----------------------------------------------------

# 1965 3 capture
N_1965_111 <- round(N_1965 * p1_1965     * p2_1965     * p3_1965, digit = 0)

# 1965 2 capture
N_1965_110 <- round(N_1965 * p1_1965     * p2_1965     * (1-p3_1965), digit = 0)
N_1965_101 <- round(N_1965 * p1_1965     * (1-p2_1965) * p3_1965, digit = 0)
N_1965_011 <- round(N_1965 * (1-p1_1965) * p2_1965     * p3_1965, digit = 0)

# 1965 1 capture
N_1965_100 <- round(N_1965 * p1_1965     * (1-p2_1965) * (1-p3_1965), digit = 0)
N_1965_010 <- round(N_1965 * (1-p1_1965) * p2_1965     * (1-p3_1965), digit = 0)
N_1965_001 <- round(N_1965 * (1-p1_1965) * (1-p2_1965) * p3_1965, digit = 0)

enc_hist_1965 <- matrix(nrow = 7, ncol = 2)

enc_hist_1965[1,] <- c("/* Capture history */ 111", N_1965_111)

enc_hist_1965[2,] <- c("/* Capture history */ 110", N_1965_110)
enc_hist_1965[3,] <- c("/* Capture history */ 101", N_1965_101)
enc_hist_1965[4,] <- c("/* Capture history */ 011", N_1965_011)

enc_hist_1965[5,] <- c("/* Capture history */ 100", N_1965_100)
enc_hist_1965[6,] <- c("/* Capture history */ 010", N_1965_010)
enc_hist_1965[7,] <- c("/* Capture history */ 001", N_1965_001)

enc_hist_1965 <- as.data.frame(enc_hist_1965)
enc_hist_1965

# /* Capture history */ 111 18
# /* Capture history */ 110 14
# /* Capture history */ 101 18
# /* Capture history */ 011 54
# /* Capture history */ 100 14
# /* Capture history */ 010 43
# /* Capture history */ 001 54

# 1982 53 --------------------------------------------------------------------

# Capture rates -----------------------------------------------------------

p1_1982 <- 0.4
p2_1982 <- 0.5
p3_1982 <- 0.5
r2_1982 <- 0.4
r3_1982 <- 0.5

# Population --------------------------------------------------------------

# Density appears to be roughly 2 per ha (Yamada et al 2000; https://animaldiversity.org/accounts/Pentalagus_furnessi/#ADF4BAD4-39B3-11E2-8614-002500F14F28)
# So study site of 100 ha
N_1982 <- 53

# Encounter histories -----------------------------------------------------

# 1982 3 capture
N_1982_111 <- round(N_1982 * p1_1982     * r2_1982     * r3_1982, digit = 0)

# 1982 2 capture
N_1982_110 <- round(N_1982 * p1_1982     * r2_1982     * (1-r3_1982), digit = 0)
N_1982_101 <- round(N_1982 * p1_1982     * (1-r2_1982) * r3_1982, digit = 0)
N_1982_011 <- round(N_1982 * (1-p1_1982) * p2_1982     * r3_1982, digit = 0)

# 1982 1 capture
N_1982_100 <- round(N_1982 * p1_1982     * (1-r2_1982) * (1-r3_1982), digit = 0)
N_1982_010 <- round(N_1982 * (1-p1_1982) * p2_1982     * (1-r3_1982), digit = 0)
N_1982_001 <- round(N_1982 * (1-p1_1982) * (1-p2_1982) * p3_1982, digit = 0)

enc_hist_1982 <- matrix(nrow = 7, ncol = 2)

enc_hist_1982[1,] <- c("/* Capture history */ 111", N_1982_111)

enc_hist_1982[2,] <- c("/* Capture history */ 110", N_1982_110)
enc_hist_1982[3,] <- c("/* Capture history */ 101", N_1982_101)
enc_hist_1982[4,] <- c("/* Capture history */ 011", N_1982_011)

enc_hist_1982[5,] <- c("/* Capture history */ 100", N_1982_100)
enc_hist_1982[6,] <- c("/* Capture history */ 010", N_1982_010)
enc_hist_1982[7,] <- c("/* Capture history */ 001", N_1982_001)

enc_hist_1982 <- as.data.frame(enc_hist_1982)
enc_hist_1982

# /* Capture history */ 111  1
# /* Capture history */ 110  1
# /* Capture history */ 101  1
# /* Capture history */ 011  4
# /* Capture history */ 100  1
# /* Capture history */ 010  4
# /* Capture history */ 001 12

# 1 /* Capture history */ 111  4
# 2 /* Capture history */ 110  4
# 3 /* Capture history */ 101  6
# 4 /* Capture history */ 011  8
# 5 /* Capture history */ 100  6
# 6 /* Capture history */ 010  8
# 7 /* Capture history */ 001  8

# 2015 --------------------------------------------------------------------

# Adults 37 ------------------------------------------------------------------

# Capture rates -----------------------------------------------------------

p1_2015_adult <- 0.3
p2_2015_adult <- 0.3
p3_2015_adult <- 0.3
r2_2015_adult <- 0.4
r3_2015_adult <- 0.4


# Population --------------------------------------------------------------

# Density appears to be roughly 2 per ha (Yamada et al 2000; https://animaldiversity.org/accounts/Pentalagus_furnessi/#ADF4BAD4-39B3-11E2-8614-002500F14F28)
# So study site of 100 ha
N_2015_adult <- 37

# Encounter histories -----------------------------------------------------

# 2015_adult 3 capture
N_2015_adult_111 <- round(N_2015_adult * p1_2015_adult     * r2_2015_adult     * r3_2015_adult, digit = 0)

# 2015_adult 2 capture
N_2015_adult_110 <- round(N_2015_adult * p1_2015_adult     * r2_2015_adult     * (1-r3_2015_adult), digit = 0)
N_2015_adult_101 <- round(N_2015_adult * p1_2015_adult     * (1-r2_2015_adult) * r3_2015_adult, digit = 0)
N_2015_adult_011 <- round(N_2015_adult * (1-p1_2015_adult) * p2_2015_adult     * r3_2015_adult, digit = 0)

# 2015_adult 1 capture
N_2015_adult_100 <- round(N_2015_adult * p1_2015_adult     * (1-r2_2015_adult) * (1-r3_2015_adult), digit = 0)
N_2015_adult_010 <- round(N_2015_adult * (1-p1_2015_adult) * p2_2015_adult     * (1-r3_2015_adult), digit = 0)
N_2015_adult_001 <- round(N_2015_adult * (1-p1_2015_adult) * (1-p2_2015_adult) * p3_2015_adult, digit = 0)

enc_hist_2015_adult <- matrix(nrow = 7, ncol = 2)

enc_hist_2015_adult[1,] <- c("/* Capture history */ 111", N_2015_adult_111)

enc_hist_2015_adult[2,] <- c("/* Capture history */ 110", N_2015_adult_110)
enc_hist_2015_adult[3,] <- c("/* Capture history */ 101", N_2015_adult_101)
enc_hist_2015_adult[4,] <- c("/* Capture history */ 011", N_2015_adult_011)

enc_hist_2015_adult[5,] <- c("/* Capture history */ 100", N_2015_adult_100)
enc_hist_2015_adult[6,] <- c("/* Capture history */ 010", N_2015_adult_010)
enc_hist_2015_adult[7,] <- c("/* Capture history */ 001", N_2015_adult_001)

enc_hist_2015_adult <- as.data.frame(enc_hist_2015_adult)
enc_hist_2015_adult

# /* Capture history */ 111  0
# /* Capture history */ 110  1
# /* Capture history */ 101  1
# /* Capture history */ 011  2
# /* Capture history */ 100  3
# /* Capture history */ 010  5
# /* Capture history */ 001  8

# 1 /* Capture history */ 111  2
# 2 /* Capture history */ 110  3
# 3 /* Capture history */ 101  3
# 4 /* Capture history */ 011  3
# 5 /* Capture history */ 100  4
# 6 /* Capture history */ 010  5
# 7 /* Capture history */ 001  5

# Sub-adults 42 --------------------------------------------------------------

# Capture rates -----------------------------------------------------------

p1_2015_sub_adult <- 0.6
p2_2015_sub_adult <- 0.64
p3_2015_sub_adult <- 0.76

# Population --------------------------------------------------------------

# Density appears to be roughly 2 per ha (Yamada et al 2000; https://animaldiversity.org/accounts/Pentalagus_furnessi/#ADF4BAD4-39B3-11E2-8614-002500F14F28)
# So study site of 100 ha
N_2015_sub_adult <- 42

# Encounter histories -----------------------------------------------------

# 2015_sub_adult 3 capture
N_2015_sub_adult_111 <- round(N_2015_sub_adult * p1_2015_sub_adult     * p2_2015_sub_adult     * p3_2015_sub_adult, digit = 0)

# 2015_sub_adult 2 capture
N_2015_sub_adult_110 <- round(N_2015_sub_adult * p1_2015_sub_adult     * p2_2015_sub_adult     * (1-p3_2015_sub_adult), digit = 0)
N_2015_sub_adult_101 <- round(N_2015_sub_adult * p1_2015_sub_adult     * (1-p2_2015_sub_adult) * p3_2015_sub_adult, digit = 0)
N_2015_sub_adult_011 <- round(N_2015_sub_adult * (1-p1_2015_sub_adult) * p2_2015_sub_adult     * p3_2015_sub_adult, digit = 0)

# 2015_sub_adult 1 capture
N_2015_sub_adult_100 <- round(N_2015_sub_adult * p1_2015_sub_adult     * (1-p2_2015_sub_adult) * (1-p3_2015_sub_adult), digit = 0)
N_2015_sub_adult_010 <- round(N_2015_sub_adult * (1-p1_2015_sub_adult) * p2_2015_sub_adult     * (1-p3_2015_sub_adult), digit = 0)
N_2015_sub_adult_001 <- round(N_2015_sub_adult * (1-p1_2015_sub_adult) * (1-p2_2015_sub_adult) * p3_2015_sub_adult, digit = 0)

enc_hist_2015_sub_adult <- matrix(nrow = 7, ncol = 2)

enc_hist_2015_sub_adult[1,] <- c("/* Capture history */ 111", N_2015_sub_adult_111)

enc_hist_2015_sub_adult[2,] <- c("/* Capture history */ 110", N_2015_sub_adult_110)
enc_hist_2015_sub_adult[3,] <- c("/* Capture history */ 101", N_2015_sub_adult_101)
enc_hist_2015_sub_adult[4,] <- c("/* Capture history */ 011", N_2015_sub_adult_011)

enc_hist_2015_sub_adult[5,] <- c("/* Capture history */ 100", N_2015_sub_adult_100)
enc_hist_2015_sub_adult[6,] <- c("/* Capture history */ 010", N_2015_sub_adult_010)
enc_hist_2015_sub_adult[7,] <- c("/* Capture history */ 001", N_2015_sub_adult_001)

enc_hist_2015_sub_adult <- as.data.frame(enc_hist_2015_sub_adult)
enc_hist_2015_sub_adult

# /* Capture history */ 111  1
# /* Capture history */ 110  1
# /* Capture history */ 101  2
# /* Capture history */ 011  3
# /* Capture history */ 100  4
# /* Capture history */ 010  5
# /* Capture history */ 001  9

# 1 /* Capture history */ 111 12
# 2 /* Capture history */ 110  4
# 3 /* Capture history */ 101  7
# 4 /* Capture history */ 011  8
# 5 /* Capture history */ 100  2
# 6 /* Capture history */ 010  3
# 7 /* Capture history */ 001  5

# Yearlings 57 ------------------------------------------------------------

# Capture rates -----------------------------------------------------------

p1_2015_yearling <- 0.7
p2_2015_yearling <- 0.73
p3_2015_yearling <- 0.81

# Population --------------------------------------------------------------

# Density appears to be roughly 2 per ha (Yamada et al 2000; https://animaldiversity.org/accounts/Pentalagus_furnessi/#ADF4BAD4-39B3-11E2-8614-002500F14F28)
# So study site of 100 ha
N_2015_yearling <- 42

# Encounter histories -----------------------------------------------------

# 2015_yearling 3 capture
N_2015_yearling_111 <- round(N_2015_yearling * p1_2015_yearling     * p2_2015_yearling     * p3_2015_yearling, digit = 0)

# 2015_yearling 2 capture
N_2015_yearling_110 <- round(N_2015_yearling * p1_2015_yearling     * p2_2015_yearling     * (1-p3_2015_yearling), digit = 0)
N_2015_yearling_101 <- round(N_2015_yearling * p1_2015_yearling     * (1-p2_2015_yearling) * p3_2015_yearling, digit = 0)
N_2015_yearling_011 <- round(N_2015_yearling * (1-p1_2015_yearling) * p2_2015_yearling     * p3_2015_yearling, digit = 0)

# 2015_yearling 1 capture
N_2015_yearling_100 <- round(N_2015_yearling * p1_2015_yearling     * (1-p2_2015_yearling) * (1-p3_2015_yearling), digit = 0)
N_2015_yearling_010 <- round(N_2015_yearling * (1-p1_2015_yearling) * p2_2015_yearling     * (1-p3_2015_yearling), digit = 0)
N_2015_yearling_001 <- round(N_2015_yearling * (1-p1_2015_yearling) * (1-p2_2015_yearling) * p3_2015_yearling, digit = 0)

enc_hist_2015_yearling <- matrix(nrow = 7, ncol = 2)

enc_hist_2015_yearling[1,] <- c("/* Capture history */ 111", N_2015_yearling_111)

enc_hist_2015_yearling[2,] <- c("/* Capture history */ 110", N_2015_yearling_110)
enc_hist_2015_yearling[3,] <- c("/* Capture history */ 101", N_2015_yearling_101)
enc_hist_2015_yearling[4,] <- c("/* Capture history */ 011", N_2015_yearling_011)

enc_hist_2015_yearling[5,] <- c("/* Capture history */ 100", N_2015_yearling_100)
enc_hist_2015_yearling[6,] <- c("/* Capture history */ 010", N_2015_yearling_010)
enc_hist_2015_yearling[7,] <- c("/* Capture history */ 001", N_2015_yearling_001)

enc_hist_2015_yearling <- as.data.frame(enc_hist_2015_yearling)
enc_hist_2015_yearling

# /* Capture history */ 111 17
# /* Capture history */ 110  4
# /* Capture history */ 101  6
# /* Capture history */ 011  7
# /* Capture history */ 100  2
# /* Capture history */ 010  2
# /* Capture history */ 001  3


# Practical Example Dataset -----------------------------------------------

# Capture rates -----------------------------------------------------------

p1_eg <- 0.25
p2_eg <- 0.6
p3_eg <- 0.6

# Population --------------------------------------------------------------

# Density appears to be roughly 2 per ha (Yamada et al 2000; https://animaldiversity.org/accounts/Pentalagus_furnessi/#ADF4BAD4-39B3-11E2-8614-002500F14F28)
# So study site of 100 ha
N_eg <- 100

# Encounter histories -----------------------------------------------------

# eg 3 capture
N_eg_111 <- round(N_eg * p1_eg     * p2_eg     * p3_eg, digit = 0)

# eg 2 capture
N_eg_110 <- round(N_eg * p1_eg     * p2_eg     * (1-p3_eg), digit = 0)
N_eg_101 <- round(N_eg * p1_eg     * (1-p2_eg) * p3_eg, digit = 0)
N_eg_011 <- round(N_eg * (1-p1_eg) * p2_eg     * p3_eg, digit = 0)

# eg 1 capture
N_eg_100 <- round(N_eg * p1_eg     * (1-p2_eg) * (1-p3_eg), digit = 0)
N_eg_010 <- round(N_eg * (1-p1_eg) * p2_eg     * (1-p3_eg), digit = 0)
N_eg_001 <- round(N_eg * (1-p1_eg) * (1-p2_eg) * p3_eg, digit = 0)

enc_hist_eg <- matrix(nrow = 7, ncol = 2)

enc_hist_eg[1,] <- c("/* Capture history */ 111", N_eg_111)

enc_hist_eg[2,] <- c("/* Capture history */ 110", N_eg_110)
enc_hist_eg[3,] <- c("/* Capture history */ 101", N_eg_101)
enc_hist_eg[4,] <- c("/* Capture history */ 011", N_eg_011)

enc_hist_eg[5,] <- c("/* Capture history */ 100", N_eg_100)
enc_hist_eg[6,] <- c("/* Capture history */ 010", N_eg_010)
enc_hist_eg[7,] <- c("/* Capture history */ 001", N_eg_001)

enc_hist_eg <- as.data.frame(enc_hist_eg)
enc_hist_eg

# 1 /* Capture history */ 111  9
# 2 /* Capture history */ 110  6
# 3 /* Capture history */ 101  6
# 4 /* Capture history */ 011 27
# 5 /* Capture history */ 100  4
# 6 /* Capture history */ 010 18
# 7 /* Capture history */ 001 18

