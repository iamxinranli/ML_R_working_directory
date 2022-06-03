#Decision Tree Regression

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


#Fitting Decision Tree Regression to the dataset
#install.packages('rpart')
library(rpart)
regressor = rpart(formula = Salary ~ .,
                  data = dataset,
                  control = rpart.control(minsplit = 1))


#Predicting a new result with regression
y_pred = predict(regressor, data.frame(Level = 6.5))

#Visualizing the Decision Tree Regression Results
library(ggplot2)
ggplot()+
  geom_point(aes(x = dataset$Level,y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level,y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff(Decission Tree Regression)')+
  xlab('Level')+
  ylab('Salary')

#1. Visualizing the Decision tree Regression Results
library(ggplot2)

ggplot()+
  geom_point(aes(x = dataset$Level,y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level,y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff(Decision tree Regressionl)')+
  xlab('Level')+
  ylab('Salary')

#2.Visualizing the Decision tree Regression Results(for higher resolution and smoother curve)
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Decision tree Regression)') +
  xlab('Level') +
  ylab('Salary')

#3.Visualizing the Decision tree Regression Results(for MORE higher resolution and smoother curve)
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Decision tree Regression)') +
  xlab('Level') +
  ylab('Salary')


