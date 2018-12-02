function [ I ] = mi_dist( pX, pY, pXY )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: calculate mutual information between variables X and Y using
% their probability distribution pX, pY and joint distribution pXY.
%
% Usage: I = mi_fh( pX, pY, pXY )
% Input:
%   pX - Column vector. Probability distribution of a univariate X.
%   pY - Row vector. Probability distribution of a univariate Y.
%   pXY - Probability distribution of joint variable [X Y].
% Output:
%   I - Mutual information between variables X and Y.
%
% Example:
%   % estimate the probability
%   pXY = pEstimater_hist([X Y],Ntrl);
%   pX = pEstimater_hist(X,Ntrl);
%   pY = pEstimater_hist(Y,Ntrl)'; % notice: this is a row vector
%   % calculate MI
%   I = mi_dist(pX, pY, pXY);
%
% Date: 2018/05/17
% Revision: 2018/12/02
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

idx = pXY(:)>0;
pXY2 = pX(:,ones(size(pY))) .* pY(ones(size(pX)),:); % faster than bsxfun
% pXY2 = bsxfun(@times,pX,pY);

I = sum( pXY(idx) .* log2( pXY(idx) ./ pXY2(idx) ) );

end

