#Hausaufgabe 25.11.2020 Robert Hennings
#a)
#Datensatz einlesen mit read.csv2 oder load
load("/Users/Robert_Hennings/Dokumente/Uni/5.Semester/Einführung in die Ökonometrie/R-Code-20201102/CASchools.Rdata")
#b)
summary(CASchools)
#c)
#Lineare Regression anwenden
fm<-lm(CASchools$math ~ CASchools$STR)
summary(fm)
#d)
#Zuerst Zusammenfassung zum Überblick plotten
plot(fm)


plot(x = CASchools$STR,
     y= CASchools$math,
     xlab = "STR",
     ylab = "Math_Testscore")

#Daten zusammen mit Regressionsgrade, Datenpunkte leicht verändert für Ansicht
plot(CASchools$STR, CASchools$math, pch = 19,
     xlab = " STR Ratio",
     ylab = "Testscores in Math",
     main = "Zusammenhang zwischen Klassengrößen und Testergebnissen")
abline(fm, col = "red")
