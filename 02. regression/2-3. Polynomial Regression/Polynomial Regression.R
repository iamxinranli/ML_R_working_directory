# Data Preprocessing Template

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


#Fitting Linear Regression to the dataset
lin_reg = lm(formula =  Salary ~ .,
             data = dataset)
summary(lin_reg)

#Fitting Polynomial Regression to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
# back from step Visulizing add dataset$Level4 = dataset$Level^4
dataset$Level4 = dataset$Level^4

poly_reg = lm(formula =  Salary ~ .,
              data = dataset)
summary(poly_reg)

#Visualizing the Linear Regression Results
 library(ggplot2)
ggplot()+
  geom_point(aes(x = dataset$Level,y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level,y = predict(lin_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff(Linear Regression)')+
  xlab('Level')+
  ylab('Salary')
             

#Visualizing the Polynomial Regression Results
ggplot()+
  geom_point(aes(x = dataset$Level,y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level,y = predict(poly_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff(Polynomial Regression)')+
  xlab('Level')+
  ylab('Salary')

# to add add a new degree to see how this model can still be much improved 
#and almost passing by all the points very accurately as we add more degrees.
# back to the Fitting Polynomial Regression to the dataset
# execute above again
#see the plots

#Predicting a new result(6,5) with Linear regression
y_pred = predict(lin_reg, data.frame(Level = 6.5) )


#Predicting a new result with Ploynomial regression
y_pred = predict(poly_reg, data.frame(Level = 6.5,
                                      Level2 = 6.5^2,
                                      Level3 = 6.5^3,
                                      Level4 = 6.5^4) )
