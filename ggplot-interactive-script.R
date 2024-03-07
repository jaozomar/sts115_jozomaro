setwd("sts-115")
wines = read.csv("wine_enthusiast_rankings.csv")
View(wines)

wine_cv = subset(wines, region_2=="Central Valley" &
                   variety=="Cabernet Sauvignon")

View(wine_cv)

library(ggplot2)

ggplot(wine_cv)

ggplot(wine_cv) + geom_point()

ggplot(wine_cv) + aes(x=price, y=points) + geom_point()

ggplot(wine_cv) + aes(x=price, y=points, color="blue") + geom_point()

ggplot(wine_cv) + aes(x=price, y=points) + geom_point(color="blue")


ggplot(wine_cv) + aes(x=price, y=points, color=region_1) + geom_point()


ggplot(wine_cv) +
  aes(x=price, y=points) +
  geom_point() + 
  geom_text(mapping=aes(color=region_1, label=taster_name))

underrated = subset(wine_cv, price<20 & points>85)

dim(underrated)





ggplot(underrated) +
  aes(x=price, y=points) +
  geom_point() + 
  geom_text(mapping=aes(color=region_1, label=taster_name), size=3, position=position_jitter())



wine_plot = ggplot(underrated) +
  aes(x=price, y=points) +
  geom_point() + 
  geom_text(mapping=aes(color=region_1, label=taster_name), size=3, position=position_jitter()) +
  xlab("Wine bottle price ($)") +
  ylab("Wine Enthusiast Score (max=100)") +
  ggtitle("Central Valley Cabernet Sauvignon price by Wine Enthusast rankings") +
  labs(color="Region")

ggsave(wine_plot, 
       filename="wine-plot.png",
       width=8,
       height=4)



ggplot(wine_cv) +
  aes(x=region_1) +
  geom_bar()


ggplot(wine_cv) +
  aes(x=region_1, fill=taster_name) +
  geom_bar(position=position_dodge()) +
  scale_fill_brewer(palette="Set2")




ggplot(underrated) +
  aes(x=price, y=points, color=region_1) +
  geom_point() +
  facet_wrap(~taster_name, ncol=2)


wine_cv$town = factor(wine_cv$region_1, levels=c("Lodi", "Clarksburg", "Yolo County", "Clements Hills", "Dunnigan Hills"))
wine_cv$town


ggplot(wine_cv) +
  aes(x=town) +
  geom_bar()
