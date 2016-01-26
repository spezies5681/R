# 0. Visualize
pairs(~Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data=iris)

# 1. Make test and control sets. 
set.seed(42)
control_set <- sample(seq_len(nrow(iris)), size = floor(0.75*nrow(iris)))
test_set <- iris[-control_set, ]
training_set <- iris[control_set, ]

# 2. Build a linear model on test set
mdl <- lm(formula = Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width,
          data = training_set)
print(summary(mdl))

mdl2 <- lm(formula = Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species,
          data = training_set)
print(summary(mdl2))
# 3. For each feature, plot the feature vs. label for the test set (green)
# and train set(blue), and also plot a line that shows the model predictions

plots_against_humanity <- function(feature)
{
  plot(training_set$Sepal.Length, feature, col="blue")
  points(predict(mdl), feature, col="red")
}

for (i in list(training_set$Petal.Width, 
            training_set$Petal.Length, 
            training_set$Sepal.Width))
{
  plots_against_humanity(i)
}
# 4. evaluate on test set
# 5. see if predictions are less good on test set. 

#For tomorrow (1 hour)
# Build a logistic regression model (with glm) to predict if an iris is a setosa, given the measurements
