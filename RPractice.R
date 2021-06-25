# TODO: Add comment
# 
# Author: Administrator
###############################################################################


y<-function(x){
	x<-runif(50,min=-1,max=1)
	x[x<0]=1-x[x<0]
	x[x>=0]=1+x[x>=0]
}
x<-c(1)
y(x)
			
