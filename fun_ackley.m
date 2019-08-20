function y=fun_ackley(x)
% 
% Ackley function.
% Matlab Code by A. Hedar (Sep. 29, 2005).
% The number of variables n should be adjusted below.
% The default value of n =2.
% 
global shift_value;
x = x + shift_value;

n = size(x,2);
a = 20; 
b = 0.2; 
c = 2*pi;

s1 = 0; 
s2 = 0;

for i=1:n;
   s1 = s1+x(i)^2;
   s2 = s2+cos(c*x(i));
end
y = a + exp(1) - a*exp(-b*sqrt(1/n*s1)) - exp(1/n*s2);


