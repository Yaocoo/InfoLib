function [ JXY ] = jointVar( X, Y )
%JOINTVAR generate the joint variable
%   Description: generate the joint variable of variables X and Y.
%
%   Usage: JXY = jointVar( X, Y )
%   Input:
%       X - A column vector.
%       Y - A column vector.
%   Output:
%       JXY - The joint variable.
%
%   Date: 2018/05/17
%   Revision: 2018/05/17
%   Author: Yaocong Duan (yaocong.duan@gmail.com)

[Ntrl, ~] = size(X);

xUniq = unique(X)';
yUniq = unique(Y)';
JXY = nan(Ntrl,1);

label = 1;
for xv = xUniq
    for yv = yUniq
        JXY(X == xv & Y == yv) = label;
        label = label + 1;
    end
end

end

