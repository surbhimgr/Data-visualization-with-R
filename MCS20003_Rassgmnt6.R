#a)
data=read.csv("WA.csv")
library(ggplot2)
ggplot(data,aes(x=data$JobRole,y=data$MonthlyIncome,color=data$Attrition))+geom_jitter()+theme_light()

#b)
library(dplyr)
library(gridExtra)
p1=ggplot(data,aes(x = DistanceFromHome, fill = Attrition)) + geom_density(alpha = 0.5) + ggtitle("Distance From Home")  + theme(plot.title = element_text(size =10),axis.text.x = element_text(size =8,angle = 45, hjust = 1),axis.title.x=element_blank())
p2= dataset %>%
  +     group_by(EnvironmentSatisfaction) %>%
  +     summarise(counts = n()) %>%
  +     ggplot(aes(x = as.factor(EnvironmentSatisfaction), y = counts)) + geom_bar(stat = 'identity', fill = "coral1") + ggtitle("Environment Satisfaction") + geom_text(aes(label=counts), size = 3, position=position_dodge(width=0.2), vjust=-0.5) + theme(plot.title = element_text(size =8),axis.text.x = element_text(size =10,angle = 45, hjust = 1),axis.title.x=element_blank()) + scale_y_continuous(limits = c(0, 500))
p3=data %>%
  +     group_by(JobInvolvement) %>%
  +     summarise(counts = n()) %>%
  +     ggplot(aes(x = as.factor(JobInvolvement), y = counts)) + geom_bar(stat = 'identity', fill = "coral1") + ggtitle("Job Involvement") +geom_text(aes(label=counts), size = 3, position=position_dodge(width=0.2), vjust=-0.5)+ theme(plot.title = element_text(size =10),axis.text.x = element_text(size =8,angle = 45, hjust = 1),axis.title.x=element_blank()) + scale_y_continuous(limits = c(0, 900))
p4=data %>%
  +     group_by(JobSatisfaction) %>%
  +     summarise(counts = n()) %>%
  +     ggplot(aes(x = as.factor(JobSatisfaction), y = counts)) + geom_bar(stat = 'identity', fill = "coral1") + ggtitle("Job Satisfaction") +geom_text(aes(label=counts), size = 3, position=position_dodge(width=0.2), vjust=-0.5) + theme(plot.title = element_text(size =10),axis.text.x = element_text(size =8,angle = 45, hjust = 1),axis.title.x=element_blank()) + scale_y_continuous(limits = c(0, 500))
grid.arrange(p1, p2, p3, p4, nrow = 2)