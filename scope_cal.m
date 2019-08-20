function scope_array = scope_cal(fitness_array, params)

global Coef_Explosion_Amplitude;

fitness_best = min(fitness_array);
fitness_sub_best = abs(fitness_best - fitness_array);
fitness_sub_best_sum = sum(fitness_sub_best);
scope_array = zeros(params.seednum);

for i=1:params.seednum
    scope_array(i) = Coef_Explosion_Amplitude * (fitness_sub_best(i) + eps) / (fitness_sub_best_sum + eps);  
end
