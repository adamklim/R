data("diamonds")
str(diamonds)


ggplot(aes(x,price), data= diamonds) + 
  geom_point(alpha=.2, size=.2)

with(diamonds, cor.test(price,x))
with(diamonds, cor.test(price,y))
with(diamonds, cor.test(price,z))


ggplot(aes(price,depth), data= diamonds) + 
  geom_point(alpha=.01, size=.2)


with(diamonds, cor.test(price,depth))

ggplot(aes(price, carat), data = diamonds) +
  geom_point(alpha=.1, size=.2) +
  xlim(0, quantile(diamonds$price, .99)) +
  ylim(0, quantile(diamonds$carat, .99))

ggplot(aes(x*y*z, price), data=diamonds) +
  geom_point()

with(subset(diamonds,x*y*z>0 & x*y*z<=800), cor.test(price,x*y*z))


ggplot(aes(x*y*z, price), data=subset(diamonds, x*y*z > 0 & x*y*z <= 800)) + 
  geom_point(size=.3, alpha=.3) + 
  geom_smooth()


diamondsByClarity <- diamonds %>%
  group_by(clarity) %>%
  summarise(mean_price = mean(price),
            median_price = median(price),
            min_price = min(price),
            max_price = max(price),
            n = n())



diamonds_by_clarity <- group_by(diamonds, clarity)
diamonds_mp_by_clarity <- summarise(diamonds_by_clarity, mean_price = mean(price))

diamonds_by_color <- group_by(diamonds, color)
diamonds_mp_by_color <- summarise(diamonds_by_color, mean_price = mean(price))

p1 <- ggplot(aes(clarity, mean_price), data = diamonds_mp_by_clarity) +
  geom_point()
p2 <- ggplot(aes(color, mean_price), data = diamonds_mp_by_color) +
  geom_point()
library(gridExtra)
grid.arrange(p1,p2, ncol=1)