function [ i, I ] = pmi_hist( X, Y, weight_type )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: calculate local mutual information (also called point-wise
% mutual information) matrix between discrete variable X and Y.
%
% Usage:    i = pmi_hist( X, Y )
%           i = pmi_hist( X, Y, weight_type )
% Input:
%   X - A vector or matrix. Each column as an independent variable.
%   Y - A vector or matrix. Each column as an independent variable.
%   weight_type - Optional. 'weighted' or 'normalized', otherwise return 
%   unweighted PMI
% Output:
%   i - local mutual information matrix
%   I - Mutual information between variables X and Y.
%
% Date: 2018/05/17
% Revision: 2018/06/14
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% preprocessing data
if nargin < 3
    weight_type = 'weightd';
end

[Ntrl, ~] = size(X);
X = bsxfun(@minus,X,min(X))+1;
Y = bsxfun(@minus,Y,min(Y))+1;

% estimate the probability
pXY = pEstimater_fh([X Y],Ntrl);
pX = sum(pXY,2);
pY = sum(pXY,1);

% i = hx + hy - hxy = log2(pxy/px*py)
i = log2(pXY ./ bsxfun(@times,pX,pY));

% calculate MI
idx = pXY(:)>0;
I = sum(pXY(idx).*i(idx));

% weighting info
switch weight_type
    case 'weightd',
        i = pXY .* i;
    case 'normalized',
        i = i ./ -log2(pXY);
end

end

