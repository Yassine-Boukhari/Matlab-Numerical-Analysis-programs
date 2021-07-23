function [ zero,res,niter ] = dichotomie( fun,a,b,tol,nmax,varargin )
% Cette méthode cherche les zéros d'une fonction.
% fun est une chaîne de caractères (ou une fonction inline) définissant
%la fonction f, a et b sont les extrémités
% de l'intervalle de recherche,
% tol est la tolérance eps et nmax est le nombre maximal d'itérations.
% Les paramètres de sortie sont zero, qui contient la valeur approchée de alpha,
%le résidu res qui est la valeur de f en zero
% et niter qui est le nombre total d'itérations effectuées. 
%La commande find(fx==0) renvoie les indices des composantes nulles du vecteur fx,
% et la commande sign(fx) renvoie le signe de fx. Enfin, 
%la commande varargin permet à la fonction fun d'accepter un nobre variable de paramètres d'entrée.
% zero=dicho(fun,a,b,tol,nmax,varargin) tente de trouver un zéro  zero d'une function
%continue fun sur l'intervalle [a,b] utilisant la méthode de dichotomie 
%(ou bisection).
% fun prend des réels en entrée et retourne un scalaire réel. Si la recherche échoue, 
%un message d'erreur est affiché. fun peut être
% un objet inline, une fonction anonyme ou bien être définie par un Mfiles.
% zero =dicho(fun,a,b,tol,nmax,p1,p2,...) passe les paramètres p1,p2,...,
%à la fonction fun(x,p1,p2,...).
%     [zero,res,niter]=dicho(fun,...) retourne la valeur approchée du zéro, 
%la valeur du résidu en zero et le numéro de l'itération à laquelle zero 
%     été calculé.
x=[a,(a+b)*0.5,b];fx=feval(fun,x,varargin{:});
if fx(1)*fx(3)>0
    error(['Les signes de la fonction aux extrémités',...
        ' de l''intervalle doivent être différents\n']);
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
        x(2)=x(1)+(x(3)-x(1))*0.5;%cette formule implémentée est moins sensible aux erreurs d'arrondi 
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
    fprintf(['La dichotomie s''est arrêtée sans \n',...
        'converger avec la tolérance souhaitée car \n',...
        'le nombre maximal d''itérations a été atteint\n']);
end
zero =x(2);x=x(2);res = feval(fun,x,varargin{:});
return
        

end

