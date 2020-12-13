#Basic Befehle von R im Rahmen der Veranstaltung Einführung in die Ökonometrie WiSe 2020/21
#Basis: Überscihtsblatt
#Einfacher Vektor:
a <- c(1, 2, 3, 4, 5)
#Erste Zeile eines Datensatzes anzeigen lassen:
head(a)
#Länge eines Vektors anzeigen lassen
length(a)
#Absolutbetrag anzeigen lassen:
abs(a)
#Stellen eines Vektors an denen die Bedingung in Klammern gilt:

#Maximum eines Vektors angeben:
max(a)
#Stelle des Vektors an der das MAx ist:
which.max(a)
#Minimum eines Vektors:
min(a)
#Stelle an der das Min ist:
which.min(a)
#Wurzel einer Zahl ziehen:
sqrt(9)
#Arithmetisches Mittel berechnen:
mean(a)
#Median berechnen (Wert an dem 0,5 Quantil):
median(a)
#Varianz berechnen:
var(a)
#Standardabweichung berechnen:
sd(a)
#Kovarianz berechnen:
b <- c(5:1)
cov(a, b)
#Korrelation zwischen zwei Variablen berechnen:
cor(a, b)
#Daten plotten:
plot(a)
#Histogramm einer Variable erstellen:
hist(a)
#Logarithmus ziehen:
log(4)
#Stichprobe ziehen:
sample(a, 2, FALSE,prob = NULL)
#Kurve zeichnen:
curve(a)
#Dimension eines Objekts aufrufen:
dim(a)
#Bezeichnung der VAriablen anzeigen:
names(a)
#Daten ausgeben:
return(a)

