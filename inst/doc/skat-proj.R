## ---- eval=FALSE--------------------------------------------------------------
#  CholSigma<-t(chol(SIGMA))
#  Z<-nullmodel$x
#  qr<-qr(as.matrix(solve(CholSigma,Z)))
#  rval <- list(
#      mult = function(X) {
#        base::qr.resid(qr,as.matrix(solve(CholSigma,(spG %*% X))))
#          },
#      tmult = function(X) {
#        crossprod(spG, solve(t(CholSigma), base::qr.resid(qr,X)))
#      })

