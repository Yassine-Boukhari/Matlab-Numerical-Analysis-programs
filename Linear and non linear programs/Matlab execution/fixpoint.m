function [xvect,xdif,fx,nit]=fixpoint(x0,tol,nmax,fun,phi)
%FIXPOINT M�thode de point fixe
% [XVECT,XDIF,FX,NIT]=FIXPOINT(X0,TOL,NMAX,FUN,PHI) tente de trouver un
% z�ro de la fonction continue FUN en utilisant la m�thode de point fixe
% X=phi(X), en partant de la donn�e initiale X0.
% XVECT est le vecteur des it�r�es, XDIF est le vecteur des diff�rences
% entre it�r�es cons�cutives, FX est le r�sidu. TOL est la tol�rance de
% la m�thode.
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
