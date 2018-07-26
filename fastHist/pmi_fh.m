function [ i ] = pmi_fh( pXY, pX, pY, weight_type )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: calculate local mutual information (also called point-wise
% mutual information) matrix based on probability distribution between 
% discrete variable X and Y.
%
% Usage:    i = pmi_fh( pX, pY, pXY )
%           i = pmi_fh( pX, pY, pXY, weight_type )
% Input:
%   pX - Column vector. Probability distribution of a univariate X.
%   pY - Row vector. Probability distribution of a univariate Y.
%   pXY - Probability distribution of joint variable [X Y].
%   weight_type - Optional. 'weighted' or 'normalized', otherwise return 
%   unweighted PMI
% Output:
%   i - local mutual information
%
% Example:
%   % estimate the probability
%   pXY = pEstimater_fh([X Y],Ntrl);
%   pX = sum(pXY,2);
%   pY = sum(pXY,1);
%   % another way for getting pX and pY
%   % pX = pEstimater_fh(X,Ntrl);
%   % pY = pEstimater_fh(Y,Ntrl)';
%
%   I = mi_lc_fh(pX, pY, pXY);
%   % example: take pmi(X=1;Y=2)
%   I12 = I(1,2)
%
% Date: 2018/05/17
% Revision: 2018/05/17
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% preprocessing data
if nargin < 4
    weight_type = 'weighted';
end

% pmi = hx + hy - hxy = log2(pxy/px*py)
i = log2( pXY ./ (pX(:,ones(size(pY))) .* pY(ones(size(pX)),:)) ); % faster than bsxfun
% i = log2(pXY ./ bsxfun(@times,pX,pY));

% weighting info
switch weight_type
    case 'weighted',
        i = pXY .* i;
    case 'normalized',
        i = i ./ -log2(pXY);
    case 'unweighted',
        
end

end

