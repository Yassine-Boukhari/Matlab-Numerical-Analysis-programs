function [x, iter,relres,flag]= iterm (A,b,x0,nmax,tol ,P)
[n,n]=size(A);
iter=0;
flag=0;
r0=b-Ax0;
x=x0;
r=r0;
if (norm(b)==0)
    norm(b)=1;
end
relres=norm(r)/norm(b);
if relres <=tol, return, end
for iter=1:nmax
    z=P\r;
    h=r'*z;
q=A*z;
alpha=h/(r'*q);
x=x+alpha*z;
r=r-alpha*q;
relres=norm(r)/norm(b);
if relres<=tol, break, end
end
if relres>tol, flag = 1; end
return