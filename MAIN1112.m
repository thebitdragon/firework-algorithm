%%
% Author: zheng shaoqiu, qiu11340203@163.com

%%
clear;clc;
format long;

%%
%_SET_PARAMETERS___________________________________________________________
% Genereal parameters -----------------------------------------------------
params.dim              = 30;        % problem dimension
params.seednum          = 5;
params.sonnum           = 50; 
params.maxEva		    = 300000;        % the max iteration of the algorithm
params.modStep          = 100;
params.maxEva_mod100    = params.maxEva/params.modStep;
params.gaussianNum		= 5;
                                      
%% Function setting and parametes setting

global shift;
% shift =0, no shift;
% shift =1, shiftation 0.05*range
% shift =2, shiftation 0.1*range
% shift =3, shiftation 0.2*range
% shift =4, shiftation 0.3*range
% shift =5, shiftation 0.5*range
% shift =6, shiftation 0.7*range
% shift = 2;

for shift = 0:1:6
    for functionid = 11:12
        params.fun_name = ['functionlib' num2str(functionid)];
% params.fun_name     = 'fun_ackley';
% params.fun_name     = 'fun_griewank';
%params.fun_name      = 'fun_rastrigin'; 
% params.fun_name     = 'fun_rosenbrock';
% params.fun_name     = 'fun_sphere';
%params.fun_name     = 'fun_schwefel';

% get function specific parameters 
params              = util_getFunctionParams(params);
folder_filename = '.\result\';
folder_function=[folder_filename params.fun_name '_'];
%%
repetitions = 30;
fit_fwa_matrix    = zeros(repetitions, params.maxEva_mod100);
time_fwa_array = zeros(1,repetitions);
for time_index = 1:repetitions
    
    [fit_fwa_matrix(time_index,:),time_fwa_array(time_index)]       = opt_FWA(params);  
    
end

%%
%print the fitness
fid_fit_fwa_matrix = fopen([folder_function 'fit_fwa_matrix_shift_' num2str(shift) '.csv'], 'w');
for i = 1 : repetitions
    fprintf(fid_fit_fwa_matrix,'times,%d,',i);
    for j = 1: params.maxEva_mod100
        fprintf(fid_fit_fwa_matrix,'%.6f,',fit_fwa_matrix(i,j));
    end
    fprintf(fid_fit_fwa_matrix,'\n');
end

%print the average fitness, the statical results
mean_fit_fwa_matrix = mean(fit_fwa_matrix,1);
fid_fit_fwa_matrix = fopen([folder_function 'fit_fwa_matrix_shift_' num2str(shift) '.csv'], 'a');
fprintf(fid_fit_fwa_matrix,'\n\nthe mean value of the previous\n');
for i=1:params.maxEva_mod100
   fprintf(fid_fit_fwa_matrix,'%.6f,',mean_fit_fwa_matrix(i));
end
fprintf(fid_fit_fwa_matrix,'\n\nthe statistical results is\n');
fprintf(fid_fit_fwa_matrix,'mean,%.6f,\n',mean_fit_fwa_matrix(params.maxEva_mod100));
fprintf(fid_fit_fwa_matrix,'std,%.6f,',std(fit_fwa_matrix(:,params.maxEva_mod100)));
fprintf(fid_fit_fwa_matrix,'\n\n\n');
fprintf(fid_fit_fwa_matrix,'runtime,');
for i = 1 : repetitions
    fprintf(fid_fit_fwa_matrix,'%.6f,',time_fwa_array(i));
end
fclose(fid_fit_fwa_matrix);
    end
end

