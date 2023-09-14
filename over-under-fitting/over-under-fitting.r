# Required Libraries
library(ggplot2)
library(patchwork)

set.seed(123)

# Generating data
x_values <- seq(-10, 10, by = 1)
data_frame <- data.frame(x = c(x_values, x_values, x_values),
                         y = c(x_values^2 + rnorm(length(x_values), 0, 5)))

# Plotting
p1 <- ggplot(data_frame, aes(x, y)) +
  geom_point() +
  theme_classic() +
  theme(
    axis.text = element_text(colour = "black"),
    panel.background = element_rect(fill='transparent'),
    plot.background = element_rect(fill='transparent', color=NA),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.ticks.y = element_line(color = "black"),
    axis.line = element_blank(),
    panel.border = element_rect(colour = "black", fill = NA, size = 1),
    legend.background = element_rect(fill='transparent'),
    legend.box.background = element_rect(fill='transparent')
  )

p1

