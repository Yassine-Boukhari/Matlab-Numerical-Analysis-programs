function [ zero,res,niter ] = dichotomie( fun,a,b,tol,nmax,varargin )
% Cette m�thode cherche les z�ros d'une fonction.
% fun est une cha�ne de caract�res (ou une fonction inline) d�finissant
%la fonction f, a et b sont les extr�mit�s
% de l'intervalle de recherche,
% tol est la tol�rance eps et nmax est le nombre maximal d'it�rations.
% Les param�tres de sortie sont zero, qui contient la valeur approch�e de alpha,
%le r�sidu res qui est la valeur de f en zero
% et niter qui est le nombre total d'it�rations effectu�es. 
%La commande find(fx==0) renvoie les indices des composantes nulles du vecteur fx,
% et la commande sign(fx) renvoie le signe de fx. Enfin, 
%la commande varargin permet � la fonction fun d'accepter un nobre variable de param�tres d'entr�e.
% zero=dicho(fun,a,b,tol,nmax,varargin) tente de trouver un z�ro  zero d'une function
%continue fun sur l'intervalle [a,b] utilisant la m�thode de dichotomie 
%(ou bisection).
% fun prend des r�els en entr�e et retourne un scalaire r�el. Si la recherche �choue, 
%un message d'erreur est affich�. fun peut �tre
% un objet inline, une fonction anonyme ou bien �tre d�finie par un Mfiles.
% zero =dicho(fun,a,b,tol,nmax,p1,p2,...) passe les param�tres p1,p2,...,
%� la fonction fun(x,p1,p2,...).
%     [zero,res,niter]=dicho(fun,...) retourne la valeur approch�e du z�ro, 
%la valeur du r�sidu en zero et le num�ro de l'it�ration � laquelle zero 
%     �t� calcul�.
x=[a,(a+b)*0.5,b];fx=feval(fun,x,varargin{:});
if fx(1)*fx(3)>0
    error(['Les signes de la fonction aux extr�mit�s',...
        ' de l''intervalle doivent �tre diff�rents\n']);
elseif fx(1)==0
    zero = a;res=0;niter=0;return
elseif fx(3)==0
    zero = b; res=0;niter =0;return
end
niter = 0;
I=(b-a)*0.5;
while I >= tol & niter < nmax
    niter = niter +1;
    if fx(1)*fx(2)<0
        x(3)=x(2);
        x(2)=x(1)+(x(3)-x(1))*0.5;%cette formule impl�ment�e est moins sensible aux erreurs d'arrondi 
        fx=feval(fun,x,varargin{:});
        I=(x(3)-x(1))*0.5;
    elseif fx(2)*fx(3)<0
        x(1)=x(2);
        x(2)=x(1)+(x(3)-x(1))*0.5;
        fx=feval(fun,x,varargin{:});
        I=(x(3)-x(1))*0.5;
    else
        x(2)=x(find(fx==0));I=0;
    end
end
if (niter == nmax & I > tol)
    fprintf(['La dichotomie s''est arr�t�e sans \n',...
        'converger avec la tol�rance souhait�e car \n',...
        'le nombre maximal d''it�rations a �t� atteint\n']);
end
zero =x(2);x=x(2);res = feval(fun,x,varargin{:});
return
        

end

