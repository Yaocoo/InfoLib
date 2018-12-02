function [ I ] = cmi_hist( X, Y, Z, Ntrl )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: calculate conditional mutual information between variables
% X and Y condtioning out Z.
%
% Usage: I = mmi_hist( X, Y, Z )
% Input:
%   X - A vector or matrix. Each column as an independent variable. Values
%   must be >= 1, that means [1 max(X)].
%   Y - A vector or matrix. Each column as an independent variable. Values
%   must be >= 1, that means [1 max(Y)].
%   Z - A vector or matrix. Each column as an independent variable. Values
%   must be >= 1, that means [1 max(Z)].
%   Ntrl - Number of trails (samples).
% Output:
%   I - Conditional mutual information.
%
% Date: 2018/05/17
% Revision: 2018/05/17
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I = mi_hist([Y Z],X,Ntrl) - mi_hist(Z,X,Ntrl); 

end

