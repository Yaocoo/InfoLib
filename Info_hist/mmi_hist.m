function [ I ] = mmi_hist( X, Y, Z, Ntrl )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: calculate multivariate mutual information among variables
% X, Y and Z. The positive result value means redundancy and negtive value
% means synergy.
%
% Usage: I = mmi_hist( X, Y, Z )
% Input:
%   X - A vector or matrix. Each column as an independent variable.
%   Y - A vector or matrix. Each column as an independent variable.
%   Z - A vector or matrix. Each column as an independent variable.
%   Ntrl - Number of trails (samples).
% Output:
%   I - Mutual information among variables X, Y and Z.
%
% Date: 2018/05/17
% Revision: 2018/12/02
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I = mi_hist(X,Z,Ntrl) + mi_hist(Y,Z,Ntrl) - mi_hist([X Y],Z,Ntrl);

end

