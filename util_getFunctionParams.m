function [ params ] = util_getFunctionParams( params )

 if (strcmp(params.fun_name, 'fun_ackley'))
    fprintf('Ackley function');
    params.lowerBound   = -100;        
    params.upperBound   =  100;  
    params.lowerInit    =  80;          
    params.upperInit    =  100;
    params.optimum      =   0;
 end
 %-------------------------------------------
 if (strcmp(params.fun_name, 'fun_griewank'))
    fprintf('Griewank function');
    params.lowerBound   = -100;        
    params.upperBound   =  100;      
    params.lowerInit    =  80;          
    params.upperInit    =  100;
    params.optimum      =   0;
 end
 %-------------------------------------------
 if (strcmp(params.fun_name, 'fun_michalewics'))
    fprintf('Michalewics function WARNUNG: PROBELM DIMENSION MUSST BE 10');
    params.lowerBound   =  0;        
    params.upperBound   =  pi;      
    params.lowerInit    =  0;          
    params.upperInit    =  1;

    params.optimum      =  -9.66015;
 end
  %-------------------------------------------
 if (strcmp(params.fun_name, 'fun_perm'))
    fprintf('Perm function');
    params.lowerBound   = -params.dim;        
    params.upperBound   =  params.dim;      
    params.lowerInit    =  -params.upperBound/2;          
    params.upperInit    =  -params.upperBound;
    params.optimum      =   0;
 end
 %-------------------------------------------
 if (strcmp(params.fun_name, 'fun_rastrigin'))
    fprintf('Rastrigin function');
    params.lowerBound   = -100;        
    params.upperBound   =  100;      
    params.lowerInit    =  80;          
    params.upperInit    =  100;
    params.optimum      =   0;
 end
 %-------------------------------------------
 if (strcmp(params.fun_name, 'fun_rosenbrock'))
    fprintf('Rosenbrock function');
    params.lowerBound   = -100;        
    params.upperBound   =  100;      
    params.lowerInit    =  -100;          
    params.upperInit    =   100;
    params.optimum      =   0;
 end
 %-------------------------------------------
 if (strcmp(params.fun_name, 'fun_schafferf6'))
    fprintf('Schafferf6 function');
    params.lowerBound   = -100;        
    params.upperBound   =  100;      
    params.lowerInit    =  80;          
    params.upperInit    =  100;
    params.optimum      =   0;
 end
 %-------------------------------------------
 if (strcmp(params.fun_name, 'fun_schwefel'))
    fprintf('Schwefel function');
    params.lowerBound   = -100;        
    params.upperBound   =  100;      
    params.lowerInit    =  80;          
    params.upperInit    =  100;
    params.optimum      =   0;
 end
 %-------------------------------------------
 if (strcmp(params.fun_name, 'fun_sphere'))
    fprintf('Sphere function');
    params.lowerBound   = -100;        
    params.upperBound   =  100;      
    params.lowerInit    =  80;          
    params.upperInit    =  100;
    params.optimum      =   0;
 end
%% Function Lib----------------------------------------------------------
%==========================================================================
%==========================================================================


 if (strcmp(params.fun_name, 'functionlib1'))
    fprintf('Sphere/Parabola Function');
    params.lowerBound   = -100;        
    params.upperBound   =  100;      
    params.lowerInit    =  50;          
    params.upperInit    =  100;
    params.optimum      =  0;
 end
  %-------------------------------------------
 if (strcmp(params.fun_name, 'functionlib2'))
    fprintf('Schwefel 1.2');
    params.lowerBound   = -100;        
    params.upperBound   =  100;      
    params.lowerInit    =  50;          
    params.upperInit    =  100;
    params.optimum      = -450;
 end
 
   %-------------------------------------------
 if (strcmp(params.fun_name, 'functionlib3'))
    fprintf('Generalized Rosenbrock');
    params.lowerBound   = -30;        
    params.upperBound   =  30;      
    params.lowerInit    =  15;          
    params.upperInit    =  30;
    params.optimum      = -450;
 end
    %-------------------------------------------
 if (strcmp(params.fun_name, 'functionlib4'))
    fprintf('Ackley Function');
    params.lowerBound   = -32;        
    params.upperBound   =  32;      
    params.lowerInit    =  16;          
    params.upperInit    =  32;
    params.optimum      = 390;
 end
 %-------------------------------------------
 if (strcmp(params.fun_name, 'functionlib5'))
    fprintf('Generalized Griewank');
    params.lowerBound   = -600;        
    params.upperBound   =  600;      
    params.lowerInit    =  300;          
    params.upperInit    =  600;
    params.optimum      = -180;
 end
    %-------------------------------------------
 if (strcmp(params.fun_name, 'functionlib6'))
    fprintf('Generalized Rastrigin');
    params.lowerBound   = -5.12;        
    params.upperBound   =  5.12;      
    params.lowerInit    =  2.56;          
    params.upperInit    =  5.12;
    params.optimum      =  310;
 end 
 %-------------------------------------------
 if (strcmp(params.fun_name, 'functionlib7'))
    fprintf('Penalized Function P16');
    params.lowerBound   = -50;        
    params.upperBound   =  50;      
    params.lowerInit    = 25;          
    params.upperInit    = 50;
    params.optimum      = -330;
 end
 
 %-------------------------------------------
 %-------------------------------------------
 if (strcmp(params.fun_name, 'functionlib8'))
    fprintf('Six Hump Camel-back');
    params.lowerBound   = -5;        
    params.upperBound   =  5;      
    params.lowerInit    = 2.5;          
    params.upperInit    = 5;
    params.optimum      = -1.0316285;
 end
    %-------------------------------------------
 if (strcmp(params.fun_name, 'functionlib9'))
    fprintf('Goldstein Price');
    params.lowerBound   = -2;        
    params.upperBound   =  2;      
    params.lowerInit    =  1;          
    params.upperInit    =  2;
    params.optimum      =  3;
 end
    %-------------------------------------------
 if (strcmp(params.fun_name, 'functionlib10'))
    fprintf('Schaffer');
    params.lowerBound   = -100;        
    params.upperBound   = 100;      
    params.lowerInit    =  50;          
    params.upperInit    =  100;
    params.optimum      =  0;
 end

 
if (strcmp(params.fun_name, 'functionlib11'))
    fprintf('Axis parallel hyper-ellipsoid');
    params.lowerBound   = -5.12;        
    params.upperBound   = 5.12;      
    params.lowerInit    =  2.56;          
    params.upperInit    =  5.12;
    params.optimum      =  0;
 end
 
if (strcmp(params.fun_name, 'functionlib12'))
    fprintf('Rotated hyper-ellipsoid');
    params.lowerBound   = -65.536;        
    params.upperBound   = 65.536;      
    params.lowerInit    = 32.768;          
    params.upperInit    =  65.536;
    params.optimum      =  0;
 end
 

 
 global shift;
 global shift_value;
 if shift ==0
     shift_value = 0;
 elseif shift==1
     shift_value = 0.05 * (params.upperBound - params.lowerBound)/2;
 elseif shift==2
     shift_value = 0.1 * (params.upperBound - params.lowerBound)/2;
 elseif shift==3
     shift_value = 0.2 * (params.upperBound - params.lowerBound)/2;
 elseif shift==4
     shift_value = 0.3 * (params.upperBound - params.lowerBound)/2;
 elseif shift==5
     shift_value = 0.5 * (params.upperBound - params.lowerBound)/2;
 elseif shift==6
     shift_value = 0.7 * (params.upperBound - params.lowerBound)/2;
 end
 fprintf('. Bounds: [%1.2f, %1.2f], opt: %1.2f;  %i fireworks search in %i dimensions, shiftation is %.6f', params.lowerBound, params.upperBound, params.optimum, params.seednum, params.dim,shift_value);
 
end


