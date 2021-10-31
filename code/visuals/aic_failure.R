# Visuals

n = 50

df <- data.frame(
  y = rnorm(n = n, 50, 2),
  x1 = rnorm(n = n, 10, 3),
  x2 = rnorm(n = n, 20, 4),
  x3 = rnorm(n = n, 30, 5),
  x4 = rnorm(n = n, 40, 6),
  x5 = rnorm(n = n, 50, 7),
  x6 = rnorm(n = n, 60, 7),
  x7 = rnorm(n = n, 70, 6),
  x8 = rnorm(n = n, 80, 5),
  x9 = rnorm(n = n, 90, 4),
  x10 = rnorm(n = n, 100, 2)
)

m <- lm(y ~ x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10,
        data = df)

MASS::stepAIC(m)

m1 <- lm(y ~ x1 + x3 + x7,
         data = df)

library(ggeffects)
library(ggplot2)

df_p <- ggpredict(m1, terms = c("x1"))
a <- plot(df_p) +
  labs(title = "",
       x = "Random variable A")

df_p <- ggpredict(m1, terms = c("x3"))
b <- plot(df_p) +
  labs(title = "",
       x = "Random variable B")

df_p <- ggpredict(m1, terms = c("x7"))
c <- plot(df_p) +
  labs(title = "",
       x = "Random variable C")

library(patchwork)

a / b / c
