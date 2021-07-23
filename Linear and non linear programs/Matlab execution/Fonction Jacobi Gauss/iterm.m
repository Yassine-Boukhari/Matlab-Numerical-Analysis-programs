function [x, iter]= iterm (A,b,x0,nmax,tol ,P)
%iterm M�thode it�rative g�n�rale
% [x,iter] = iterm(A,b,x0,nmax,tol ,P) tente de r�soudre le
% syst�me d��quations lin�aires A*x=b d�inconnue x.
% La matrice A, de taille nxn , doit etre inversible et
% le second membre b doit �tre de longueur n.
% P=�J� s�lectionne la methode de Jacobi, P=�G� celle
% de Gauss-Seidel. Autrement , P est une matrice n x n
% Les it�rations s�arr�tent quand le rapport entre la
% norme du k-�me residu et celle du r�sidu initial est
% inf�rieure ou �gale � tol , le nombre d�it�rations
% effectu�es est alors renvoy� dans iter.
% nmax est le nombre maximum d�it�rations. 
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
z = L\r;%r�sidu 
x = x + z;
r = b - A * x;
%err=norm(r);
err = norm (r) / r0;%Le r�sidu normalis� par le r�sidu initial 
end+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
return