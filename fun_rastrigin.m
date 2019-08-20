function y = fun_rastrigin(x)
% function for test fw
global shift_value;
x = x + shift_value;

n = size(x,2); 
s = 0;
for j = 1:n
    s = s+(x(j)^2-10*cos(2*pi*x(j))); 
end
y = 10*n+s;