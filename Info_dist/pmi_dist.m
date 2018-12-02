function [ i, I ] = pmi_dist( pXY, pX, pY, weight_type )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: calculate pointwise mutual information (also called local
% mutual information) matrix based on probability distribution between 
% discrete variable X and Y.
%
% Usage:    i = pmi_fh( pX, pY, pXY )
%           i = pmi_fh( pX, pY, pXY, weight_type )
%           [i,I] = pmi_fh( pX, pY, pXY, weight_type )
% Input:
%   pX - Column vector. Probability distribution of a univariate X.
%   pY - Row vector. Probability distribution of a univariate Y.
%   pXY - Probability distribution of joint variable [X Y].
%   weight_type - Optional. 'weighted' or 'normalized', otherwise return 
%   unweighted PMI
% Output:
%   i - Pointwise (local) mutual information
%   I - Mutual information.
%
% Example:
%   % estimate the probability
%   pXY = pEstimater_fh([X Y],Ntrl);
%   pX = pEstimater_fh(X,Ntrl);
%   pY = pEstimater_fh(Y,Ntrl)'; % notice: this is a row vector
%   % calculate PMI
%   i = mi_lc_fh(pX, pY, pXY);
%   i12 = i(1,2); % take pmi(X=1;Y=2)
%
% Date: 2018/05/17
% Revision: 2018/12/02
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% preprocessing data
if nargin < 4
    weight_type = 'weighted';
end

% pmi = hx + hy - hxy = log2(pxy/px*py)
i = log2( pXY ./ (pX(:,ones(size(pY))) .* pY(ones(size(pX)),:)) ); % faster than bsxfun
% i = log2(pXY ./ bsxfun(@times,pX,pY));

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

