library("Quandl")
Quandl.api_key("CVMsrwwzfr3GHdd5G6j3")
quandldata <- Quandl("NSE/OIL", collapse="monthly", start_date="2013-01-01", type="ts")
plot(quandldata[,1], col ="red")

summary(quandldata)
str(quandldata)
head(quandldata)


