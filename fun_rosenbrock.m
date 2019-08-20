function y = fun_rosenbrock(x)
% 
% Rosenbrock function
% Matlab Code by A. Hedar (Nov. 23, 2005).
% The number of variables n should be adjusted below.
% The default value of n = 2.
% 
global shift_value;
x = x + shift_value;
n = size(x,2);
sum = 0;
for j = 1:n-1;
    sum = sum+100*(x(j)^2-x(j+1))^2+(x(j)-1)^2;
end
y = sum;