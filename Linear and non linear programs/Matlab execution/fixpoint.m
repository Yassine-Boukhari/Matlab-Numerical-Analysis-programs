function [xvect,xdif,fx,nit]=fixpoint(x0,tol,nmax,fun,phi)
%FIXPOINT Méthode de point fixe
% [XVECT,XDIF,FX,NIT]=FIXPOINT(X0,TOL,NMAX,FUN,PHI) tente de trouver un
% zéro de la fonction continue FUN en utilisant la méthode de point fixe
% X=phi(X), en partant de la donnée initiale X0.
% XVECT est le vecteur des itérées, XDIF est le vecteur des différences
% entre itérées consécutives, FX est le résidu. TOL est la tolérance de
% la méthode.
err=tol+1; nit=0;
xvect=x0; x=x0; fx=feval(fun,x); xdif=[];
while nit<nmax & err>tol
nit=nit+1;
x=xvect(nit);
xn=feval(phi,x);
err=abs(xn-x);
xdif=[xdif; err];
x=xn; xvect=[xvect;x]; fx=[fx;feval(fun,x)];
end
return
