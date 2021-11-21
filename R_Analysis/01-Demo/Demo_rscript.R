library(jsonlite)

demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)


demo_table2 <- fromJSON(txt='demo.json')

#if you want code from the ggplot use notes or go back to module

ggplot(mtcars,aes(x=wt)) + geom_density() #visualize distribution using density plot

#below is the module code for running statistical tests

shapiro.test(mtcars$wt)

population_table <- read.csv('used_car_data.csv',check.names = F,stringsAsFactors = F) #import used car dataset

plt <- ggplot(population_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2

plt + geom_density() #visualize distribution using density plot

sample_table <- population_table %>% sample_n(50) #randomly sample 50 data points

plt <- ggplot(sample_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2

plt + geom_density() #visualize distribution using density plot

t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven))) #compare sample versus population means

sample_table <- population_table %>% sample_n(50) #generate 50 randomly sampled data points

sample_table2 <- population_table %>% sample_n(50) #generate another 50 randomly sampled data points

t.test(log10(sample_table$Miles_Driven),log10(sample_table2$Miles_Driven)) #compare means of two samples

t.test(log10(sample_table$Miles_Driven),log10(sample_table2$Miles_Driven)) #compare means of two samples

mpg_data <- read.csv('mpg_modified.csv') #import dataset

mpg_1999 <- mpg_data %>% filter(year==1999) #select only data points where the year is 1999

mpg_2008 <- mpg_data %>% filter(year==2008) #select only data points where the year is 2008

t.test(mpg_1999$hwy,mpg_2008$hwy,paired = T) #compare the mean difference between two samples

mtcars_filt <- mtcars[,c("hp","cyl")] #filter columns from mtcars dataset

mtcars_filt$cyl <- factor(mtcars_filt$cyl) #convert numeric column to factor

aov(hp ~ cyl,data=mtcars_filt) #compare means across multiple levels

summary(aov(hp ~ cyl,data=mtcars_filt)) #use summary() to get the p-value in the output

#below is notes on finding correlation and r values

plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2
plt + geom_point() #create scatter plot
cor(mtcars$hp,mtcars$qsec) #calculate correlation coefficient

used_cars <- read.csv('used_car_data.csv',stringsAsFactors = F) #read in dataset
head(used_cars)
plt <- ggplot(used_cars,aes(x=Miles_Driven,y=Selling_Price)) #import dataset into ggplot2
plt + geom_point() #create a scatter plot


used_matrix <- as.matrix(used_cars[,c("Selling_Price","Present_Price","Miles_Driven")]) #convert data frame into numeric matrix
cor(used_matrix)

lm(qsec ~ hp,mtcars) #create linear model
summary(lm(qsec~hp,mtcars)) #summarize linear model

lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars) #generate multiple linear regression model
summary(lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars)) #generate summary statistics

# perform a chi-squared test
tbl <- table(mpg$class,mpg$year) #generate contingency table
chisq.test(tbl) #compare categorical distributions


