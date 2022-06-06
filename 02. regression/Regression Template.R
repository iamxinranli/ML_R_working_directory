#Regression Template

# Importing the dataset
#dataset = dataset[2:3](means only keep the 2,3 columns )

dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
#library(caTools)
#set.seed(123)
#split = sample.split(dataset$DependentV SplitRatio = 0.8
#training_set = subset(dataset, split == TRUE)
#test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)


#Fitting Regression to the dataset
#Create your regressor here

#dataset$Level2 = dataset$Level^2
#dataset$Level3 = dataset$Level^3
#dataset$Level4 = dataset$Level^4
#e.g. poly_reg = lm(formula =  Salary ~ .,
#              data = dataset)
#e.g. lin_reg = lm(formula =  Salary ~ .,
#             data = dataset)
#summary(lin_reg)
#summary(poly_reg)

#Predicting a new result with regression
y_pred = predict(regressor, data.frame(Level = 6.5))

#1. Visualizing the Regression Results
library(ggplot2)

ggplot()+
  geom_point(aes(x = dataset$Level,y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level,y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff(Regression Model)')+
  xlab('Level')+
  ylab('Salary')

#2.Visualizing the Regression Results(for higher resolution and smoother curve)
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') +
  ylab('Salary')

#3.Visualizing the Regression Results(for MORE higher resolution and smoother curve)
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') +
  ylab('Salary')


