function [x, iter]= iterm (A,b,x0,nmax,tol ,P)
%iterm Méthode itérative générale
% [x,iter] = iterm(A,b,x0,nmax,tol ,P) tente de résoudre le
% système d’équations linéaires A*x=b d’inconnue x.
% La matrice A, de taille nxn , doit etre inversible et
% le second membre b doit être de longueur n.
% P=’J’ sélectionne la methode de Jacobi, P=’G’ celle
% de Gauss-Seidel. Autrement , P est une matrice n x n
% Les itérations s’arrêtent quand le rapport entre la
% norme du k-ème residu et celle du résidu initial est
% inférieure ou égale à tol , le nombre d’itérations
% effectuées est alors renvoyé dans iter.
% nmax est le nombre maximum d’itérations. 
[n,n]=size(A);
if nargin == 6 
end
if ischar(P)==1
end
%tf = ischar(P) returns logical 1 (true) if P is a character array and logical 0 (false) otherwise
if P=='J'
L=diag(diag(A));
elseif P == 'G'
L=tril(A);% tril(X) returns the lower triangular part of X. 
end
iter = 0;
x = x0;
r = b - A * x0;
r0 = norm(r);
err = norm (r);
while err > tol & iter < nmax
iter = iter + 1;
z = L\r;%résidu 
x = x + z;
r = b - A * x;
%err=norm(r);
err = norm (r) / r0;%Le résidu normalisé par le résidu initial 
end+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
return