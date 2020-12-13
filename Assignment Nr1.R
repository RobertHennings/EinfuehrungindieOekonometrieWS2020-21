#1.Assignment Kurs Einführung in die Ökonometrie WiSe 2020/21, Robert Hennings


#a)
fnorm<- function(v, x, m)
  {
  1/(sqrt(v)*sqrt(2*pi))*exp((-(x-m)^2)/(2*v))
  }

#b)
fnorm(1, -1.96, 0)
#0.05844094

fnorm(1, 1.96, 0)
#0.05844094

fnorm(1, 0, 0)
#0.3989423

dnorm(-1.96)
#0.05844094
dnorm(1.96)
#0.05844094
dnorm(0)
#0.3989423

#Überprüfe: -1.96 und 1.96 sind die 0.975 % Wkt Quantile, 0
pnorm(-1.96, mean = 0, sd=1)
pnorm(1.96)
pnorm(0) #ist das Mu bzw Erwartungswert bzw. Mittelwert

#c)
summary(rnorm(1000))
str(rnorm(1000))

