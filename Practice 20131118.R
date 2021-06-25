# TODO: Add comment
# 
# Author: Administrator
###############################################################################

findruns <- function(x, k) {
	n <- length(x)
	runs <- NULL
	for(i in 1:(n-k+1)) {
		if(all(x[i:(i+k-1)] == 1)) runs <-c(runs, i)
	}
	return(runs)
}
x <- c(1, 0, 0, 1, 1, 1, 0, 1, 1)
findruns(x = x, k = 2)

#先把函数设置为调试状态，注意不用引入参数
#在调试过程中可以对各个变量进行运算操作，如mean()等
debug(findruns)
findruns(x = x, k = 2)

test.f <- function() {
	x <- 1:4
	y <- rep(NA, length(x))
	for (i in 1:length(x)) {
		y[i] <- 1/x[[i]]
	}
}
####
fix(test.f)###随便改，然后看执行的效果
(test.f())
#用fix方法可以直接在文本行中根据实际需要修改函数
fix(plot)
plot(x)
#end of chapter 5
install.packages("rmmseg4j")
library("rmmseg4j")
#start of chapter 6
#众数：对分类变量有意义

#均值包含信息比中位数多，但是容易受异常数字影响
#去掉影响最好方式：去掉最大值和最小值，剩下求平均值
#可以将其理解为样本的重心

#
bupt <- read.csv("北邮2011年录取分数线.csv", header = TRUE)
str(bupt)
#提取其中专业平均分
score <- bupt[, 4]
names(score) <- bupt[, 3]
#样本均值
mean(bupt[,4])
#样本中位数
median(bupt[, 4])
#显示bupt数据框
View(bupt)
#众数
names(sort(table(score), decreasing = T))[1]
#或者
names(table(score))[which.max(table(score))]
#再或者
ux <- unique(score)
length(ux)
ux[which.max(tabulate(match(score, ux)))]
#样本分位数：定义约有相应比例的样本点小于它
quantile(score, 0.60)
score["测控技术与仪器"]#60%的专业都比测控技术与仪器的分低
#S类型是指向下走的台阶，S和小s表示不同类型，前者是指先往下走再往右走，后者先往右走再向下走
plot(sort(score, decreasing = T), type = "S")
text(sort(score, decreasing = T), labels = names(sort(score, decreasing = T)), 
		cex = 0.7)

#求最大值
max(score)
#求最大值的下标
which(score == max(score))
which.max(score)
#求最小值
min(score)
#求最小值的下标
which(score == min(score))
which.min(score)

#求极差：最大值-最小值
range(score)
#求极差
diff(range(score))
#四分位数极差
diff(quantile(score, c(0.25, 0.75)))
#四分位数极差或四分位间距(inter-quantile range)
#它描述了中间半数观测值的散布情况
#标准差
sd(score)#量纲相同
#方差
var(score)

#概括统计量函数summary()
#函数summary()给出了基本统计量
summary(score)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#573.0   594.5   600.0   600.9   607.5   632.0 
#或者用fivenum()函数
fivenum(score)
#电子商务及法律 电信工程及管理 数学类 计算机科学与技术 数字媒体技术
#573.0          594.5        600.0   607.5           632.0 
fivenum(as.numeric(score))
#[1] 573.0 594.5 600.0 607.5 632.0
str(score)

summary(iris)

#鸢尾花不同的种类
(idx <- as.integer(iris[["Species"]]))
length(idx)
str(iris$Species)
#画出空白图，n表示画空白图
plot(0, xlim = range(iris[,3]), 
		ylim = range(iris[,4]), type = "n")
#增加点
points(iris[, 3:4], 
		#数组长度看似有限，但是可以通过无限次重复取某几个元素来扩展此数组
		pch = c(24, 21, 25)[idx], 
		col = c("black", "red", "blue")[idx])

#用多边形方式画出正弦曲线
#求出0到2*pi对应的正弦值
x <- seq(0, 2*pi, length = 1000)
y <- sin(x)
#画出0到2*pi正弦曲线
#更改坐标轴，type=1表示散点图，但是用线进行连接
plot(x, y, type = "l", main = "正弦曲线", 
		xlab = "x取值", ylab = "y取值",axes=FALSE)
#画多边形，最长的边是从(2π,0)到（0,0）的边
polygon(x, y, col = "grey")
grid(nx=20,ny=20)
#增加文字和公式
text(1, -0.5, label = expression(y==sin(x)), cex = 2)
#箭头指向
arrows(3.5, 0.75, 1.5, 0.25, col = "red")
text(3.5, 0.75, label = expression(x<=pi), cex = 2)
arrows(3/2*pi, 0.5, 3/2*pi, -0.5, col = "red")
text(3/2*pi, 0.5, label = expression(x>pi), cex = 2)
#数学符号
demo(plotmath)

plot(x, y, type = "l", main = "正弦曲线", 
		xlab = "x取值", ylab = "y取值",axes=FALSE)
box()
axis(1, at = c(0, pi/2, pi, pi/2*3, 2*pi), 
		label = c("0", expression(pi/2),
				expression(pi), expression(3/2*pi),
				expression(2*pi)))
axis(2)

#将图分为两部分
xLeft <- seq(0, pi, length = 15)
yUpper <- sin(xLeft)
xRight <- seq(pi, 2*pi, length = 15)
yLower <- sin(xRight)
points(xLeft, yUpper, pch = 1)
points(xRight, yLower, pch = 2)
polygon(c(xLeft,xRight),c(yUpper,yLower))
#增加图例，注意点的符号和y的取值没有一一对应关系
#图例的对应关系不会影响图的最终效果！
legend(5, 1, legend = 
				c(expression(y>=0), expression(y<0)), lty = 1, pch = 2:1)