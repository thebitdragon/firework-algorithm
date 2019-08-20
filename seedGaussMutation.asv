function [seed_gaussian_matrix,fit_seed_gaussian_array,fitness_best_array] = seedGaussMutation(seedMatrix, params,fitness_best_array)

gaussian_number = params.gaussianNum;
global total_fiteval_times;

global evaTime;

total_fiteval_times = total_fiteval_times + gaussian_number;

dim = params.dim;

seed_gaussian_matrix = zeros(gaussian_number, dim);
fit_seed_gaussian_array=zeros(1, gaussian_number);


 for i = 1 : gaussian_number
        % select a firework
		seed_select = ceil(rand * params.seednum);%产生高斯变异火花的烟火个数
        rand_dimens = ceil(rand * dim);%选择的维数
		
        seed_gaussian_matrix(i,:)= seedMatrix(seed_select,:);
        coef_gaussian         = normrnd(0,1)+1;%高斯变异系数
        allow_dimension_array     = ones(1,dim);

        for j = 1:rand_dimens
		
            dim_mutation = ceil(rand * dim);
            while allow_dimension_array(dim_mutation)==0
                dim_mutation = ceil(rand * dim);
            end
            allow_dimension_array(dim_mutation) = 0;
            seed_gaussian_matrix(i, dim_mutation) = seed_gaussian_matrix(i, dim_mutation) * coef_gaussian;%高斯变异火花
            
			% map to the search range of the sparks which are out of the bound
            if seed_gaussian_matrix(i, dim_mutation) > params.upperBound || seed_gaussian_matrix(i, dim_mutation) < params.lowerBound
                span = params.upperBound - params.lowerBound;
                seed_gaussian_matrix(i,dim_mutation) = params.lowerBound + rem(abs(seed_gaussian_matrix(i, dim_mutation)), span);
            end
        end
		
        fit_seed_gaussian_array(i) = feval(params.fun_name,seed_gaussian_matrix(i,:));  
		if(fit_seed_gaussian_array(i)<fitness_best_array(evaTime))
			fitness_best_array(evaTime+1) = fit_seed_gaussian_array(i);
		 else
			fitness_best_array(evaTime+1) = fitness_best_array(evaTime);
		 end
		 evaTime = evaTime + 1;
 end

 