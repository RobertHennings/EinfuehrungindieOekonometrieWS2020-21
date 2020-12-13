library(Quandl)

SP500 <- Quandl("YAHOO/INDEX_GSPC", type = "xts", transform = "rdiff")
plot(as.matrix(cbind(lag(SP500$Close),SP500$Close)),xlab="yesterday's closing price",ylab="today's closing price")
# zoom in a little and heat color active regions
df <- data.frame(x = lag(SP500$Close),y=SP500$Close)
smoothScatter(df,xlim=c(-0.05,0.05),ylim=c(-0.05,0.05),xlab="yesterday's closing price",ylab="today's closing price")
abline(h=mean(SP500$Close),lty=2)
abline(v=mean(SP500$Close),lty=2)

cor(lag(SP500$Close),SP500$Close,use="pairwise.complete.obs")                 # a little correlation...
cor(lag(SP500$Close)[-(1:10000)],SP500$Close[-(1:10000)]) # ...that has however disappeared (in fact, reversed) 40 yrs later
# (SP500$Close[10001]) gives 1989-10-16

# or via rolling correlations:
m2 <- merge(lagcl=lag(SP500$Close),cl=SP500$Close)
width <- 1500
plot(rollapply(m2,width=width,function(x) cor(x[,1],x[,2]),by.column=FALSE),main=paste("rolling correlation, width =",width))
