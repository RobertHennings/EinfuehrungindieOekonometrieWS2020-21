#Übung Nr.5 Kurs Einführung in die Ökonometrie WiSe 2020/21
#Aufgabe Nr1

#a) Modell mit Ausreißer noch enthalten (100,10)
Geschwindigkeit<-c(20, 30, 50, 80, 100)
Bremsweg<-c(5, 10, 25, 60, 10)

mod1<-lm(Bremsweg~Geschwindigkeit)
summary(mod1)

#b) Modell ohne Ausreißer

Geschwindigkeit2<-c(20, 30, 50, 80)
Bremsweg2<-c(5, 10, 25, 60)

mod2<-lm(Bremsweg2~Geschwindigkeit2)
summary(mod2)

#c) Modell mit korrigiertem Ausreißer (100,100)
Geschwindigkeit3<-c(20, 30, 50, 80, 100)
Bremsweg3<-c(5, 10, 25, 60, 100)

mod3<-lm(Bremsweg3~Geschwindigkeit3)
summary(mod3)

#Nun die Daten jeweils plotten, alle drei Regressionsgeraden dazu
plot(Geschwindigkeit[-5],
     Bremsweg[-5],
     pch = 20,
     ylim = c(0, 110),
     xlim = c(0,110),
     ylab = "Bremsweg in m",
     xlab = "Geschwindigkeit in km/h")
points(100, 10, pch = 20, col = "red")
points(100, 100,pch = 20, col ="darkred")

#Drei Regressionslinien noch hinzufügen
abline(mod1, col = "red")
abline(mod2, col ="black")
abline(mod3, col= "blue")
#Interpretation
#Die erste Linie (rot) des ersten Modells in der der Ausreißer enthalten ist bildet keine gute Regression
#Es wird der Zusammenhang für höhere Geschwindigkeiten deutlich unterschätzt
#Die zweite Linie (schwarz) bildet schon eine bessere Annäherung auch für die höheren Geschw.
#Augenscheinlich wird durch das Weglassen eine gute Annäherung erzielt
#Die dritte Linie (blau) überschätzt leicht den Bremsweg in den höheren Geschwindigkeiten
#Dort wurde der Ausreißer korrigiert

#d) 
summary(mod1)$r.squared
summary(mod2)$r.squared
summary(mod3)$r.squared
#0.1813614
#0.9787645
#0.9602989
#Zweites Modell bietet bestes Ergebnis mit Herauslassen des Ausreßers


#e)
#Idee 
#Bei einer Geschwindigkeit von 0 km/h sollte der Bremsweg auch 0m betragen, Achsenabschnitt weglassen
#Zusammenhang scheint mehr quadratisch statt linear, also Geschwindigkeit^2 als Regressor nutzen
mod4<-lm(Bremsweg2~I(Geschwindigkeit2)^2-1)
summary(mod4)$r.squared
#0.9376268


#Hausaufgabe
Bremsweg_fitted<-fitted(mod4)
lines(Geschwindigkeit2, Bremsweg_fitted, col = "blue", lwd=3)
points(Geschwindigkeit2, Bremsweg_fitted, col ="black", pch = 20)

