##confounding variable example
g<-read.csv("confounder.csv")

library(ggplot2)
library(hrbrthemes)

y1<-lm(Shark_Attack~Ice_Cream_Sale,data=g)
summary(y1)


ggplot(g, aes(Ice_Cream_Sale, Shark_Attack))+geom_point(size=10,color='blue',alpha=0.25)+  geom_abline(intercept = -2.018480, slope = 0.030195,linetype = 'dashed',size=5)+
  xlab('Monthly Ice Cream Sales (in Thousand Gallons)') + ylab('Monthly Shark Attacks')+
  theme(axis.title.y = element_text(size = 40))+theme(axis.title.x = element_text(size = 40))+
  theme(axis.text.x = element_text(face="bold", size=30),
        axis.text.y = element_text(face="bold", size=30))+
  scale_y_continuous(breaks=seq(0,10,2))+
                       scale_x_continuous(breaks=seq(0,400,50))+
  annotate('text',size=15, x = 180, y = 9.5, label = 'Monthly Shark Attacks = -2.02 + 0.03 * Monthly Ice Cream Sales',alpha=0.5)


#Some constants
coeff <- 30
SA_color <- "#68b3a2"
IC_color <- rgb(0.2, 0.6, 0.9, 1)

ggplot(g, aes(x=Month)) +
  geom_line( aes(y=Shark_Attack),size=2, color=SA_color) + 
  geom_line( aes(y=Ice_Cream_Sale/30),size=2, color=IC_color) + 
  scale_y_continuous(
    # Features of the first axis
    name = "Count of Monthly Shark Attacks",
    # Add a second axis and specify its features
    sec.axis = sec_axis(~.*coeff, name="Monthly Ice Cream Sales (in Thousand Gallons)")
  )+
  scale_x_continuous(breaks=seq(0,12,1))+
  theme_ipsum( axis_title_just = "ct") +
  
  theme(
    axis.title.y = element_text(color = SA_color, size=40), 
    axis.title.y.right = element_text(color = IC_color, size=40),
    axis.text.x = element_text(face="bold", size=30),
    axis.text.y = element_text(face="bold", size=30),
    axis.text.y.right = element_text(face="bold", size=30),
    axis.title.x = element_text(size = 40)
    )
