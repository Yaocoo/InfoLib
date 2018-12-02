function [ I ] = mi_hist( X, Y, Ntrl )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: calculate mutual information between variables X and Y.
%
% Usage: I = mi_hist( X, Y )
% Input:
%   X - A vector or matrix. Each column as an independent variable. Values
%   must be >= 1, that means [1 max(X)].
%   Y - A vector or matrix. Each column as an independent variable. Values
%   must be >= 1, that means [1 max(Y)].
%   Ntrl - Number of trails (samples).
% Output:
%   I - Mutual information between variables X and Y.
%
% Date: 2018/05/17
% Revision: 2018/05/17
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% dimX = size(X); % two dimentions
% dimY = size(Y); % two dimentions

% pXY = pEstimater_hist([X Y]);
% dimP = size(pXY);
% pXY1 = reshape(pXY,[ prod(dimP(1:dimX(2))), prod(dimP(dimX(2)+1:dimX(2)+dimY(2))) ]);
% pX = sum(pXY1,2);
% pY = sum(pXY1,1);

% estimate the probability
pXY = accumarray([X Y],1) ./ Ntrl;
pX = accumarray(X,1) ./ Ntrl;
pY = accumarray(Y,1) ./ Ntrl;

% I = HX + HY - HXY, this way can support uning [X Y] as joint data.
I = entropy_dist(pX) + entropy_dist(pY) - entropy_dist(pXY);

end

