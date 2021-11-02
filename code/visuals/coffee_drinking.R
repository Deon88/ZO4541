# Coffee drinking
library(ggplot2)

money <- rep(1:75, times = 5)

n <- length(money)

parents <- rbinom(n = n, size = 1, prob = 0.5)

tv <- rbinom(n = n, size = 1, prob = 0.3)

hungover <- rbinom(n = n, size = 1, prob = 0.2)

z <- plogis(-4 + money * 0.1 + 2 * parents + 0.5 * tv + 1.5 * hungover)

drank_coffee <- rbinom(n = length(money), 1, prob = z)

df <- data.frame(
  money,
  drank_coffee,
  parents = ifelse(parents == 1, "Yes", "No"),
  tv = ifelse(tv == 1, "Yes", "No"),
  hungover = ifelse(tv == 1, "Yes", "No")
)

ggplot(df) +
  geom_point(aes(x = money, y = drank_coffee)) +
  geom_smooth(aes(x = money, y = drank_coffee),
              method = "glm", se = FALSE,
              method.args = list(family = "binomial"),
              linetype = "dashed") +
  labs(x = "Money in wallet",
       y = "Drank coffee") +
  theme_bw() +
  theme_minimal()

m <- glm(drank_coffee ~ money + parents,
         data = df,
         family = binomial())

p <- predict(m, type = "response")

df$fit <- p

a <- ggplot(df) +
  geom_boxplot(aes(x = parents, y = fit)) +
  geom_jitter(aes(x = parents, y = fit),
              width = 0.1, alpha = 0.8) +
  labs(x = "Parents drank coffee",
       y = "Drank coffee") +
  theme_bw() +
  theme_minimal()

b <- ggplot(df) +
  geom_boxplot(aes(x = tv, y = fit)) +
  geom_jitter(aes(x = tv, y = fit),
              width = 0.1, alpha = 0.8) +
  labs(x = "Watched TV shows with coffee",
       y = "Drank coffee") +
  theme_bw() +
  theme_minimal()

c <- ggplot(df) +
  geom_boxplot(aes(x = hungover, y = fit)) +
  geom_jitter(aes(x = hungover, y = fit),
              width = 0.1, alpha = 0.8) +
  labs(x = "Hungover",
       y = "Drank coffee") +
  theme_bw() +
  theme_minimal()

d <- ggplot(df) +
  geom_point(aes(x = money, y = drank_coffee)) +
  geom_smooth(aes(x = money, y = drank_coffee),
              method = "glm", se = FALSE,
              method.args = list(family = "binomial"),
              linetype = "dashed") +
  labs(x = "Money in wallet",
       y = "Drank coffee") +
  theme_bw() +
  theme_minimal()

library(patchwork)

(a + b)/
  (c + d)
