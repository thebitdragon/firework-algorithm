function confidenceOfXY=mathConfidenceComputing(arrayX,arrayY)

%% Prelocate the parametes

xsize=size(arrayX,2);
ysize=size(arrayY,2);

NormX2=0;
NormY2=0;

%%

if xsize==ysize
    xPointMulY=arrayX.*arrayY;

    for dim=1:xsize
        NormX2=NormX2+arrayX(dim)*arrayX(dim);
        NormY2=NormY2+arrayY(dim)*arrayY(dim);
    end
    
    NormX=sqrt(NormX2);
    NormY=sqrt(NormY2);
    confidenceOfXY=sum(xPointMulY)/(NormX*NormY);
    
else
   error('Computing mathNorm of arrayX and arrayY : the dimention is not match. ') ;
end
