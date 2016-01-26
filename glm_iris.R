# 0. Visualize
pairs(~Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data=iris)

# 0.5 make a copy of iris so you can edit it
iris_copy <- iris

# 1. Add a column to the dataset with the 1/0 label
iris_copy$member = member

# 2. Make test and control sets.
set.seed(42)
control_set <- sample(seq_len(nrow(iris_copy)), size = floor(0.8*nrow(iris_copy)))
test_set <- iris_copy[-control_set, ]
training_set <- iris[control_set, ]

# 3. Train a Logistic Regression on the training set
a <- glm(formula = Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, family = binomial, data = training_set)

# 4. add a column for the probabilities to all the data (the one you made in step 0.5)

# 5. Plot and interpret the ROC curve

