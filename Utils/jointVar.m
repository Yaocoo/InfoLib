function [ JXY, values ] = jointVar( X, Y )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: generate the joint variable of variables X and Y.
%
% Usage: JXY = jointVar( X, Y )
% Input:
%   X - A column vector.
%   Y - A column vector.
% Output:
%   JXY - The joint variable.
%   values - a maxtrix of joint variable values. the joint value of X = 2
%   and Y = 3 is values(2,3).
%
% Date: 2018/05/17
% Revision: 2018/05/17
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[Ntrl, ~] = size(X);

xUniq = unique(X)';
yUniq = unique(Y)';
JXY = nan(Ntrl,1);
values = nam(max(xUniq), max(yUniq));

label = 1;
for xv = xUniq
    for yv = yUniq
        JXY(X == xv & Y == yv) = label;
        values(xv, yv) = label;
        label = label + 1;
    end
end

end

