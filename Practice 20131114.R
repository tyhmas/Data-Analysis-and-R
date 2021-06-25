# TODO: Add comment
# 
# Author: Administrator
###############################################################################

#求一个未知长度数列的最后几个元素之和的方法总结
#tail(vector(),n)
#sum(rev(rev(x)[1:n])) 
#x为向量，外部括号外的rev表示将已倒转数组中前n个元素倒转为原来的顺序

#ifelse()可以支持向量化运算
#在R中若定义的函数和已有函数重名，则覆盖后者
.abc<-function(x){
	cat(x)
}
.abc(1)
#函数可以以点号开头，一般以点号开头为隐藏对象
ls(all.names=TRUE)

#下面的函数在输入字母是无力应对
std<-function(x){sqrt(var(x))}
std<-function(x)sqrt(var(x))
std
#函数调用和函数体定义的区别：看函数名后面是否有括弧
x<-c(1,3,5,7,9)
std(x)
a<-function(x)cat(x)
b<-function(x)cat(x+1)
a(1)
b(1)
a<-b
a(1)
a
#函数头中可以定义形参默认值
seed(0)
sim.t = function(n,mu=10,sigma=5){
	x=c(1,3,5,7)
	(mean(x)-mu)/(std(x)/n)
}
sim.t(3)
#调用函数时，若有多个参数，
#建议在调用函数时把名字全称写出来
sim2.t = function(mu=10,n=7,sigma=5){
	x=c(1,3,5,7)
	(mean(x)-mu)/(std(x)/n)
}
sim2.t(3)
sim2.t(n=3) #与sim.t(3)相同

#...表示特殊参数，有任意多个
dot...test <- function(...) { #一个函数以 ... 作为形式参数，那么任何不匹配形式参数的实际参数都将匹配...
	args <- list(...) #用最灵活的数据结构来捕捉特殊参数，能满足这种灵活需求的也就列表
	for(i in 1:length(args))
		print(args[i][[1]])
	print(paste(args))
}
dot...test(1, 2, 3)
dot...test("hello", "ok")
#这个函数是不完善的，因为没有异常处理！！
hrt <- function(x, y) {
	sqrt(x^2+y^2)
}
hrt(3,4)
fun<-apropos("class")
x<-c(1,2,3)
(dim(x)<-c(1,3))
#找出所有可写的函数
apropos("<-")
library("ggplot")
install.packages("ggplot2")
#若直接使用“+”，则会出现所有名称长度大于等于1的所有函数
apropos("\\+")
library(ggplot2)
apropos("\\+")
help("+")

#UseMethod表示是一个接口，具体函数实现调用不同的实现方法
whoami <- function(x, ...) UseMethod("whoami")
#S3类，调用哪个取决于传入的是哪个类。
#S4类已经弱化为一种附加字符串，可以随意贴到任何对象上
whoami.foo <- function(x) print("I am a foo")
whoami.bar <- function(x) print("I am a bar")
whoami.default <- function(x) print("I don't know who I am")
a<-c(1:10)
attr(a,'class')<-'foo'
whoami(a)
#优先考虑非默认的匹配类
attr(a,'class')<-c('zar','bar')
whoami(a)
class(a)<-'csz'
whoami(a)

setClass("employee",
		representation(
				name = "character",
				age = "numeric",
				sex = "logical",
				salary = "numeric" 
		))

(xinbo <- new("employee",  name = "aixinbo",age = 31, sex = TRUE, salary = 3000))
#R语言里面可以直接访问属性
xinbo@name
setMethod("show", "employee",
		function(object) {
			cat("just for fun")
		}
)
xinbo
