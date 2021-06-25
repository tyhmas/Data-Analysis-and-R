# TODO: Add comment
# 
# Author: Administrator
###############################################################################

#library(biOps)
#error:cannot open the file
#x<-readJpeg("Bund.jpg")

#writeJpeg("Bund2.jpg",x)

class<-c(1,1,2,1,1,3,2,3,1,1,3)
sex<-c(T,T,F,F,T,F,T,F,T,F,T)
score<-c(89,78,67,69,71,82,90,77,54,89,92)
student<-list(class=class,sex=sex,score=score)
str(student)
length(student)
mode(student)
class(student)
names(student)
#R特殊部分——“对函数names()赋值？”:实质是names(student)<-成为一个新的函数
names(student)<-c("班级","性别","分数")
names(student)[2]<-"sex"
student

apropos("name")
student$分数
mean(student$分数)
#求极差
range(student$分数)
student$分
#warning:In mean.default(student[3]):argument is not numeric or logical: returning NA
mean(student[3])
#上述警告的原因
mode(student[3])
#这次返回值是数值型向量：student[[3]]中的是子列表student[3]中的数值向量元素
mode(student[[3]])
student[[3]]
mean(student[[3]])
#Summary:列表的访问方式：3种 1.$后接名称 2.方括弧加元素序号 3.方括弧加子列表名称（单引号或者双引号引用即可）
sort(student[['sex']],decreasing=T)[1:3]

jobsStr<-"You can't connect the dots looking forward; youcan only connect them looking backward.
So you have to trust that the dots will somehow connect in your future. You have trust in something-
your gut,destiny,life,karma,whatever.This approach has never let me down,and it has made all the 
difference in my life."
#split paragraph into words
jobsStr<-strsplit(jobsStr,split="")
str(jobsStr)

jobsStr[[1]]
#review:which returns index
which(jobsStr[[1]]==" ")
which(jobsStr[[1]]==",")
which(jobsStr[[1]]=="\n")

#v1.0
location<-list(blank=NULL,comma=NULL,dot=NULL)
#review:3 ways to visit the sublist in a list
location[["blank"]]<-which(jobsStr==" ")
location[[2]]<-which(jobsStr==",")
location$dot<-which(jobsStr==".")

#v2.0
location<-list()
#R语言特性：Define the names of sublists after the definition of the list
location$blank<-which(jobsStr==" ")
location$comma<-which(jobsStr==",")
location$dot<-which(jobsStr==".")

#v3.0
jobsStr<-unlist(jobsStr)
#列表拆包，成为了一个向量 
jobsStr
#split-apply-combie模式
#引入lapply
#原来的apply函数作用主体应该为list，但现在主宾倒置，符号成为函数作用主体
newLocations<-lapply(c(" ",",","."),function(x)which(jobsStr==x))
names(newLocations)<-c("blank","comma","dot")

#1:150
#a<-paste("R",1:150,sep="")
#l<-list()
#for(x in 1:150){
#	names(l[[x]])<-a
#}

#课后作业：用assign()和list()完成课件上的问题
#引入变量assign()
#使用list(),用lapply实现
z<-list()
length(z)<-150
names(z)<-paste("R",1:150,sep="")
lapply(z,z[[i]]<-1:i)

