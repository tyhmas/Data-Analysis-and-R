# TODO: Add comment
# 
# Author: Administrator
###############################################################################

#��һ��δ֪�������е���󼸸�Ԫ��֮�͵ķ����ܽ�
#tail(vector(),n)
#sum(rev(rev(x)[1:n])) 
#xΪ�������ⲿ�������rev��ʾ���ѵ�ת������ǰn��Ԫ�ص�תΪԭ����˳��

#ifelse()����֧������������
#��R��������ĺ��������к����������򸲸Ǻ���
.abc<-function(x){
	cat(x)
}
.abc(1)
#���������Ե�ſ�ͷ��һ���Ե�ſ�ͷΪ���ض���
ls(all.names=TRUE)

#����ĺ�����������ĸ������Ӧ��
std<-function(x){sqrt(var(x))}
std<-function(x)sqrt(var(x))
std
#�������úͺ����嶨������𣺿������������Ƿ�������
x<-c(1,3,5,7,9)
std(x)
a<-function(x)cat(x)
b<-function(x)cat(x+1)
a(1)
b(1)
a<-b
a(1)
a
#����ͷ�п��Զ����β�Ĭ��ֵ
seed(0)
sim.t = function(n,mu=10,sigma=5){
	x=c(1,3,5,7)
	(mean(x)-mu)/(std(x)/n)
}
sim.t(3)
#���ú���ʱ�����ж��������
#�����ڵ��ú���ʱ������ȫ��д����
sim2.t = function(mu=10,n=7,sigma=5){
	x=c(1,3,5,7)
	(mean(x)-mu)/(std(x)/n)
}
sim2.t(3)
sim2.t(n=3) #��sim.t(3)��ͬ

#...��ʾ�����������������
dot...test <- function(...) { #һ�������� ... ��Ϊ��ʽ��������ô�κβ�ƥ����ʽ������ʵ�ʲ�������ƥ��...
	args <- list(...) #�����������ݽṹ����׽���������������������������Ҳ���б�
	for(i in 1:length(args))
		print(args[i][[1]])
	print(paste(args))
}
dot...test(1, 2, 3)
dot...test("hello", "ok")
#��������ǲ����Ƶģ���Ϊû���쳣��������
hrt <- function(x, y) {
	sqrt(x^2+y^2)
}
hrt(3,4)
fun<-apropos("class")
x<-c(1,2,3)
(dim(x)<-c(1,3))
#�ҳ����п�д�ĺ���
apropos("<-")
library("ggplot")
install.packages("ggplot2")
#��ֱ��ʹ�á�+�����������������Ƴ��ȴ��ڵ���1�����к���
apropos("\\+")
library(ggplot2)
apropos("\\+")
help("+")

#UseMethod��ʾ��һ���ӿڣ����庯��ʵ�ֵ��ò�ͬ��ʵ�ַ���
whoami <- function(x, ...) UseMethod("whoami")
#S3�࣬�����ĸ�ȡ���ڴ�������ĸ��ࡣ
#S4���Ѿ�����Ϊһ�ָ����ַ������������������κζ�����
whoami.foo <- function(x) print("I am a foo")
whoami.bar <- function(x) print("I am a bar")
whoami.default <- function(x) print("I don't know who I am")
a<-c(1:10)
attr(a,'class')<-'foo'
whoami(a)
#���ȿ��Ƿ�Ĭ�ϵ�ƥ����
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
#R�����������ֱ�ӷ�������
xinbo@name
setMethod("show", "employee",
		function(object) {
			cat("just for fun")
		}
)
xinbo