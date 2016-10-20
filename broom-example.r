library(knitr)
library(dplyr) 
# mtcars is a built-in data set
lmfit1 <- lm(mpg ~ wt, mtcars)
lmfit1
summary(lmfit1)

# 'tidy' and 'glance' are functions of the 'broom' package, which you will need to install if you don't have it.
# install.packages("broom")
library(broom)
# tidy makes a dataframe of coefficients.
tidy(lmfit1) %>% kable(digits=2)
# glance makes a one-row dataframe with statistics for the overall model (r-squared, aic, bic, etc.)
glance(lmfit1) %>% kable(digits=2)

# update is a base R function that lets you update regression models (add predictors).
# You can see that I am adding a predictor, "cyl," and creating a new regression model with it, "lmfit2."
# 'lmfit3' just adds the interaction effect. 
lmfit2 <- update(lmfit1,~.+ cyl)
lmfit3 <- update(lmfit2,~.+ wt:cyl)

# rbind is base R for "bind these dataframes together vertically." 'cbind' connects dataframes together horizontally.
rbind(glance(lmfit1),
      glance(lmfit2),
      glance(lmfit3)) %>% kable(digits=2)
