function [xvect,xdif,fx,nit]=modnewt(x0,m,tol,nmax,fun,dfun,varargin)
%NEWTON m´ethode de Newton
% [XVECT,XDIF,FX,NIT]=NEWTON(X0,TOL,NMAX,FUN,DFUN) tente de
% trouver un z´ero de la fonction continue FUN avec la m´ethode de
% Newton en partant de la donn´ee initiale X0. FUN et DFUN accepte
% une variable r´eelle scalaire x et renvoie une valeur r´eelle
% scalaire. XVECT est le vecteur des it´er´ees, XDIF est le vecteur
% des diff´erences entre it´er´ees cons´ecutives, FX est le r´esidu.
% TOL est la tol´erance de la m´ethode.
err=tol+1; nit=0; xvect=x0; x=x0; fx=feval(fun,x,varargin {:}); xdif=[];
while nit<nmax & err>tol
nit=nit+1;
x=xvect(nit);
dfx=feval(dfun,x,varargin {:});
xn=x-m*fx(nit)/dfx; err=abs(xn-x); xdif=[xdif; err];
x=xn; xvect=[xvect;x]; fx=[fx;feval(fun,x,varargin {:})];
end
return