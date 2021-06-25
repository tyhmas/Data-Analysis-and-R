# TODO: Add comment
# 
# Author: Administrator
###############################################################################


library(biOps)
x<-readJpeg("Bund.jpg")
x[,,1]<-0
writeJpeg("Bund2.jpg",x)
