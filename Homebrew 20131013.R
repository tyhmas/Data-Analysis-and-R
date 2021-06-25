# TODO: Add comment
# 
# Author: Administrator
##############################################################################

x<-NULL
selIdx<-sample(1:150,15,replace=FALSE)
x<-iris[selIdx,]
x

#order(x)

t<-order(x$Sepal.Length,x$Petal.Length)
str(x$Sepal.Length)
t
x[t,]
#ii <- order(x <- c(1,1,3:1,1:4,3), y <- c(9,9:1), z <- c(2,1:9))
#ii
## 6  5  2  1  7  4 10  8  3  9
#rbind(x, y, z)[,ii] # shows the reordering (ties via 2nd & 3rd arg)
#a<-order(x$Sepal.Length)
#b<-order(x$Petal.Length)
#sortedX<-x[order(x$Sepal.Length,x$Petal.Length)

?order()