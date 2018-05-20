function [ P ] = pEstimater_hist( X )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: estimate probability distribution by counting occurrence
% frequency of each symbol.
%
% Usage: P = pEstimater_hist( X )
% Input:
%   X - A vector or matrix. Each column as an independent variable.
% Output:
%   P - Probability distribution of variables.
%
% Date: 2018/05/17
% Revision: 2018/05/17
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[Ntrl, ~] = size(X);

X = bsxfun(@minus,X,min(X))+1;

distX = accumarray(X,1);
P = distX ./ Ntrl;

end

