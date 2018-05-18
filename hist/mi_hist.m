function [ I ] = mi_hist( X, Y )
%MI_HIST calculate mutual information
%   Description: calculate mutual information between variables X and Y.
%
%   Usage: I = mi_hist( X, Y )
%   Input:
%       X - A vector or matrix. Each column as an independent variable.
%       Y - A vector or matrix. Each column as an independent variable.
%   Output:
%       I - Mutual information between variables X and Y.
%
%   Date: 2018/05/17
%   Revision: 2018/05/17
%   Author: Yaocong Duan (yaocong.duan@gmail.com)

% dimX = size(X); % two dimentions
% dimY = size(Y); % two dimentions

% pXY = pEstimater_hist([X Y]);
% dimP = size(pXY);
% pXY1 = reshape(pXY,[ prod(dimP(1:dimX(2))), prod(dimP(dimX(2)+1:dimX(2)+dimY(2))) ]);
% pX = sum(pXY1,2);
% pY = sum(pXY1,1);

% estimate the probability
pXY = pEstimater_hist([X Y]);
pX = pEstimater_hist(X);
pY = pEstimater_hist(Y);

I = entropy_hist(pX) + entropy_hist(pY) - entropy_hist(pXY);

end

