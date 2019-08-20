function NormDistance=mathNorm(arrayX,arrayY)
% 说明，本函数现在只能计算行向量的范式距离，没有增加行和列的判断

%%
xsize=size(arrayX,2);
ysize=size(arrayY,2);
NormDistance2=0;


%%


if xsize==ysize
    for i=1:xsize
       NormDistance2=NormDistance2+ (arrayX(i)-arrayY(i))*(arrayX(i)-arrayY(i));
    end
    NormDistance=sqrt(NormDistance2);
else
   error('Computing mathNorm of arrayX and arrayY : the dimention is not match. ') ;
end