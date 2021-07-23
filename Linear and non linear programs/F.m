clear
clc
function y = F(x)
x1 = x(1);
x2 = x(2);
y = zeros(2,1);
y(1) = x1^2-x2^2+2*x2; % f1(x1,x2)
y(2) = 2*x1+x2^2-6; % f2(x1,x2);
end
% Jacobian matrix of F
function A = J(x)
x1 = x(1);
x2 = x(2);
A = zeros(2,2);
A(1,1) = 2*x1; % df1x1
A(1,2) = -2*x2+2; % df1x2
A(2,1) = 2; % df2x1
A(2,2) = 2*x2; % df2x2;
end
