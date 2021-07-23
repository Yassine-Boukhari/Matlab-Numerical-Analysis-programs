k=input('k=');
u(1)=1;
v(1)=2;
for i=1:k-1
    u(i+1)=(u(i)+v(i))/2;
    v(i+1)=sqrt(u(i+1)*v(i));
end
err=abs(pi-v(k))/pi;
disp(err);
