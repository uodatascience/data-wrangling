# mtcars is a built-in data set
lmfit1 <- lm(mpg ~ wt, mtcars)
lmfit1
summary(lmfit1)

library(broom)
tidy(lmfit1)
glance(lmfit1)

lmfit2 <- update(lmfit1,~.+ cyl)
lmfit3 <- update(lmfit2,~.+ wt:cyl)
rbind(glance(lmfit1),
      glance(lmfit2),
      glance(lmfit3))
