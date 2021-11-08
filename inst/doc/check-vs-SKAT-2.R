## -----------------------------------------------------------------------------
library(SKAT)   #CRAN
library(bigQF)  #github/tslumley
set.seed(2018-5-18)

## -----------------------------------------------------------------------------
data(SKAT.example)
attach(SKAT.example) #look, it's not my fault, that's how they did it.

obj<-SKAT_Null_Model(y.c ~ 1, out_type="C")
skat.out1<-SKAT(Z, obj)
skat.qf1a<-SKAT.matrixfree(Z)
skat.qf1b<-SKAT.matrixfree(Z,model=lm(y.c~1))
skat.qf1c<-SKAT.matrixfree(Z,model=glm(y.c~1))

skat.out1$Q
skat.qf1a$Q(y.c)
skat.qf1b$Q()    ## phenotype used in fitting
skat.qf1b$Q(y.c) ## new phenotype

skat.out1$p.value
pQF(skat.out1$Q,skat.qf1a,neig=60,convolution.method="integration" )
pQF(skat.out1$Q,skat.qf1b,neig=60,convolution.method="integration" )
pQF(skat.out1$Q,skat.qf1c,neig=60,convolution.method="integration" )

## ---- warning=FALSE-----------------------------------------------------------
set.seed(2018-5-18)
p<-lapply(1:65, function(k) pQF(skat.out1$Q, skat.qf1a, neig=k,
                                      convolution.method="integration",tr2.sample.size=1000 )
                       )
pdf<-data.frame(p=do.call(c,p),k=1:65)
plot(p~k,data=pdf,pch=19,col="orange", ylim=c(0.017,0.020))
abline(h=skat.out1$p.value,lty=2)

