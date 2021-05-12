library(plotly)
data("diamonds",package="ggplot2")
diamonds

#1
plot_ly(diamonds,x=~cut)

#2
plot_ly(diamonds,x=~cut,y=~clarity)

#3
plot_ly(diamonds,x=~cut,color=~clarity,colors = "Accent")

#4
plot_ly(diamonds,x=~cut,color = "black")


#5
plot_ly(diamonds,x=~cut,color = I("red"),stroke = I("black"),span = I(2))

#6
plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length)

#7
plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, type = "scatter",mode = 'markers')

#8
plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length,marker = list(size = 10,color = 'rgba(255, 182, 193, .9)', line = list(color = 'rgba(152, 0, 0, .8)',  width = 2)))
plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length,marker = list(size = 10, color = 'rgba(255, 182, 193, .9)',line = list(color = 'rgba(152, 0, 0, .8)', width = 1)))
plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, marker = list(size = 10, color = 'rgba(255, 182, 193, .5)',line = list(color = 'rgba(152, 0, 0, .8)',width = 2)))

#9
trace_0 <- rnorm(100, mean = 5) trace_1 <- rnorm(100, mean = 0) trace_2 <- rnorm(100, mean = -5) x <- c(1:100)
trace_0 <- rnorm(100, mean = 5)
trace_1 <- rnorm(100, mean = 0)
trace_2 <- rnorm(100, mean = -5)
x <- c(1:100)
data <- data.frame(x, trace_0, trace_1, trace_2)
fig <- plot_ly(data, x = ~x)
fig <- fig %>% add_trace(y = ~trace_0, name = 'trace 0',mode = 'lines')
fig <- fig %>% add_trace(y = ~trace_1, name = 'trace 1', mode = 'lines+markers')
fig <- fig %>% add_trace(y = ~trace_2, name = 'trace 2', mode = 'markers')
fig
#a different approach to plot same as above
fig <- plot_ly(data, x = ~x, y = ~trace_0, name = 'trace 0', type = 'scatter', mode = 'lines')
fig <- fig %>% add_trace(y = ~trace_1, name = 'trace 1', mode = 'lines+markers'
)
fig <- fig %>% add_trace(y = ~trace_2, name = 'trace 2', mode = 'markers')
fig
fig <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, color = ~Species)
fig

#10
plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, color = ~Species, colors = "Set1"
)
#custom color palett for above plot
pal <- c("red", "blue", "green")
fig <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, color = ~Species, colors = pal)

#11
fig=plot_ly(data=iris,x=~Sepal.Length,y=~Petal.Length, type = "scatter", mode="markers", symbol = ~Species, symbols = c("circle","x","o"), color = I("black"),marker=list(size=10))
fig

#12
d <- diamonds[sample(nrow(diamonds), 1000), ]
plot_ly(d,x = ~carat, y = ~price,color = ~carat, size =~carat)
fig <- plot_ly(d, x = ~carat, y = ~price,  text = ~paste("Price: ", price, '$<br>Cut:', cut), color = ~carat, size = ~carat)
fig