library(ggplot2)
data("diamonds")
summary(diamonds)
#number of observations: 53940, no of vatiables: 10
dim(diamonds)
# number of ordered factors: 3
str(diamonds)
# best color of diamond: D
?diamonds

#diamond price histogram
qplot(data=diamonds, x=price, binwidth = 100, color = I('black'), fill = I('#099DD9'))+
  scale_x_continuous(limits = c(0,2000))


summary(diamonds$price)

#count diamonds with specific price
sum(diamonds$price<500)

#break prices by cut
qplot(data=diamonds, x=price, binwidth = 100, color = I('black'), fill = I('#099DD9'))+
  facet_wrap(~cut)+scale_x_continuous()

#some statistic per cut
by(diamonds$price,diamonds$cut, summary)

# y-axis is fixed, remove fixed axis for facet_wrap
qplot(data=diamonds, x=price, binwidth = 100, color = I('black'), fill = I('#099DD9'))+
  facet_wrap(~cut, scales = 'free_y')


#price per catar
qplot(data=diamonds, x=price/carat, color = I('black'), fill = I('#099DD9'))+
  facet_wrap(~cut, scales = 'free_y') +
  scale_x_log10()



# box plot
qplot(data=diamonds, y=price, x=clarity, geom = 'boxplot', 
      color = I('black'), fill = I('#099DD9'))

# categorical price split summary:
by(diamonds$price, diamonds$color, summary)

#IQR color
IQR(subset(diamonds,color == 'D')$price)

#price per carat boxplot for colors:

qplot(data=diamonds, y=price/carat, x=color, geom = 'boxplot', 
      color = I('black'), fill = I('#099DD9'))

#what carat size has freq greater than 2000 (use freqpoly) - important to adjust binwidth!
qplot(data=diamonds, x=carat, geom = 'freqpoly', binwidth=0.001)


