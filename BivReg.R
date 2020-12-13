#library(rockchalk)
library(rgl)

n <- 30
x1 <- rnorm(n)
x2 <- rnorm(n)
y <- 0.03 + .6*x1 + 0.2*x2 + 5*rnorm(n)
dat <- data.frame(x1,x2,y)


## linear ordinary regression
m1 <- lm(y ~ x1 + x2, data = dat)

#plotPlane(m1, plotx1 = "x1", plotx2 = "x2", lcol="lightblue", ticktype = "detailed", npp=30, drawArrows = TRUE)

plot3d(x1,x2,y, type="s", col="salmon", size=1)
coefs <- coef(m1)
a <- coefs["x1"]
b <- coefs["x2"]
c <- -1
d <- coefs["(Intercept)"]
planes3d(a, b, c, d, alpha=0.5)
summary(m1)
