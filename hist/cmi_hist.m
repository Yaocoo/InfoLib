function [ I ] = cmi_hist( X, Y, Z )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: calculate conditional mutual information between variables
% X and Y condtioning out Z.
%
% Usage: I = mmi_hist( X, Y, Z )
% Input:
%   X - A vector or matrix. Each column as an independent variable.
%   Y - A vector or matrix. Each column as an independent variable.
%   Z - A vector or matrix. Each column as an independent variable.
% Output:
%   I - Conditional mutual information.
%
% Date: 2018/05/17
% Revision: 2018/05/17
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I = mi_hist([Y Z],X) - mi_hist(Z,X); 

end

