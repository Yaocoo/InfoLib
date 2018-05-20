function [ ind ] = subArr2ind( arrSize, subArr )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Linear index from subscripts.
%
% subArr2ind(size,[3 4 5]) is same as sub2ind(size,3,4,5).
%
% SUBARR2IND is used to determine the equivalent single index
% corresponding to a given array of subscript values.
%
% IND = SUBARR2IND returns the linear index equivalent to the
% row and column subscripts in the arrays subArr the elements of subArr
% correspond to the each dimension subscripts respectively.
%
% See also SUB2IND.
%
% Date: 2018/05/17
% Revision: 2018/05/17
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ndim = length(arrSize);
k = cumprod(arrSize);

ind = subArr(1);
for di = 2:Ndim
    if arrSize(di) == 1
        continue;
    end
    ind = ind + (subArr(di)-1) * k(di-1);
end

end

