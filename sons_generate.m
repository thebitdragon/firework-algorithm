function [sons_matrix, sons_fitness_array, fitness_best_array] = sons_generate(sonsnum_array, scope_array, seeds_matrix, params,fitness_best_array)

global total_fiteval_times;
global evaTime;

fiteval_time = sum(sonsnum_array);
total_fiteval_times = total_fiteval_times + fiteval_time;

sons_matrix = zeros(fiteval_time, params.dim);
sons_fitness_array = zeros(1, fiteval_time);    


sons_index = 1; 

for i = 1 : params.seednum%ѡ���̻��ĸ���
    for j = 1 : sonsnum_array(i)%ÿ���̻������𻨵ĸ���
	
        seed_position = seeds_matrix(i,:);%�𻨵�λ��
        
        allowed_dim_array = ones(1,params.dim);
        dimens_select = ceil(rand*params.dim); %select dimens_select���ѡ��ÿ����ά��
		
        offset = (rand*2-1) * scope_array(i); %Calculate the displacementԤ��λ�Ʋ���һ�������:
        
        for k = 1 : dimens_select
            rand_dimen = ceil(rand*params.dim);
			
            while allowed_dim_array(rand_dimen)==0  
                rand_dimen = ceil(rand*params.dim);
            end
            allowed_dim_array(rand_dimen)=0;
			
            seed_position(rand_dimen) = seed_position(rand_dimen) + offset;%��ը����
            
            if seed_position(rand_dimen) > params.upperBound || seed_position(rand_dimen) < params.lowerBound
			% map to the search range of the sparks which are out of the bound
                span = params.upperBound - params.lowerBound;
                seed_position(rand_dimen) = params.lowerBound + rem(abs(seed_position(rand_dimen)), span);
            end
        end

        
        sons_matrix(sons_index,:) = seed_position;
        sons_index = sons_index + 1;
    end
end

for i = 1 : fiteval_time
    sons_fitness_array(i) = feval(params.fun_name, sons_matrix(i,:));
	 if(sons_fitness_array(i)<fitness_best_array(evaTime))
		fitness_best_array(evaTime+1) = sons_fitness_array(i);
	 else
		fitness_best_array(evaTime+1) = fitness_best_array(evaTime);
	 end
	 evaTime = evaTime + 1;
end
