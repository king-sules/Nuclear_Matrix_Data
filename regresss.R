df<- read.csv('FullDataaaa.csv')

library(stargazer)
df$Price = log(df$Price)
df[is.na(df)] <- 0
print(df$Price)
sapply(df, mode)
plot(df$distance, df$Price, xlab = "distance", ylab = "lnPrice", pch=1, col="red")
abline(lm(Price~distance, data = df), col="blue")

olm1 = lm(Price ~ distance, data = df )
olm2 = lm(Price ~ distance + Bed.Bath + Lot.size, data = df )
olm3 = lm(Price ~ distance + Bed.Bath + Lot.size + I(Fukushima * distance), data = df)
olm4 = lm(Price ~ distance + Bed.Bath + Lot.size + d_4_8 + d_8_12 + d_12_16, data = df )
olm5 = lm(Price ~ distance + Bed.Bath + Lot.size + d_4_8 + d_8_12 + d_12_16
          + Fukushima + Fdis1 + Fdis2 + Fdis3, data = df )
getwd()

 stargazer(olm1, olm2, olm3, olm4, olm5, title = 'Regressions', type = "text", order = c(1,2,3,5,6,7,8,9,10,11,4,12),
          covariate.labels = c("distance", "Bed/Bath", " Lot Size", "4-8 miles", "8-12 miles",
                               "12-16 miles", "Fukushima Dummy", "Fuku * 4-8", "Fuku * 8-12", "Fuku * 12-16","Fuku * distance", "Constant"), out = 'C:/Users/sahmed142/Desktop')

 mydata.cor = cor(df[c(9, 4, 6, 10:17)])
print(mydata.cor) 
install.packages("corrplot")
library(corrplot)
corrplot(mydata.cor, method="number", type = 'upper')
