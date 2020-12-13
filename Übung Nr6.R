#Übung Nr.6 Kurs Einführung in die Ökonometrie WiSe 2020/21
#Tilde zeichen am MAc mit option+N dann: ~
#Aufgabe Nr3
#Datensatz einlesen
baton<-read.table("/Users/Robert_Hennings/Dokumente/Uni/5.Semester/Einführung in die Ökonometrie/RProgrammeMeine/br.dat")
View(baton)
colnames(baton)
#Variablennamen laut Beschreibung in Datensatz einfügen mit colnames()
colnames(baton)<-c("Price", "sqft", "Bedrooms", "Baths", "Age", "Occupancy", "Pool", "Style", "Fireplace", "Waterfront", "DOM")

#Datensatz zunächst beschreiben, erste Beobachtungen und deskriptive Statistiken
head(baton)
summary(baton)
#Auf NaN checken
is.nan(baton)
#a)
#Schätzen des Koeffizienten der Regression des linearen Modells
mod1<-lm(baton$Price~baton$Age)
mod1
summary(mod1)

#Genau anzeigen lassen aus Regressionsoutput wie sonst auch r.squared:
coef(mod1)

#Konfidenzintervall zunächst händisch nachempfinden
#Anzahl der Beobchtungen im Datensatz
beob<-nrow(baton)
#Anzahl der Koeffizientenist dann:
regr<-2
#Wert des Signifikanzniveaus sei alpha=0.05 also 95% Wkt.
alphamod1<-0.05 

#Alle Beobachtungen abzüglich der zwei geschätzten Werte verwenden daher n-k in dem Sinne:
t.wert<-qt((1-alphamod1)*0.5, beob-regr) #T-Verteilung spezifiziert, an beiden Seiten alpha/2 an Wkt.

baton.coef<-summary(mod1)$coefficients  #Koeffizienten Matrix des Regressionsoutputs verwenden
batondach<-baton.coef[2,1] #Koeffizienten sollen geschätzt werden damit
baton.error<-baton.coef[2,2] #Standardfehler aus der Matrix herauslesen und abspeichern

#Bestimmung der Konfidenzintervalle:
c(batondach-t.wert*baton.error) 
#Ausgabe:

#Muss verglichen werden mit dem Skript Wert 

#Deutlich leichter mit der In-Build Funktion von R
#siehe confint()
?confint
confint(mod1, parm = "Age")
confint(mod1)

#Andere Möglichkeit noch mit der qnorm Funktion
#Gibt die Quantilswerte aus der Normalverteilung
#Mit Vektor die Werte vorgeben die eingelesen werden sollen

#95% Wkt.
c(batondach-1.96*baton.error, batondach+1.96*baton.error) #Schätzwert +- den 1.96 Wert um die Intervallgrenzen zu erhalten

qnorm(0.975) #an jeder Seite 0.025

