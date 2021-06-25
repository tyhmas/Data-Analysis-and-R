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
		
#在表达形式上比起更加美观	
#两种图形只使用长度或者位置来表示数据大小
		dotchart(t(VADeaths)[, 5:1], 
				panel.first = grid(ny = NA),cex = 0.8, 
				xlim = c(0, max(VADeaths)), color = 1:4)
		
#饼图适合于展示有较大差别的数据在总体中所占比例		
mytable <- table(iris$Species)#在R语言中table表示一个数据出现的频次，它可以记忆
class(mytable)
lbls <- paste(names(mytable), "\n", mytable, sep="")
pie(mytable, labels = lbls, 
main="Pie Chart of Species\n (with sample sizes)")

# 拆分作图区域
#par表示所有作图中参数的设置，如文字大小、字体、边缘空白距离、图之间的距离，
#图的划分方式等等
#mar意为margin，即图形上下左右空白距离
par(mar = c(4, 3, 4, 4))
#layout表示图形在作图区域的位置，以下代码意思是第一行全用于画散点图
#第二行第一列画饼图，第二行第二列画条形图
layout(matrix(c(1, 2, 1, 3), 2))
pie.sales <- c(0.12, 0.3, 0.26, 0.16, 0.04, 0.12)
#给向量中各元素设置名称
names(pie.sales) <- c("Blueberry", "Cherry", "Apple", 
		"Boston Cream", "Other", "Vanilla Cream")
#设置饼图中不同数据对应的不同颜色
pie.col <- c("purple", "violetred1", "green3", 
		"cornsilk", "cyan", "white")

# 饼图、点图和条形图
#高级绘图机制：每个图都有各自的绘图空间，互相之间不会干扰
dotchart(pie.sales, xlim = c(0, 0.3))
pie(pie.sales, col = pie.col)
barplot(pie.sales, col = pie.col, horiz = TRUE, 
		names.arg = "", space = 0.5)

#4 直方图
par(mar = c(1.8, 3, 0.5, 0.1), mgp = c(2, 0.5, 0))
data(geyser, package = "MASS")
str(geyser)
str(geyser$waiting)
hist(geyser$waiting, probability = TRUE, main = "",
		xlab = "waiting")
d <- density(geyser$waiting)
d
#x轴范围：x的最小值到最大值
#y轴范围：从0到y最后到0
#x最小值对应y值0，x最大值对应y值0，其余x值对应相应y值
polygon(c(min(d$x), d$x, max(d$x)), c(0, d$y, 0),
		col = "lightgray", border = NA)
#lines表示灰色的线，因为d表示geyser中waiting一列数据的概率密度
lines(d)
ht <- NULL
brk = seq(40, 110, 5)
for(i in brk) {
	ht <- c(ht, d$y[which.min(abs(d$x - i))])
}
#lty代表线段绘出的类型，3代表线的类型为虚线
segments(brk, 0, brk, ht, lty = 3)

#茎叶图：没有丢失数据信息
#缺点：如果数据量很大，分布分散，则不容易将数据表示清楚
richmen <- read.table("800Rich.TXT", 
		header = TRUE, sep = ",")
stem(richmen[richmen[, 3] == "China", 4])
richmen[richmen[, 3] == "United States", 4]

#分区域作图
#QN表示有N*100%的数据比这个QN对应的数要小
par(mfrow = c(1, 2))#第一个数表示划分为几行，第二个数表是划分为几列
#年龄
boxplot(richmen[, 4], main = "年龄")
#加入jitter对原有数据进行轻微抖动，轴须上刻度会变粗
rug(jitter(richmen[, 4]), side = 3) #增加坐标轴须（1,2,3,4依次表示上左下右），2表示轴须画在左侧
#净资产
boxplot(richmen[, 5], main = "净资产")
rug(jitter(richmen[, 5]), side = 2)

install.packages("vioplot")
#7小提琴图
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

#8星状图
par(mfrow = c(1, 2))
stars(mtcars[1:10, 1:7], ncol = 7, 
		draw.segments = TRUE, axes = TRUE)
#雷达图
#locations表示了8星状图和雷达图的区别：位置都是0表示都是从0点出去的
stars(mtcars[1:10, 1:7], locations = c(0, 0), 
		key.loc = c(0, 0), col.lines = 1:10, lty = 2)

sgtc <- read.table("sgtc.txt")
plot(sgtc)
#lm表示使用线性模型
abline(lm(sgtc[,2]~sgtc[,1]),col = "red")

#向日葵图：反应了数据和数据重复情况
sunflowerplot(iris[, 3:4], 
		col = "gold", 
		seg.col = "gold")

#散点图：多个变量两两组合来画图
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
#plot与pairs绘图效果相同，因为plot是泛型函数，其绘图效果取决于传入的变量类型
plot(x)
pairs(x)

#14QQ图：用于观察两个分位数（一个是理论的，一个是实际的）是否在同一条线上
#也可理解为分位数的散点图
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
title("天朝地图")

#交互式绘图：可以查看图上某个点的信息
plot(sgtc[, 2], sgtc[, 1], type = "b")
theirNames <- c("李德","李德祥","张德泉","华子元","来德如",
		"王葆山","广阔泉","高玉峰","谢芮芝","骆采舞","戴致斋",
		" 高德明","吉坪三","高德光","高德亮","常葆臣")
identify(sg, tc, label = theirNames)