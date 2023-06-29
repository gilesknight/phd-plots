library(tidyverse)
library(sf)
library(wesanderson)

dams  <- st_read("dam-size/data/wasw_dam_centroids_3857.gpkg")

head(dams)

# group data by dam size categories

dams  %>%
  mutate(
    size_class=cut(
      area_ha,
      breaks=c(-Inf, 0.1, 5, 10, 30, Inf),
      labels=c("<0.1 ha","0.1-5 ha","5-10 ha", "10-30 ha", ">30 ha")
      )
    )  %>% # count the number in each class
  group_by(size_class) %>%
  summarise(n=n())

size_class      n
1 <0.1 ha     13372
3 5-10 ha       254
4 10-30 ha       79
5 >30 ha         11

    ggplot(aes(size_class)) +
    geom_bar(fill=wes_palette("Zissou1")[1]) +
    #scale_y_continuous(expand = c(0, 0))+
    labs(x = "Size", y = "Dam count") +
    theme_classic() +
    theme(
      axis.text = element_text(colour = "black"),
      panel.background = element_rect(fill='transparent'),
      plot.background = element_rect(fill='transparent', color=NA),
      legend.background = element_rect(fill='transparent'),
      legend.box.background = element_rect(fill='transparent')
    )

ggsave(
  "dam-size/dam-sizes.png",
  width = 3,
  height = 2,
  units = "in",
  dpi = 500,
  bg='transparent',
  scale = 2
)

