function [ P ] = pEstimater_fh( X, Ntrl )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: estimate probability distribution by counting occurrence
% frequency of each symbol.
%
% Usage: P = pEstimater_fh( X )
% Input:
%   X - A vector or Ntrl*2 matrix, value >= 1;
% Output:
%   P - Probability distribution of variables.
%
% Date: 2018/05/17
% Revision: 2018/05/17
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

P = accumarray(X,1) ./ Ntrl;

end

