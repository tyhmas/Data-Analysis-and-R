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
#R���ⲿ�֡������Ժ���names()��ֵ����:ʵ����names(student)<-��Ϊһ���µĺ���
names(student)<-c("�༶","�Ա�","����")
names(student)[2]<-"sex"
student

apropos("name")
student$����
mean(student$����)
#�󼫲�
range(student$����)
student$��
#warning:In mean.default(student[3]):argument is not numeric or logical: returning NA
mean(student[3])
#���������ԭ��
mode(student[3])
#��η���ֵ����ֵ��������student[[3]]�е������б�student[3]�е���ֵ����Ԫ��
mode(student[[3]])
student[[3]]
mean(student[[3]])
#Summary:�б��ķ��ʷ�ʽ��3�� 1.$������� 2.��������Ԫ����� 3.�����������б����ƣ������Ż���˫�������ü��ɣ�
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
#R�������ԣ�Define the names of sublists after the definition of the list
location$blank<-which(jobsStr==" ")
location$comma<-which(jobsStr==",")
location$dot<-which(jobsStr==".")

#v3.0
jobsStr<-unlist(jobsStr)
#�б��������Ϊ��һ������ 
jobsStr
#split-apply-combieģʽ
#����lapply
#ԭ����apply������������Ӧ��Ϊlist���������������ã����ų�Ϊ������������
newLocations<-lapply(c(" ",",","."),function(x)which(jobsStr==x))
names(newLocations)<-c("blank","comma","dot")

#1:150
#a<-paste("R",1:150,sep="")
#l<-list()
#for(x in 1:150){
#	names(l[[x]])<-a
#}

#�κ���ҵ����assign()��list()��ɿμ��ϵ�����
#�������assign()
#ʹ��list(),��lapplyʵ��
z<-list()
length(z)<-150
names(z)<-paste("R",1:150,sep="")
lapply(z,z[[i]]<-1:i)
