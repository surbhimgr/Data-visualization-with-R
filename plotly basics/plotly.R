. library(magrittr) . library(tidyverse) . library(tibble) . library(dplyr) . library(plotly) . state <- data.frame(state.x77, state.region, state.abb) %>%   rename(Region = state.region) %>%   rownames_to_column("State") . head(state) . fv <- state %>% lm(Murder~Income, .) %>% fitted.values()
#1
p1=plot_ly(data=state,x=~Income, y=~Murder,type = "scatter",mode="markers",text=~paste(State,"Income:",Income,'Muder Rate:',Murder))%>% add_trace(x=~Income,y=fv,mode="lines")%>% layout(yaxis=list(title="Murder Rate"),showlegend=F)
p1%>% layout(title="Murder Rate VS Income")

#2
g1=ggplot(data = state,aes(x=Income,y=Murder))+geom_point(aes(text=State))+geom_smooth(method=Im,se=FALSE)+labs(y="Murder rate")
ggplotly(g1+labs(title = "Murder Rate VS Income"), tooltip = c("text","Income","Murder"))


#3
state %>%
  split(.$Region) %>%
  lapply(function(d) plot_ly(d,x=~Income,y=~Murder,color = ~Region)) %>%
  lapply(function(l) layout(l,xaxis=list(range=c(3000,5500)), yaxis=list(range=c(1,12)), title="Subplot:Murder rate vs Income")) %>%
  subplot(nrows = 2,shareX = TRUE,shareY = TRUE)

#4
g2=ggplot(data = state,aes(x=Income,y=Murder))+
  geom_point(aes(color=Region,text=State))+
  facet_wrap(~Region,nrow = 2)+
  labs(title = "Subplot:Murder rate vs Income")

ggplotly(g2,tooltip = c("text","Income","Murder"))


#5
p3 <- plot_ly(state, x = ~reorder(Region, -Income, median), y = ~Income, text = ~paste(State, "<br>Income: ", Income)) %>% 
  add_boxplot(type = "box", name = "Whiskers and Outliers", boxpoints = 'outliers', showlegend = FALSE)

subplot(p3, p1) %>% 
  layout(showlegend = FALSE, annotations = list(list(x = 0.1 , y = 1.05, text = "1974 US Income Per Capita", showarrow = F, xref='paper', yref='paper'), list(x = 0.9 , y = 1.05, text = "Murder Rate VS Income", showarrow = F, xref='paper', yref='paper')))


#6
p4 <- plot_ly() %>% 
  add_lines(data = state, x = ~reorder(State,Murder), y = ~Illiteracy, name = "Illiteracy Rate") %>% 
  add_lines(data = state, x = ~reorder(State,Murder), y = ~Life.Exp, name = "Life Expection",yaxis = 'y2') %>% 
  layout(title = "Correlation between Murder Rate and Illiteracy VS Life Expection", xaxis = list(title="States (Sort by Murder Rate from low to high)"), yaxis = list(tickfont= list(color = '#1f77b4', size=11), color='#1f77b4', range=c(0,4), title="Illiteracy Rate"), yaxis2 = list(overlaying = "y", side = "right", tickfont = list(color = '#ff7f0e', size=11), color='#ff7f0e', range=c(67.8,73.8),  title = "Life Expection"), legend = list(x = 1.05, y = 0.9)
       
         
#7
g4 <- ggplot(state, aes(x = reorder(State, Murder), label = Murder, label1 = Illiteracy, label2 = Life.Exp))+ geom_line(aes(y = Illiteracy, colour = "Illiteracy Rate",               text = paste(State, '<br>Murder Rate:', Murder, '<br>Illiteracy:', Illiteracy),     group=1))+ geom_line(aes(y = (Life.Exp-67.8)/1.5, colour = "Life Expection",               text = paste(State, '<br>Murder Rate:', Murder, '<br>Life.Exp:', Life.Exp), group=1))+ scale_y_continuous(sec.axis = sec_axis(~.*1.5+67.8, name = "Life Expection"))+ labs(title = "Correlation between Murder Rate and Illiteracy VS Life Expection", y = "Illiteracy Rate",        x = "States (Sort by Murder Rate from low to high)", colour = "Comparison")+   theme(axis.text.x = element_text(angle = 270, hjust = 1),         axis.text.y = element_text(colour = "#F8766D"),         axis.title.y = element_text(colour = "#F8766D"))
ggplotly(g4,tooltip = 'text') %>%   add_lines(data=state, x=~reorder(State, Murder), y=~Life.Exp, colors=NULL, yaxis="y2", inherit=FALSE, showlegend = FALSE) %>%   layout(yaxis2 = list(overlaying = "y", side = "right", tickfont = list(color = '#00BFC4', size=11), color = '#00BFC4', title = "Life Expection"),          legend = list(x = 1.05, y = 0.95))


