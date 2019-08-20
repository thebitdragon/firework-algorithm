function val = fun_sphere(x)
global shift_value;
x = x + shift_value;

n = size(x,2);
val = 0;
for i = 1:n
    val = val + x(i).^2;
end
% each xi is between [-5, 5], you can modify n