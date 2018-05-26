function [ i ] = mi_lcn_hist( X, x, Y, y )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: calculate local mutual information (also called point-wise 
% mutual information) normailized by -log2(p(x,y)) between event x of variable
% X and event y of Variable Y.
%
% Usage: i = mi_lcn_hist( X, x, Y, y )
% Input:
%   X - A vector or matrix. Each column as an independent variable.
%   x - one event of X.
%   Y - A vector or matrix. Each column as an independent variable.
%   y - one event of Y.
% Output:
%   i - local mutual information
%
% Date: 2018/05/17
% Revision: 2018/05/17
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% estimate the probability
pXY = pEstimater_hist([X Y]);
pX = pEstimater_hist(X);
pY = pEstimater_hist(Y);

% standardize the value
x = x - min(X) + 1;
y = y - min(Y) + 1;

% check validation before calculating
xyInd = subArr2ind(size(pXY),[x y]);
if pXY(xyInd) == 0
    i = nan;
    return
end

% calculate the local mutual information
xInd = subArr2ind(size(pX),x);
yInd = subArr2ind(size(pY),y);
i = log2(pXY(xyInd)) - log2(pX(xInd)) - log2(pY(yInd)); % h(x) + h(y) - h([x y])
i = i ./ -log2(pXY(xyInd));

end

