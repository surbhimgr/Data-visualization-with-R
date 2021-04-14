library(ggplot2)
#q1
p=ggplot(data=mpg,aes(x=hwy,y=cyl))
p+geom_point()
#q2
p=ggplot(data=mpg,aes(x=class,y=drv))
p+geom_point()
#q3
ggplot(data=mpg)+geom_point(mapping = aes(x=displ,y=hwy,color="blue"))
#color of the graph is red as it has taken color as an object and it tries to make plot between color and blue
#q4
ggplot(data=mpg)+geom_point(mapping = aes(hwy,cty,color=cyl,size=hwy,shape=drv))
#in continous variable scale is shown and for categorical variable category name is shown
#q5
ggplot(data=mpg)+geom_point(mapping = aes(x=hwy,y=cyl,color=displ,size=cyl))
#q6
ggplot(data=mpg)+geom_point(mapping = aes(x=hwy,y=cyl,color=displ<5))
#q7
ggplot(data=mpg)+geom_point(mapping=aes(x=drv,y=cyl))+facet_grid(drv~cyl)
#empty grid means there is no data fro the combination
#q8
ggplot(data=mpg)+geom_point(mapping = aes(x=displ,y=hwy))+facet_grid(drv~.)
ggplot(data=mpg)+geom_point(mapping = aes(x=displ,y=hwy))+facet_grid(.~cyl)
#x~. plots the attribute without a y attribute means the plot will be shown row wise and vice versa
#q9
ggplot(data=mpg,mapping=aes(x=displ,y=hwy))+geom_point()+geom_smooth()
ggplot()+geom_point(data=mpg,mapping=aes(x=displ,y=hwy))+geom_smooth(data = mpg,mapping = aes(x=displ,y=hwy))
#both graph looks same because the imformation provided to ggplot in the first plot is same as in the layers of 2nd plot
#q10
ggplot(mpg,aes(displ,hwy))+geom_jitter()+geom_smooth()
ggplot(mpg,aes(displ,hwy))+geom_point()+geom_smooth()
ggplot(mpg,aes(displ,hwy,color=drv))+geom_jitter()+geom_smooth()
ggplot(mpg,aes(displ,hwy,color=drv))+geom_point()+geom_smooth()
ggplot(mpg,aes(displ,hwy))+geom_point(mapping=aes(color=drv))+geom_smooth(se=FALSE,mapping=aes(linetype=drv))
ggplot(data=mpg,mapping=aes(x=displ,y=hwy))+geom_point(mapping=aes(color=drv))+geom_point(shape=21,color="white",stroke=2)
