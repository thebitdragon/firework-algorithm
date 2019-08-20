
function f=benchmark14(x,func_num)

global shift_value;
x = x + shift_value;

% 14 benchmark functions
% paper: Define a standard for particle swarm optimization 2007 

% benchmark_func.m is the main function for 14 test functions, all minimize
% problems
% e.g. f=benchmark_14(x,func_num)
% x is the variable, f is the function value 
% func_num is the function num

% Zheng Shaoqiu, Peking University, 12,2011

    if func_num==1 fhd=str2func('sphere'); %[-100,100]
    elseif func_num==2 fhd=str2func('schwefel_102'); %[-100,100]
    elseif func_num==3 fhd=str2func('generalized_rosenbrock'); %[-30,30] 
    elseif func_num==4 fhd=str2func('ackley'); %[-32,32]  
    elseif func_num==5 fhd=str2func('generalized_griewank'); %[-600,600]   
    elseif func_num==6 fhd=str2func('generalized_rastrigin'); %[-5.12,5.12]; 
    elseif func_num==7 fhd=str2func('penalized_function_p16'); %[-50,50]  
    elseif func_num==8 fhd=str2func('six_hump_camel_back'); %[-5,5]      
    elseif func_num==9 fhd=str2func('goldstein_price'); %[-2,2] 
	elseif func_num==10 fhd=str2func('Schaffer'); %[-100,100]
	elseif func_num==11 fhd=str2func('Axis_parallel_hyper_ellipsoid'); %[-5.12,5.12]; 
	elseif func_num==12 fhd=str2func('Rotated_hyper_ellipsoid'); %[-65.536,65.536]
    end
f=feval(fhd,x);


% 1.Sphere/Parabola Function  Bounds[-100,100] dim30 optimum=0D ini[50,100]
function fit=sphere(x)

fit=sum(x.^2,2);


% 2.Schwefel 1.2   Bounds[-100,100] dim30 optimum=0D ini[50,100]	
function f=schwefel_102(x)
f=0;
[~,D]=size(x);
for i=1:D
    f=f+sum(x(:,1:i),2).^2;
end

% 3.Generalized Rosenbrock    Bounds[-30,30]   dim30 optimum=1D ini[15,30] 	
function fit=generalized_rosenbrock(x)

[~,D]=size(x);
fit=sum(100.*(x(:,1:D-1).^2-x(:,2:D)).^2+(x(:,1:D-1)-1).^2,2);

% 4.Ackley 	Function          Bounds[-32,32]   dim30 optimum=0D ini[16,32]
function fit=ackley(x)
[~,D]=size(x);
fit = -20*exp(-0.2*sqrt(1/D*sum(x.^2)))-exp(1/D*sum(cos(2*pi*x)))+20+exp(1);

% 5.Generalized Griewank's    Bounds[-600,600] dim30 optimum=0D ini[300,600] 
function fit=generalized_griewank(x)
[~,D]=size(x);
xm=1:D;
fit=1/4000*sum(x.^2,2)-prod(cos(x./(xm.^0.5)))+1;

% 6.Generalized Rastrigin     Bounds[-5.12,5.12]; dim30 optimum=0D ini[2.56,5.12]
function fit=generalized_rastrigin(x)
fit = sum(x.^2-10*cos(2*pi*x)+10,2);

% 7.Penalized Function P16    Bounds[-50,50] dim30 optimum=1D ini[25,50]  
function fit=penalized_function_p16(x)
[~,D]=size(x);
fit = 0.1*(sin(3*pi*x(1))^2 + sum((x(1:D-1)-1).^2.*(1+sin(3*pi*x(2:D)).^2),2)+(x(D)-1)^2*(1+sin(2*pi*x(D))^2))+sum(miu(x,5,100,4),2);

% 8.Six Hump Camel-back Bounds[-5,5]  dim2 optimaum=(-0.0898,0.7126),(0.0898,-0.7126) ini[25,50]  
function fit=six_hump_camel_back(x)
fit = 4*x(1)^2-2.1* x(1)^4+1/3*x(1)^6+x(1)*x(2)-4*x(2)^2+4*x(2)^4;

% 9.Goldstein Price Bounds[-2,2]  dim2 optimaum=(0,-1) ini[1,2]  
function fit=goldstein_price(x)
x1=x(1);x2=x(2);
fit =  1+(x1+x2+1)^2*(19-14*x1+3*x1^2-14*x2+6*x1*x2+3*x2^2);
fit = fit*(30+(2*x1-3*x2)^2*(18-32*x1+12*x1^2+48*x2-36*x1*x2+27*x2^2));

% 10 Schaffer' Bounds[-100,100] dim2 optimum=0D ini [50,100]
function fit = Schaffer(x)
fit = 0.5+((sin(sqrt(x(:,1).^2+x(:,2).^2))).^2-0.5)./((1+0.001*(x(:,1).^2+x(:,2).^2)).^2);

% 11 Axis_parallel_hyper_ellipsoid Bounds[-5.12,5.12] dim 30 optimum 0.0D ini [2.56,5.12]
function fit = Axis_parallel_hyper_ellipsoid(x)
x_squre = x.^2;
[number,D] = size(x);
i_array = repmat(1:D,number,1);
fit = sum(i_array.*x_squre,2);

% 12 Rotated_hyper_ellipsoid Bounds[-65.536,65.536] dim 30 optimum 0.0D ini [32.768,65.536]
function fit = Rotated_hyper_ellipsoid(x)
[number,D] = size(x);
fit = zeros(number,1);
for i = 1:D
	for j = 1:i
		fit = fit + x(:,j).^2;
	end
end


function fit = miu (x,a,k,m)
[~,D]=size(x);
fit = zeros(1,D);
for i=1:D
    if x(i)>a
      fit(i)=k*(x(i)-a)^m;
    elseif x(i)<-a
        fit(i)=k*(-x(i)-a)^m;
    else
        fit(i)=0;
    end
end