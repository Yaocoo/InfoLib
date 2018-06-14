function [ P ] = pEstimater_fh( X, Ntrl )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: estimate probability distribution by counting occurrence
% frequency of each symbol.
%
% Usage: P = pEstimater_fh( X, Ntrl )
% Input:
%   X - A vector or Ntrl*2 matrix, value >= 1.
%   Ntrl - Number of trails (samples).
% Output:
%   P - Probability distribution of variables.
%
% Date: 2018/05/17
% Revision: 2018/05/17
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% accounting the frequency as probability distribution
P = accumarray(X,1) ./ Ntrl;

end

