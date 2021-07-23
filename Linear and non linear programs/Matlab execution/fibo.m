function u = fibo(n)
u=[1;1];
 for i=1:n-2
    u(i+2)=u(i+1)+u(i);
 end
 u=u(n)
end
