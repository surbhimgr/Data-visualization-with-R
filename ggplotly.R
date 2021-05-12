library(magrittr)
library(tidyverse)
library(tibble)
library(dplyr)
library(plotly)
state <- data.frame(state.x77, state.region, state.abb) %>%   rename(Region = state.region) %>%   rownames_to_column("State")
head(state)
fv <- state %>% lm(Murder~Income, .) %>% fitted.values()
p1 <- plot_ly(data = state, x = ~Income, y = ~Murder,type = "scatter", mode = "markers",text = ~paste(State, "Income: ", Income, 'Murder Rate:', Murder))%>%   add_trace(x = ~Income, y = fv, mode = "lines") %>%  layout(yaxis=list(title="Murder Rate"),showlegend=F)
p1 %>% layout(title="Murder Rate Vs Income")



g1 <- ggplot(data = state, aes(x = Income, y = Murder))+
  geom_point(aes(text = State))+
  geom_smooth(method = lm, se = FALSE)+
  labs(y = "Murder Rate")

ggplotly






state %>%
  split(.$Region) %>%
  lapply(function(d) plot_ly(d, x = ~Income, y = ~Murder, color = ~Region)) %>%
  lapply(function(l) layout(l, xaxis = list(range = c(3000, 5500)), 
                            yaxis = list(range = c(1, 12)),
                            title = "Subplot: Murder Rate VS Income")) %>% 
  subplot(nrows = 2, shareX = TRUE, shareY = TRUE)



g2 <- ggplot(data = state, aes(x = Income, y = Murder))+
  geom_point(aes(color = Region,text = State))+
  facet_wrap(~Region, nrow = 2)+
  labs(title = "Subplot: Murder Rate VS Income")
ggplotly(g2, tooltip = c("text", "Income", "Murder"))



p3 <- plot_ly(state, x = ~reorder(Region, -Income, median), y = ~Income, 
              text = ~paste(State, "<br>Income: ", Income)) %>%
  add_boxplot(type = "box", name = "Whiskers and Outliers", boxpoints = 'outliers', showlegend = FALSE)

subplot(p3, p1) %>% layout(showlegend = FALSE,
                           annotations = list(
                             list(x = 0.1 , y = 1.05, text = "1974 US Income Per Capita", showarrow = F, xref='paper', yref='paper'),
                             list(x = 0.9 , y = 1.05, text = "Murder Rate VS Income
", showarrow = F, xref='paper', yref='paper')))
