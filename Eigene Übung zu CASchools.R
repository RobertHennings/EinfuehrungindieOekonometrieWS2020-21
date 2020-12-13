#Eigene Übung zum Kurs Einführung in die Ökonometrie WiSe 2020/21
#Datensatz einladen
load("/Users/Robert_Hennings/Dokumente/Uni/5.Semester/Einführung in die Ökonometrie/R-Code-20201102/CASchools.Rdata",verbose = T)

#Vermutung: Zusammenhang zwischen Test Score und Income
#Lineares Modell

mod1<-lm(CASchools$income~CASchools$math)
summary(mod1)

plot(mod1)


#Zusammenhang Plotten mit Linie der Regression
plot(CASchools$math, CASchools$income, pch = 19,
     xlab = "Mathe Scores",
     ylab = "Einkommen",
     main = "Zusammenhang zwischen Einkommen und Testergebnissen")
abline(mod1, col = "red")
