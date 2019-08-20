function y = fun_michalewics(x)
% 
% Michalewicz function 
% Matlab Code by A. Hedar (Nov. 23, 2005).
% The number of variables n should be adjusted below.
% The default value of n =2.
% 
global shift_value;
x = x + shift_value;

n = size(x,2); 
m = 10;
s = 0;
for i = 1:n;
    s = s+sin(x(i))*(sin(i*x(i)^2/pi))^(2*m);
end
y = -s;