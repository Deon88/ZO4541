# Figure to show models with different -2logL

df <- data.frame(
  model = c("Mo", "Mt", "Mb"),
  neg2lnLik = c(-273, -285, -334)
)

library(ggplot2)

ggplot(df) +
  geom_point(aes(x = model, y = neg2lnLik),
             size = 2) +
  labs(x = "Model reflecting different processes",
       y = "-2 log Likelihood") +
  theme_bw() +
  theme_minimal()

       