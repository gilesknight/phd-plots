library(ggplot2)
library(dplyr)

# Define x values
x_values <- seq(-10, 10, by = 0.1)

# Create a data frame
df <- data.frame(x = x_values)

# Calculate y values
df <- df %>%
  mutate(y = 1 / (1 + exp(-x)))

# Plot the data
ggplot(df, aes(x = x, y = y)) +
  geom_line() +
  xlab(NULL) +
  ylab(NULL) +
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

ggsave(
  "sigmoid/sigmoid.pdf",
  width = 2,
  height = 2,
 # dpi=500,
  units = "in",
  scale = 2
)

