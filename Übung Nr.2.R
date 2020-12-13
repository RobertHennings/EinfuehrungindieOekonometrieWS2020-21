#Übung Nr.2 Kurs Einführung in die Ökonometrie 
#Aufgabe Nr1

#a)
pnorm(170, mean = 179, sd = 7)
#0.0992714 
#Die Wkt.dass ein Mann eine Körpergröße kleiner gleich 170 cm hat beträgt ca. 9.927%

#b)
1-pnorm(190.5, mean = 179, sd = 7)
#0.05020625
#Die Wkt. dass ein Mann größer als 190.5 cm ist, beträgt 5.020%.

#c)
pnorm(205, mean = 199, sd = sqrt(56.25))-pnorm(190,mean = 199, sd = sqrt(56.25))
#0.6730749
#Die Wkt. dass ein Mann zwischen 205 cm und 190 cm groß ist, beträgt 67.03 %

#d) siehe Aufgaben a-c

#Aufgabe Nr2
#a)
#Standardnormalveretilungsdichtefunktion plotten 
curve(dnorm(x),
      xlim = c(-3.5, 3.5),  #Grenzen der x Achse, reicht ja von -3.5 bis 3.5
      ylab ="Dichtewerte",
      main ="Dichtefunktion der Standardnormalveretilung mit N(0,1)")

#b)
#Dichte an der Stelle x=4 mit einer E(X) = 3, sd = 4 normalverteilten VAriable
dnorm(4, mean = 3, sd = 4)
#0.09666703

#c)
pnorm(4, mean = 3, sd =4)
#0.5987063
#Die Wkt. dass die Varibale X kleiner gleich 4 ist, beträgt ca 60%

#d)
qnorm(0.95, mean = 3, sd = 4)
#9.579415

#e)
set.seed(1)
rchisq(100, df = 100)
mean(rchisq(100, df = 100))
#mean = 99.4608

#f)
p<-pbinom(30, size= 50, prob = 1/3)-pbinom(10, size = 50, prob = 1/3)
p
#0.9715285
#Die Wkt dass die Binom Variable X einen Wert zwischen 30 und 20 annimt beträgt 97.15%
1/3*50
#Kommt gut hin, denn der Erwartungswert beträgt 16.66667
(1/3*(1-1/3))*50
#Varianz beträgt dabei 11.11111

#Aufgabe Nr3

#a)
#Nicht möglich die Daten einzulesen!
x<-100
sample(1:x, 1000, replace = TRUE, prob = NULL)
plot(sample(1:x, 1000, replace = TRUE, prob = NULL))

#b)
Daten<-read.csv2("/Users/Robert_Hennings/Dokumente/Uni/5.Semester/Einführung in die Ökonometrie/R-Code-20201102/Daten.csv")
str(Daten)
summary(Daten)
        
#Min. :69864  
#1st Qu.: 36531797  
#Median : 85071200  
#Mean   :270858946  
#3rd Qu.:497637926  
#Max.   :999635817
sd(Daten$X)
#309646290
sqrt(sd(Daten$X))
#17596.77
#Daten plotten:
plot(Daten$X, main = "Grafische Darstellung der 1000 Beobachtungen")
#Bessere Darstellung: Histogramm
hist(Daten$X, main ="Daten als Histogramm", freq = F)
#Histogramm lässt vermuten dass x Chi Quadrat verteilt ist, daher Vergleich möglich hier
curve(dchisq(x, df= 10), from =0, to =32, add = TRUE, col ="red")
#Die Chi Quadrat(10) Verteilung passt gut 
#Legende noch miteinfügen nicht vergessen!


#c)
#Hypothesentest durchführen
t.test(Daten$ID.X, mu = 10, alternative = "two.sided")
#One Sample t-test
#data:  Daten$X
#t = 27.662, df = 999, p-value < 2.2e-16
#alternative hypothesis: true mean is not equal to 10
#95 percent confidence interval:
 #251643943 290073949
#sample estimates:
#mean of x 
#270858946 

#Da p Wert > Alpha bleiben wir bei der H0 dass mu = 10 sei
#Output enthält zusätzlich noch ein 95% Konfidenzintervall anhand dessen man die Entscheidung auch hätte treffen können