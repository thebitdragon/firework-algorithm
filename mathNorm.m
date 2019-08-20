function NormDistance=mathNorm(arrayX,arrayY)
% ˵��������������ֻ�ܼ����������ķ�ʽ���룬û�������к��е��ж�

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