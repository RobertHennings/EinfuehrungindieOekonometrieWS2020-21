#Übung Nr.1 des Kurses Einführung in die Ökonometrie WiSe2020/21
p <- 0.2
t0 <- 1
n <- 10
t <- numeric(n)

wachstum <- function(t0, p, n) {
  
  t[1] <- t0*p+t0 
  
  for(i in 2:n) {
    t[i] <- t[i-1]*p+t[i-1]
  }
  
  print(t)
}

wachstum(1, 0.2, 10)
plot(wachstum(1, 0.2, 10))


p <- 0
t0 <- 1
n <- 10
t <- numeric(n)

wachstum <- function(t0, p, n) {
  
  t[1] <- t0*p+t0 
  
  for(i in 2:n) {
    t[i] <- t[i-1]*p+t[i-1]
  }
  
  print(t)
}

wachstum(1, 0, 10)
plot(wachstum(1, 0.2, 10))

p <- 0.5
t0 <- 1
n <- 10
t <- numeric(n)

wachstum <- function(t0, p, n) {
  
  t[1] <- t0*p+t0 
  
  for(i in 2:n) {
    t[i] <- t[i-1]*p+t[i-1]
  }
  
  print(t)
}

wachstum(1, 0.5, 10)
plot(wachstum(1, 0.2, 10))

p <- 1
t0 <- 1
n <- 10
t <- numeric(n)

wachstum <- function(t0, p, n) {
  
  t[1] <- t0*p+t0 
  
  for(i in 2:n) {
    t[i] <- t[i-1]*p+t[i-1]
  }
  
  print(t)
}

wachstum(1, 1, 10)
plot(wachstum(1, 0.2, 10))


p <- 2
t0 <- 1
n <- 10
t <- numeric(n)

wachstum <- function(t0, p, n) {
  
  t[1] <- t0*p+t0 
  
  for(i in 2:n) {
    t[i] <- t[i-1]*p+t[i-1]
  }
  
  print(t)
}

wachstum(1, 2, 10)
plot(wachstum(1, 2, 10))


