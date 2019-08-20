function sonsnum_array = sonsnum_cal(fitness_array, params)

global Max_Sparks_Num;
global Min_Sparks_Num;
global Coef_Spark_Num;

fitness_max = max(fitness_array); 
fitness_sub_max = abs(fitness_max - fitness_array);
fitness_sub_max_sum = sum(fitness_sub_max);

sonsnum_array = zeros(1, params.seednum);

for i = 1 : params.seednum

    sonnum_temp = (fitness_sub_max(i) + eps) / (fitness_sub_max_sum + eps);
    sonnum_temp = round( sonnum_temp * Coef_Spark_Num);

    if sonnum_temp > Max_Sparks_Num
        sonnum_temp = Max_Sparks_Num;
    elseif sonnum_temp < Min_Sparks_Num
            sonnum_temp = Min_Sparks_Num;
    end
	
    sonsnum_array(i) = sonnum_temp; 
end


