#Übung Nr.4 Kurs Einführung in die Ökonometrie WiSe 2020/21
#Aufgabe Nr1

#a)
#Einfache lineare Regression 
x<-c(20, 30, 50, 80, 100)
y<-c(5, 10, 25, 60, 10)

#Erstmal visualisieren als Streudiagramm
plot(x,y,
     xlim = c(0, 120),
     ylim = c(0, 80),
     pch = 19,  #füllt die einzelnen Punkte auch komplett aus, cex steuert die Punktegröße
     xlab = "Geschwindigkeit in km/h",
     ylab = "Bremsweg in m",
     main = "Zusammenhang Bremsweg und Geschwindigkeit")
#Als Vereinfachung hätte auch plot(x,y) ausgereicht

plot(x,y)
#Lineare Regression mit Funktion lm()

fm<-lm(y ~ x);fm
#Coefficients:
##(Intercept)            x  
##6.0177       0.2854  

#Abrufen der vom Modell geschätzten Werte:
fitted.values(fm)

# 1        2        3        4        5 
##11.72566 14.57965 20.28761 28.84956 34.55752 """
#Abrufen der Residuen (Abweichung geschätzter Wert vom tatsächlichen)

residuals(fm)
#  1          2          3          4          5 
#-6.725664  -4.579646   4.712389  31.150442 -24.557522 """

#Plotten der Ergebnisse
plot(x,y,
     xlim = c(0, 120),
     ylim = c(0, 80),
     pch = 19,  #füllt die einzelnen Punkte auch komplett aus, cex steuert die Punktegröße
     xlab = "Geschwindigkeit in km/h",
     ylab = "Bremsweg in m",
     main = "Zusammenhang Bremsweg und Geschwindigkeit")
abline(fm, col="red") #Regressionsgerade einzeichnen


#b)
#Überprüfen ob Residuen sich zu 0 summieren
res<-sum(residuals(fm));res
#-1.776357e-15

#c)
#Regerssionsfunktion angeben:
reg<-function(x){
  ergeb<-6.017+0.2854*x
}
b<-reg(60);b
#23.141

über<-data.frame(x,y,fitted.values(fm));über
names(über)<-c("Geschwindigkeit", "Bremsweg", "Geschätzte Werte")
über

#d)
summary(fm)
##Residuals:
##      1       2       3       4       5 
## -6.726  -4.580   4.712  31.150 -24.558 

##Coefficients:
##            Estimate Std. Error t value Pr(>|t|)
##(Intercept)   6.0177    22.2513   0.270    0.804
##x             0.2854     0.3501   0.815    0.475

##Residual standard error: 23.54 on 3 degrees of freedom
##Multiple R-squared:  0.1814,	Adjusted R-squared:  -0.09152 
##F-statistic: 0.6646 on 1 and 3 DF,  p-value: 0.4746"""
