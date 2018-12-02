function [ E ] = entropy_hist( X, Ntrl )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: calculate information entropy of discrete variable X.
%
% Usage: E = entropy_hist( P )
% Input:
%   X - A vector or matrix. Each column as an independent variable. Values
%   must be >= 1, that means [1 max(X)].
%   Ntrl - Number of trails (samples).
% Output:
%   E - Information theory entropy.
%
% Date: 2018/05/17
% Revision: 2018/05/17
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

P = accumarray(X,1) ./ Ntrl;

P = P(P(:)>0);
E = -sum(P.*log2(P));

% E = -sum(P(P(:)>0).*log2(P(P(:)>0)));

end

