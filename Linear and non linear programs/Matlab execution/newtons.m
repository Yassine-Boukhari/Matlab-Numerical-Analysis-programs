function [ zero,res,niter,inc ] = newtons( fun,dfun,x0,tol,nmax,varargin )
%NEWTON Cherche les zéros d’une fonction.
% ZERO=NEWTON(FUN ,DFUN,X0,TOL ,NMAX) tente de trouver
% un zéro ZERO de la fonction dérivable FUN au
% voisinage de X0 en utilisant la méthode de Newton.
% FUN et sa dérivée DFUN prennent en entrée un réel x
% et retournent une valeur réelle. Si la recherche
% échoue, un message d’erreur est affiché. FUN et
% DFUN peuvent aussi être des objets inline, des
% fonctions anonymes ou bien être définies par des
% M-files.
% ZERO=NEWTON(FUN ,DFUN,X0,TOL ,NMAX,P1,P2 ,...) passe
% les paramètres P1,P2 ,... aux fonctions:
% FUN(X,P1,P2 ,...) et DFUN(X,P1 ,P2 ,...).
% [ZERO,RES ,NITER,INC]= NEWTON(FUN ,...) retourne la
% valeur approchée du zéro, la valeur du résidu en
% ZERO et le numéro de l’itération à laquelle ZERO a
% été calculé et INC est le vecteur
% des diff´erences entre it´er´ees cons´ecutives
% On stoppe l'algorithme quand la valeur absolue de la
% différence entre deux itérées successives est
% inférieure à une tolérance fixée tol i.e |x(kmin)-x(kmin-1)|<tol, ou quand le nombre 
% d'itérations atteint la valeur nmax.
inc=[];
x = x0;
fx = feval(fun ,x,varargin {:});
dfx = feval(dfun,x,varargin {:});
niter = 0; diff = tol+1;
while diff >= tol & niter < nmax
niter = niter + 1; diff = - fx/dfx;
x = x + diff; diff = abs(diff);inc=[inc; diff];
fx = feval(fun ,x,varargin {:});
dfx = feval(dfun,x,varargin {:});
end
if (niter==nmax & diff > tol)
fprintf (['La méthode de Newton est arrêtée ',...
'sans converger avec la tolérance souhaitée car\n' ,...
'le nombre maximal d''itérations a été atteint\n']);
end
zero = x; res = fx;
return


end

