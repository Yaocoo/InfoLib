function [ i, I ] = pmi_hist( X, xVal Y, yVal, Ntrl, weight_type )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: calculate local mutual information (also called point-wise
% mutual information) matrix between discrete variable X and Y.
%
% Usage:    i = pmi_hist( X, Y )
%           i = pmi_hist( X, Y, weight_type )
%           [i,I] = pmi_hist( X, Y, weight_type )
% Input:
%   X - A column vector. Values must be >= 1, that means [1 max(X)].
%   Y - A column vector. Values must be >= 1. that means [1 max(Y)].
%   Ntrl - Number of trails (samples).
%   weight_type - Optional. 'weighted' or 'normalized', otherwise return 
%   unweighted PMI
% Output:
%   i - local mutual information matrix
%   I - Mutual information between variables X and Y.
%
% Date: 2018/05/17
% Revision: 2018/12/02
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% preprocessing data
if nargin < 4
    weight_type = 'weighted';
end

% [Ntrl, ~] = size(X);
% X = bsxfun(@minus,X,min(X))+1;
% Y = bsxfun(@minus,Y,min(Y))+1;

% estimate the probability
pXY = accumarray([X Y],1) ./ Ntrl;
pX = sum(pXY,2);
pY = sum(pXY,1);

% pmi = hx + hy - hxy = log2(pxy/px*py)
i = log2(pXY ./ bsxfun(@times,pX,pY));

% calculate MI
idx = pXY(:)>0;
I = sum(pXY(idx).*i(idx));

% weighting info
switch weight_type
    case 'weighted',
        i = pXY .* i;
    case 'normalized',
        i = i ./ -log2(pXY);
    case 'unweighted',
        
end

end

