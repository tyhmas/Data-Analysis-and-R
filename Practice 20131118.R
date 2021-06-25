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

#�ȰѺ�������Ϊ����״̬��ע�ⲻ���������
#�ڵ��Թ����п��ԶԸ����������������������mean()��
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
fix(test.f)###���ģ�Ȼ��ִ�е�Ч��
(test.f())
#��fix��������ֱ�����ı����и���ʵ����Ҫ�޸ĺ���
fix(plot)
plot(x)
#end of chapter 5
install.packages("rmmseg4j")
library("rmmseg4j")
#start of chapter 6
#�������Է������������

#��ֵ������Ϣ����λ���࣬�����������쳣����Ӱ��
#ȥ��Ӱ����÷�ʽ��ȥ�����ֵ����Сֵ��ʣ����ƽ��ֵ
#���Խ�������Ϊ����������

#
bupt <- read.csv("����2011��¼ȡ������.csv", header = TRUE)
str(bupt)
#��ȡ����רҵƽ����
score <- bupt[, 4]
names(score) <- bupt[, 3]
#������ֵ
mean(bupt[,4])
#������λ��
median(bupt[, 4])
#��ʾbupt���ݿ�
View(bupt)
#����
names(sort(table(score), decreasing = T))[1]
#����
names(table(score))[which.max(table(score))]
#�ٻ���
ux <- unique(score)
length(ux)
ux[which.max(tabulate(match(score, ux)))]
#������λ��������Լ����Ӧ������������С����
quantile(score, 0.60)
score["��ؼ���������"]#60%��רҵ���Ȳ�ؼ����������ķֵ�
#S������ָ�����ߵ�̨�ף�S��Сs��ʾ��ͬ���ͣ�ǰ����ָ���������������ߣ���������������������
plot(sort(score, decreasing = T), type = "S")
text(sort(score, decreasing = T), labels = names(sort(score, decreasing = T)), 
		cex = 0.7)

#�����ֵ
max(score)
#�����ֵ���±�
which(score == max(score))
which.max(score)
#����Сֵ
min(score)
#����Сֵ���±�
which(score == min(score))
which.min(score)

#�󼫲���ֵ-��Сֵ
range(score)
#�󼫲�
diff(range(score))
#�ķ�λ������
diff(quantile(score, c(0.25, 0.75)))
#�ķ�λ��������ķ�λ���(inter-quantile range)
#���������м�����۲�ֵ��ɢ�����
#��׼��
sd(score)#������ͬ
#����
var(score)

#����ͳ��������summary()
#����summary()�����˻���ͳ����
summary(score)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#573.0   594.5   600.0   600.9   607.5   632.0 
#������fivenum()����
fivenum(score)
#�������񼰷��� ���Ź��̼����� ��ѧ�� �������ѧ�뼼�� ����ý�弼��
#573.0          594.5        600.0   607.5           632.0 
fivenum(as.numeric(score))
#[1] 573.0 594.5 600.0 607.5 632.0
str(score)

summary(iris)

#�β����ͬ������
(idx <- as.integer(iris[["Species"]]))
length(idx)
str(iris$Species)
#�����հ�ͼ��n��ʾ���հ�ͼ
plot(0, xlim = range(iris[,3]), 
		ylim = range(iris[,4]), type = "n")
#���ӵ�
points(iris[, 3:4], 
		#���鳤�ȿ������ޣ����ǿ���ͨ�����޴��ظ�ȡĳ����Ԫ������չ������
		pch = c(24, 21, 25)[idx], 
		col = c("black", "red", "blue")[idx])

#�ö���η�ʽ������������
#���0��2*pi��Ӧ������ֵ
x <- seq(0, 2*pi, length = 1000)
y <- sin(x)
#����0��2*pi��������
#���������ᣬtype=1��ʾɢ��ͼ���������߽�������
plot(x, y, type = "l", main = "��������", 
		xlab = "xȡֵ", ylab = "yȡֵ",axes=FALSE)
#������Σ���ı��Ǵ�(2��,0)����0,0���ı�
polygon(x, y, col = "grey")
grid(nx=20,ny=20)
#�������ֺ͹�ʽ
text(1, -0.5, label = expression(y==sin(x)), cex = 2)
#��ͷָ��
arrows(3.5, 0.75, 1.5, 0.25, col = "red")
text(3.5, 0.75, label = expression(x<=pi), cex = 2)
arrows(3/2*pi, 0.5, 3/2*pi, -0.5, col = "red")
text(3/2*pi, 0.5, label = expression(x>pi), cex = 2)
#��ѧ����
demo(plotmath)

plot(x, y, type = "l", main = "��������", 
		xlab = "xȡֵ", ylab = "yȡֵ",axes=FALSE)
box()
axis(1, at = c(0, pi/2, pi, pi/2*3, 2*pi), 
		label = c("0", expression(pi/2),
				expression(pi), expression(3/2*pi),
				expression(2*pi)))
axis(2)

#��ͼ��Ϊ������
xLeft <- seq(0, pi, length = 15)
yUpper <- sin(xLeft)
xRight <- seq(pi, 2*pi, length = 15)
yLower <- sin(xRight)
points(xLeft, yUpper, pch = 1)
points(xRight, yLower, pch = 2)
polygon(c(xLeft,xRight),c(yUpper,yLower))
#����ͼ����ע���ķ��ź�y��ȡֵû��һһ��Ӧ��ϵ
#ͼ���Ķ�Ӧ��ϵ����Ӱ��ͼ������Ч����
legend(5, 1, legend = 
				c(expression(y>=0), expression(y<0)), lty = 1, pch = 2:1)