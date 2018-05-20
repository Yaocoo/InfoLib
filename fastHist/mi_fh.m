function [ I ] = mi_fh( pX, pY, pXY )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: calculate mutual information between variables X and Y.
%
% Usage: I = mi_fh( pX, pY, pXY )
% Input:
%   pX - Probability distribution of X.
%   pY - Probability distribution of X.
%   pXY - Probability distribution of joint variable [X Y].
% Output:
%   I - Mutual information between variables X and Y.
% Example:
%   % estimate the probability
%   pXY = pEstimater_fh([X Y],Ntrl);
%   pX = sum(pXY,2);
%   pY = sum(pXY,1);
%   % another way for getting pX and pY
%   % pX = pEstimater_fh(X,Ntrl);
%   % pY = pEstimater_fh(Y,Ntrl);
%
%   I = mi_lc_fh(pX, pY, pXY);
%
% Date: 2018/05/17
% Revision: 2018/05/17
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I = entropy_hist(pX) + entropy_hist(pY) - entropy_hist(pXY);

end

