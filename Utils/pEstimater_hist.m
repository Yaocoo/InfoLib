function [ P ] = pEstimater_hist( X, Ntrl )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: estimate probability distribution by counting occurrence
% frequency of each symbol.
%
% Usage: P = pEstimater_hist( X )
% Input:
%   X - A vector or matrix. Each column as an independent variable. values
%   must be >= 1, that means [1 max(X)].
%   Ntrl - Number of trails (samples).
% Output:
%   P - Probability distribution of variables.
%
% Date: 2018/05/17
% Revision: 2018/05/17
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% preprocessing data
% [Ntrl, ~] = size(X);
% X = bsxfun(@minus,X,min(X))+1;

% accounting the frequency as probability distribution
P = accumarray(X,1) ./ Ntrl;

end

