#Hausaufgabe 08.12.2020 Robert Hennings
#~


#a) Modell mit Ausreißer noch enthalten (100,10)
Geschwindigkeit<-c(20, 30, 50, 80, 100)
Bremsweg<-c(5, 10, 25, 60, 10)

mod1<-lm(Bremsweg~Geschwindigkeit)


#b) Modell ohne Ausreißer

Geschwindigkeit2<-c(20, 30, 50, 80)
Bremsweg2<-c(5, 10, 25, 60)

mod2<-lm(Bremsweg2~Geschwindigkeit2)


#c) Modell mit korrigiertem Ausreißer (100,100)
Geschwindigkeit3<-c(20, 30, 50, 80, 100)
Bremsweg3<-c(5, 10, 25, 60, 100)

mod3<-lm(Bremsweg3~Geschwindigkeit3)

#Konstruktion eines verbesserten Modells 
#Verbessertes quadratisches Modell nehmen 
#Korrigierten Datensatz verwenden 
Geschwindigkeit3
Bremsweg3
Geschwindigkeit4<-c(Geschwindigkeit3^2) #Quadratische Umwandlung erzeugen 
mod4<-lm(Bremsweg3~(Geschwindigkeit4)-1) #I verwenden, I benutzen as is um Operator ^ als arithmetisch zu nutzen
#Ohne Konstante rechnen mit den Möglichkeiten y ∼ x − 1 oder y ∼ x + 0.
summary(mod4)

#Vergleich nochmal der geschätzten Werte und der tatsächlichen Werte 
fitted.values(mod4)
Bremsweg3
Bremsweg_fitted<-fitted(mod4) #Variablenzusweisung


#Nun die Daten jeweils plotten, alle drei Regressionsgeraden dazu
plot(Geschwindigkeit[-5],
     Bremsweg[-5],
     pch = 20,
     ylim = c(0, 110),
     xlim = c(0,110),
     ylab = "Bremsweg in m",
     xlab = "Geschwindigkeit in km/h",
     main ="Zusammenhang Bremsweg in m und Geschwindigkeit in m/s")
points(100, 10, pch = 20, col = "red") #Punkte werden einzeln nochmal hinzugefügt
points(100, 100,pch = 20, col ="darkred")

#Drei Regressionslinien noch hinzufügen
abline(mod1, col = "red")
abline(mod2, col ="black")
abline(mod3, col= "blue")

#Graphikparamter festlegen für quadratisches Modell, diese werden gesondert eingefügt 
#Bessere Annäherung mit curve() Funktion
f=function(x) mod4$coefficient*x^2
curve(f, from = 0, to = 110, add = T, col = "green", lwd=3)
points(Geschwindigkeit3, Bremsweg_fitted, col ="black", pch = 20) #Geschätzte Werte werden verwendet, die als schwarze Punkte  


#Legende zur Übersichtlichkeit
legend("topleft",
       legend = c("mod1",
                  "mod2",
                  "mod3",
                  "mod4"),
       lty = c(1, 1, 1, 1),
       col = c("red", "black", "blue", "green"),
       lwd = 2)



#Erklärung zur Benutzung von I()
#Möglichkeit 1)
Geschwindigkeit3
Bremsweg3
Geschwindigkeit4<-c(Geschwindigkeit3^2) #Quadratische Umwandlung erzeugen 
mod4<-lm(Bremsweg3~(Geschwindigkeit4-1)) #I verwenden, I benutzen as is um Operator ^ als arithmetisch zu nutzen
summary(mod4)

#Möglichkeit 2)
#So ist richtige Benutzung mit Klammersetzung
mod5<-lm(Bremsweg3~I((Geschwindigkeit3)^2)-1)
summary(mod5)
#Wenn I falsch benutzt oder Klammern falsch gesetzt wird falsches ergebnis produziert


#Erklärung I(x)
#I als AsIs des x im Bereich des Formelausdrucks, da Operator ^ sonst anders interpretiert wird
# ^ ist in einer Formel ein Spezialzeichen
?formula
#The ^ operator indicates crossing to the specified degree. 
#For example (a+b+c)^2 is identical to (a+b+c)*(a+b+c) which in turn expands to a formula 
#containing the main effects for a, b and c together with their second-order interactions.
#Möglichkeit 3)
3**2
#Achtung ebenso wenn nicht ^sondern ** genutzt wird!
mod6<-lm(Bremsweg3~I((Geschwindigkeit3)**2)-1) #I muss gesetzt werden
summary(mod6)