% 结果统计

F = '.\result\';
meanData = zeros(12,7);
timeData = zeros(12,7);

for func_id = 1:12
    for shift_index = 0:1:6
        file_name = [F 'functionlib' num2str(func_id) '_fit_fwa_matrix_shift_' num2str(shift_index) '.csv'];
        data = importdata(file_name);
        meanData(func_id,shift_index+1) = mean(data.data(1:30,3001));            
        timeData(func_id,shift_index+1) = mean(data.data(36,2:31));  
    end
end

fid = fopen([F 'efwa_mean.csv'],'w');
for func_id = 1:12
    fprintf(fid,'fun,%d,',func_id);
    for shift_index = 0:6
        fprintf(fid,'%.6f,',meanData(func_id,shift_index+1));        
    end
    fprintf(fid,'\n');
end
fclose(fid);
        
fid = fopen([F 'efwa_time.csv'],'w');
for func_id = 1:12
    fprintf(fid,'fun,%d,',func_id);
    for shift_index = 0:6
        fprintf(fid,'%.6f,',timeData(func_id,shift_index+1));        
    end
    fprintf(fid,'\n');
end
fclose(fid);