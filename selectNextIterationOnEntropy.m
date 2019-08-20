function [seedNextMatrix,seedNextMatrixFitness]=selectNextIterationOnEntropy(seedMatrix,seedFitness,params)
%  		select the fireworks for next iteration
%       


particleNum = size(seedFitness,2);
dim = size(seedMatrix,2);

[~,tempIndex]=sort(seedFitness);
bestIndex = tempIndex(1);
%  Prelocate the parameters找到适应度值最小的的个体

seedNextMatrix              = zeros(params.seednum,dim);%输出矩阵
seedNextMatrixFitness       = zeros(1,params.seednum);    

NormMatrix                  = zeros(particleNum,particleNum);
DistanceArry                = zeros(1,particleNum);
ProbabiSelctPaticle         = zeros(1,particleNum);
addProbabiSelctPaticle      = zeros(1,particleNum);

randPoint                   = rand(1,params.seednum-1);
randPointIndex              = zeros(1,params.seednum-1);


for i=1:particleNum
   for j=i:particleNum
       % compute the distace between each two
       NormMatrix(i,j)=mathNorm(seedMatrix(i,:),seedMatrix(j,:));
   end
end
NormMatrix = NormMatrix + NormMatrix';
% compute the sum distance for a spark to others 
for i=1:particleNum
    for j=1:particleNum
        DistanceArry(i)=DistanceArry(i)+NormMatrix(i,j);
    end
end

% probobility computation
for i=1:particleNum
    ProbabiSelctPaticle(i)=DistanceArry(i)/sum(DistanceArry);
end



%selection perform
addProbabiSelctPaticle(1)=ProbabiSelctPaticle(1);
for i=2:particleNum
    addProbabiSelctPaticle(i)=ProbabiSelctPaticle(i)+addProbabiSelctPaticle(i-1);
end


for i=1:params.seednum-1
    j=1;
    while(randPoint(i)>addProbabiSelctPaticle(j) && j<particleNum)
        j=j+1;
    end
    randPointIndex(i)=j;
end

% the best
seedNextMatrix(1,:)=seedMatrix(bestIndex,:);
seedNextMatrixFitness(1)=seedFitness(bestIndex);

% the others
for i = 1:params.seednum - 1
    seedNextMatrix(i+1,:) = seedMatrix(randPointIndex(i),:);
    seedNextMatrixFitness(i+1) = seedFitness(randPointIndex(i));
end


    
    
    
    
    



