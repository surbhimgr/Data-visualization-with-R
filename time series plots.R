#queries--
#1. Install a package named “astsa”.
#2. Check the details of the package and its utility.
#3. Load “JJ” data given in the package.
#4. Install histogram of the data.
#5. Install QQplot of the data
#6. Try to beautify it.
#7. Can we do a Box Plot here?
#8. Plot a graph with multiple line charts of different colours , each line will show the per
#share earning of JJ of different quarters.
#9. Do the example 8 for area chart also.
#10. Try to use both qplot() and ggplot () libraries for all the plots from question 4 to 10


install.packages("astsa") #install astsa package
??astsa  #view package details

data(jj) #load jj data
help(jj)
View()

df=data.frame(jj) #converting it to dataframe
df
library(ggplot2)
a=ggplot(df,aes(jj))
#plot the histogram
a+geom_histogram()

#qqplot
qqnorm(jj)

#beautify
a+geom_histogram(color="dark blue",fill="light blue")

#boxplot
a+geom_boxplot()


#q8
a+geom_density()

#area curve
a+geom_area(stat="bin")
