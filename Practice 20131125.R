# TODO: Add comment
# 
# Author: Administrator
###############################################################################

str(VADeaths)
death <- (VADeaths)[5:1,]
str(death)
death
barplot(death, col = c("black", "red", "yellow","blue") ,
				beside = TRUE, horiz = TRUE, legend = TRUE)
		
#�ڱ�����ʽ�ϱ����������	
#����ͼ��ֻʹ�ó��Ȼ���λ������ʾ���ݴ�С
		dotchart(t(VADeaths)[, 5:1], 
				panel.first = grid(ny = NA),cex = 0.8, 
				xlim = c(0, max(VADeaths)), color = 1:4)
		
#��ͼ�ʺ���չʾ�нϴ������������������ռ����		
mytable <- table(iris$Species)#��R������table��ʾһ�����ݳ��ֵ�Ƶ�Σ������Լ���
class(mytable)
lbls <- paste(names(mytable), "\n", mytable, sep="")
pie(mytable, labels = lbls, 
main="Pie Chart of Species\n (with sample sizes)")

# �����ͼ����
#par��ʾ������ͼ�в��������ã������ִ�С�����塢��Ե�հ׾��롢ͼ֮��ľ��룬
#ͼ�Ļ��ַ�ʽ�ȵ�
#mar��Ϊmargin����ͼ���������ҿհ׾���
par(mar = c(4, 3, 4, 4))
#layout��ʾͼ������ͼ�����λ�ã����´�����˼�ǵ�һ��ȫ���ڻ�ɢ��ͼ
#�ڶ��е�һ�л���ͼ���ڶ��еڶ��л�����ͼ
layout(matrix(c(1, 2, 1, 3), 2))
pie.sales <- c(0.12, 0.3, 0.26, 0.16, 0.04, 0.12)
#�������и�Ԫ����������
names(pie.sales) <- c("Blueberry", "Cherry", "Apple", 
		"Boston Cream", "Other", "Vanilla Cream")
#���ñ�ͼ�в�ͬ���ݶ�Ӧ�Ĳ�ͬ��ɫ
pie.col <- c("purple", "violetred1", "green3", 
		"cornsilk", "cyan", "white")

# ��ͼ����ͼ������ͼ
#�߼���ͼ���ƣ�ÿ��ͼ���и��ԵĻ�ͼ�ռ䣬����֮�䲻�����
dotchart(pie.sales, xlim = c(0, 0.3))
pie(pie.sales, col = pie.col)
barplot(pie.sales, col = pie.col, horiz = TRUE, 
		names.arg = "", space = 0.5)

#4 ֱ��ͼ
par(mar = c(1.8, 3, 0.5, 0.1), mgp = c(2, 0.5, 0))
data(geyser, package = "MASS")
str(geyser)
str(geyser$waiting)
hist(geyser$waiting, probability = TRUE, main = "",
		xlab = "waiting")
d <- density(geyser$waiting)
d
#x�᷶Χ��x����Сֵ�����ֵ
#y�᷶Χ����0��y���0
#x��Сֵ��Ӧyֵ0��x���ֵ��Ӧyֵ0������xֵ��Ӧ��Ӧyֵ
polygon(c(min(d$x), d$x, max(d$x)), c(0, d$y, 0),
		col = "lightgray", border = NA)
#lines��ʾ��ɫ���ߣ���Ϊd��ʾgeyser��waitingһ�����ݵĸ����ܶ�
lines(d)
ht <- NULL
brk = seq(40, 110, 5)
for(i in brk) {
	ht <- c(ht, d$y[which.min(abs(d$x - i))])
}
#lty�����߶λ�������ͣ�3�����ߵ�����Ϊ����
segments(brk, 0, brk, ht, lty = 3)

#��Ҷͼ��û�ж�ʧ������Ϣ
#ȱ�㣺����������ܴ󣬷ֲ���ɢ�������׽����ݱ�ʾ���
richmen <- read.table("800Rich.TXT", 
		header = TRUE, sep = ",")
stem(richmen[richmen[, 3] == "China", 4])
richmen[richmen[, 3] == "United States", 4]

#��������ͼ
#QN��ʾ��N*100%�����ݱ����QN��Ӧ����ҪС
par(mfrow = c(1, 2))#��һ������ʾ����Ϊ���У��ڶ��������ǻ���Ϊ����
#����
boxplot(richmen[, 4], main = "����")
#����jitter��ԭ�����ݽ�����΢�����������Ͽ̶Ȼ���
rug(jitter(richmen[, 4]), side = 3) #�����������루1,2,3,4���α�ʾ�������ң���2��ʾ���뻭�����
#���ʲ�
boxplot(richmen[, 5], main = "���ʲ�")
rug(jitter(richmen[, 5]), side = 2)

install.packages("vioplot")
#7С����ͼ
library(vioplot)
f <- function(mu1, mu2) {
	c(rnorm(300, mu1, 0.5), rnorm(200, mu2, 0.5))
}
x1 <- f(0, 2)
x2 <- f(2, 3.5)
x3 <- f(0.5, 2)
vioplot(x1, x2, x3, 
		horizontal = TRUE, col = "bisque", 
		names = c("A", "B", "C"))

#8��״ͼ
par(mfrow = c(1, 2))
stars(mtcars[1:10, 1:7], ncol = 7, 
		draw.segments = TRUE, axes = TRUE)
#�״�ͼ
#locations��ʾ��8��״ͼ���״�ͼ������λ�ö���0��ʾ���Ǵ�0���ȥ��
stars(mtcars[1:10, 1:7], locations = c(0, 0), 
		key.loc = c(0, 0), col.lines = 1:10, lty = 2)

sgtc <- read.table("sgtc.txt")
plot(sgtc)
#lm��ʾʹ������ģ��
abline(lm(sgtc[,2]~sgtc[,1]),col = "red")

#���տ�ͼ����Ӧ�����ݺ������ظ����
sunflowerplot(iris[, 3:4], 
		col = "gold", 
		seg.col = "gold")

#ɢ��ͼ��������������������ͼ
panel.hist <- function(x, ...) {
	usr <- par("usr")
	on.exit(par(usr))
	par(usr = c(usr[1:2], 0, 1.5))
	h <- hist(x, plot = FALSE)
	nB <- length(breaks <- h$breaks)
	y <- h$counts/max(h$counts)
	rect(breaks[-nB], 0, breaks[-1], y, col = "beige")
}
idx <- as.integer(iris[["Species"]])
pairs(iris[1:4], upper.panel = function(x, y, ...) points(x,
					y, pch = c(17, 16, 6)[idx], col = idx), 
		pch = 20, oma = c(2, 2, 2, 2), lower.panel = panel.smooth,
		diag.panel = panel.hist)

#
x<-iris[,1:4]
str(x)
#plot��pairs��ͼЧ����ͬ����Ϊplot�Ƿ��ͺ��������ͼЧ��ȡ���ڴ���ı�������
plot(x)
pairs(x)

#14QQͼ�����ڹ۲�������λ����һ�������۵ģ�һ����ʵ�ʵģ��Ƿ���ͬһ������
#Ҳ������Ϊ��λ����ɢ��ͼ
x <- iris[, 1]
qqnorm(x)
t.test(x)
qqplot(iris[, 1], iris[, 3])
qqplot(iris[, 3], iris[, 4])

install.packages("maps")
install.packages("mapdata")
library(maps)
library(mapdata)
map("china", col = "red4", ylim = c(18, 54), 
		panel.first = grid())
title("�쳯��ͼ")

#����ʽ��ͼ�����Բ鿴ͼ��ĳ�������Ϣ
plot(sgtc[, 2], sgtc[, 1], type = "b")
theirNames <- c("���","�����","�ŵ�Ȫ","����Ԫ","������",
		"����ɽ","����Ȫ","�����","л��֥","�����","����ի",
		" �ߵ���","��ƺ��","�ߵ¹�","�ߵ���","���᳼")
identify(sg, tc, label = theirNames)