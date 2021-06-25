# TODO: Add comment
# 
# Author: Administrator
###############################################################################


#x<-c(12,23,34,2,43,34,23,34,32,43,43)

#tmp<-NULL

#for(i in 1:(length(x)-2)){
#	tmp<-c(tmp,x[i:i+2])
#}

#tmpM<-matrix(tmp,byrow=T,ncol=3)
#tmpM

library(biOps)
x<-readJpeg("Bund.jpg")
x[,,3]<-0
writeJpeg("BundYellow.jpg",x)

test.names<-c("a","b","c","d")
test.order<-c(1,2,3,4)
data.frame(test.names,test.order)
x<-c(1,2,3,4);y<-c(1,2,3)
z<-data.frame(x,y)

df.data<-data.frame(X=c(1,2,3),Y=c("A","B","C"))
df.data
dim(df.data)
str(df.data)

head(df.data)
tail(df.data,n=2)

summary(iris)
str(iris)

view(iris)
head(iris,n=30)
tail(iris,n=30)

entry.view(iris)

row.names(iris)
rownames(iris)

iris$Sepal.Length

iris[]

attributes(iris[5,])

attributes(iris[5,1])

#another efficent way
mean(head(iris$Sepal.Length,n=30))

mean(iris$Sepal.Length[1:30])

anyDuplicated(iris)

which(duplicated(iris))

which(duplicated(iris[150:1,]))

iris$Sepal.Length<mean(iris$Sepal.Length)

iris[,c(T,T,F,T)]

nrow(iris)

x<-c(rep(TRUE,each=149))
x[143]<-FALSE
str(iris)

#delete a column
iris$Species<-NULL
#endow all elements to NA
iris$Species<-NA
head(iris)

which(is.na(iris))

tmpM<-apply(iris,1,function(x){
			return(sum(is.na(x))>6)
		})

set.seed(12)
#trainSet<-iris[sample(1:(iris),*0.3,replace=FALSE),] 原有思路
tmpIdx<-sample(1:150,45)#设置中自
testSet<-iris[tmpIdx]
trainingSet<-iris[-tmpIdx]