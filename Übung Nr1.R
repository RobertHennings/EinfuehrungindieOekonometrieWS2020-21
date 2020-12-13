#Übung Nr.1 Kurs Einführung in die Ökonometrie 

phi <-0
f0 <- 1
f <- function(f0) (f0*phi)+f0
f0 <- f

plot(f,
     xlab ="Zeitpunkte",
     main ="Wachstum")

  

phi <-0.5
f0 <- 1
f <- function(f0) (f0*phi)+f0
f0 <- f

plot(f,
     xlab ="Zeitpunkte",
     main ="Wachstum")

phi <-1
f0 <- 1
f <- function(f0) (f0*phi)+f0
f0 <- f

plot(f,
     xlab ="Zeitpunkte",
     main ="Wachstum")


phi <-2
f0 <- 1
f <- function(f0) (f0*phi)+f0
f0 <- f

plot(f,
     xlab ="Zeitpunkte",
     main ="Wachstum")


phi<-2
f0<-1
n <-30
for(i in 0:n)
  f <- function(f0) (f0*phi)+f0
  print(f)
  f0 <- f
  plot(f,i,
     xlab ="Zeitpunkte",
     main ="Wachstum")

  