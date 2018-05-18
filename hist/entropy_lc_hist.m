function [ e ] = entropy_lc_hist( p )
%ENTROPY_LC_HIST estimate local entropy
%   Description: calculate information entropy with probability distribution P.
%
%   Usage: e = entropy_lc_hist( p )
%   Input:
%       p - Probability.
%   Output:
%       e - Information theory entropy.
%
%   Date: 2018/05/17
%   Revision: 2018/05/17
%   Author: Yaocong Duan (yaocong.duan@gmail.com)

e = -log2(p);

end

