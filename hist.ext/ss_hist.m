function [ i ] = ss_hist( X, Y )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: calculate specific surprise vector between discrete
% variables X and Y.
%
% Usage:    i = pmi_hist( X, Y )
% Input:
%   X - A vector or matrix. Each column as an independent variable.
%   Y - A vector or matrix. Each column as an independent variable.
% Output:
%   i - specific surprise vector.
%
% Date: 2018/08/06
% Revision: 2018/08/06
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% preprocessing data
[Ntrl, ~] = size(X);
X = bsxfun(@minus,X,min(X))+1;
Y = bsxfun(@minus,Y,min(Y))+1;

% estimate the probability
pXY = pEstimater_fh([X Y],Ntrl);
pX = sum(pXY,2);
pY = sum(pXY,1);

% calculate specific surprise
i = bsxfun(@times,pXY,1./pY) .* log2(pXY ./ bsxfun(@times,pX,pY));
i = sum(i,1);

end

