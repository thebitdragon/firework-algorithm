function y = fun_perm(x)
% 
% Perm function 
% Matlab Code by A. Hedar (Nov. 23, 2005).
% The number of variables n should be adjusted below.
% The default value of n = 4.
% 
global shift_value;
x = x + shift_value;

n = size(x,2);
b = 0.5;
s_out = 0;
for k = 1:n;
    s_in = 0;
    for j = 1:n
        s_in = s_in+(j^k+b)*((x(j)/j)^k-1);
    end
    s_out = s_out+s_in^2;
end
y = s_out;