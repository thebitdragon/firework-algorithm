function [ val ] = fun_schafferf6( x )
%FUN_SCHAFFERF6 Summary of this function goes here
%   Detailed explanation goes here
global shift_value;
x = x + shift_value;
 n=size(x,2);
 
 sphere=0;
 
 for i = 1:n
    sphere = sphere + x(i).^2;
 end

 
 num = sin(sqrt(sphere)).^2 - 0.5;
 
 den = (1.0+0.01*(sphere)).^2;
 val = ( 0.5 +num./den);

 