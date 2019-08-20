function [fitness_best_array_return, time_return] = opt_FWA(params)
tic
global total_fiteval_times;
global Coef_Explosion_Amplitude;
global Max_Sparks_Num;
global Min_Sparks_Num;
global Coef_Spark_Num;

total_fiteval_times = 0;
Coef_Explosion_Amplitude = 40;
Max_Sparks_Num = 40;
Min_Sparks_Num = 2;
Coef_Spark_Num = 50;


global evaTime;
evaTime = 0;
SeedsMatrix         = zeros(params.seednum, params.dim);            % locations after individual movement
fitness_best_array     = zeros(1,params.maxEva);                   % store the best fitness 

% initialization
for i = 1 : params.seednum
    SeedsMatrix(i,:) = repmat(params.lowerInit, 1, params.dim) + rand(1, params.dim).* repmat(params.upperInit - params.lowerInit, 1, params.dim);
end

% computing the fitness of each seeds
SeedsFitness = zeros(1,params.seednum);

SeedsFitness(1)=feval(params.fun_name,SeedsMatrix(1,:));
evaTime = evaTime + 1;
fitness_best_array(evaTime) = SeedsFitness(1);

for i=2:params.seednum
 SeedsFitness(i)=feval(params.fun_name,SeedsMatrix(i,:));
 
 if(SeedsFitness(i)<fitness_best_array(evaTime))
	fitness_best_array(evaTime+1) = SeedsFitness(i);
 else
	fitness_best_array(evaTime+1) = fitness_best_array(evaTime);
 end
 evaTime = evaTime + 1;
end



% iteration by iteration
while evaTime < params.maxEva

    % calculate the number of sons that each seed should generate爆炸产生的个数
    sonsnum_array = sonsnum_cal(SeedsFitness,params);

    % calculate the exploding scope of sons  that each seed generate爆炸半径
    scope_array = scope_cal(SeedsFitness,params);
    
    % generate the sparks, based on the sparks number and explosion
    % amplitude of each firework爆炸火花位移
    [SonsMatrix,SonsFitness,fitness_best_array] = sons_generate(sonsnum_array,scope_array,SeedsMatrix,params,fitness_best_array);
    
    % perform the gaussian mutation of seeds高斯变异火花位移 
    [SeedsMatrixGauss,SeedsFitGaussMutation,fitness_best_array] = seedGaussMutation(SeedsMatrix, params,fitness_best_array);
    
    % all the seeds
    AllMatrix     = [SeedsMatrix;SonsMatrix;SeedsMatrixGauss]; 
        % attention SeedsFitness'所有适应度值
    AllFitness    = [SeedsFitness,SonsFitness,SeedsFitGaussMutation];
      
    % select the next iteration 选择下一代
    [SeedsMatrix,SeedsFitnessCurrentIte]=selectNextIterationOnEntropy(AllMatrix,AllFitness,params);
    
    %把结果存到下一代中
    SeedsFitness=SeedsFitnessCurrentIte;
    
  
end

time_return = toc;
fprintf(' \n Best fitness for FWA: %.6f  ... runtime: %g', fitness_best_array(params.maxEva), time_return);
fitness_best_array_return = fitness_best_array(1,params.maxEva_mod100);
for i = 1 :params.maxEva_mod100
    fitness_best_array_return(i) = fitness_best_array(i*params.modStep);
end
