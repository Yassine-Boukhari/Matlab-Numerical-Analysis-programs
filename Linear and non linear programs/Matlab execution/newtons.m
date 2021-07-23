function [ zero,res,niter,inc ] = newtons( fun,dfun,x0,tol,nmax,varargin )
%NEWTON Cherche les z�ros d�une fonction.
% ZERO=NEWTON(FUN ,DFUN,X0,TOL ,NMAX) tente de trouver
% un z�ro ZERO de la fonction d�rivable FUN au
% voisinage de X0 en utilisant la m�thode de Newton.
% FUN et sa d�riv�e DFUN prennent en entr�e un r�el x
% et retournent une valeur r�elle. Si la recherche
% �choue, un message d�erreur est affich�. FUN et
% DFUN peuvent aussi �tre des objets inline, des
% fonctions anonymes ou bien �tre d�finies par des
% M-files.
% ZERO=NEWTON(FUN ,DFUN,X0,TOL ,NMAX,P1,P2 ,...) passe
% les param�tres P1,P2 ,... aux fonctions:
% FUN(X,P1,P2 ,...) et DFUN(X,P1 ,P2 ,...).
% [ZERO,RES ,NITER,INC]= NEWTON(FUN ,...) retourne la
% valeur approch�e du z�ro, la valeur du r�sidu en
% ZERO et le num�ro de l�it�ration � laquelle ZERO a
% �t� calcul� et INC est le vecteur
% des diff�erences entre it�er�ees cons�ecutives
% On stoppe l'algorithme quand la valeur absolue de la
% diff�rence entre deux it�r�es successives est
% inf�rieure � une tol�rance fix�e tol i.e |x(kmin)-x(kmin-1)|<tol, ou quand le nombre 
% d'it�rations atteint la valeur nmax.
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
fprintf (['La m�thode de Newton est arr�t�e ',...
'sans converger avec la tol�rance souhait�e car\n' ,...
'le nombre maximal d''it�rations a �t� atteint\n']);
end
zero = x; res = fx;
return


end

