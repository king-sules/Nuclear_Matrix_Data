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
olm3 = lm(Price ~ distance + Bed.Bath + Lot.size + Fukushima + I(Fukushima * distance), data = df)
olm4 = lm(Price ~ Bed.Bath + Lot.size + d_4_8 + d_8_12 + d_12_16, data = df )
olm5 = lm(Price ~ Bed.Bath + Lot.size + Fukushima + d_4_8 + d_8_12 + d_12_16
          + Fdis1 + Fdis2 + Fdis3, data = df )


stargazer(olm1, olm2, olm3, olm4, olm5, title = 'Regressions', type = "text", order = c(1,2,3,4,6,7,8,9,10,11,5,12),
          covariate.labels = c("distance", "Bed/Bath", " Lot Size", "Fukushima Dummy", "4-8 miles", "8-12 miles",
                               "12-16 miles", "Fuku * 4-8", "Fuku * 8-12", "Fuku * 12-16","Fuku * distance", "Constant"))

mydata.cor = cor(df[c(9, 4, 6, 10:17)])
print(mydata.cor) 
install.packages("corrplot")
library(corrplot)
corrplot(mydata.cor, method="number", type = 'upper')
