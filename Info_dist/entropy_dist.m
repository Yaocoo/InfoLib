function [ E ] = entropy_dist( P )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: calculate information entropy with a probability 
% distribution P.
%
% Usage: E = entropy_hist( P )
% Input:
%   P - Probability distribution.
% Output:
%   E - Information theory entropy.
%
% Date: 2018/05/17
% Revision: 2018/05/17
% Author: Yaocong Duan (yaocong.duan@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

P = P(P(:)>0);
E = -sum(P.*log2(P));

% E = -sum(P(P(:)>0).*log2(P(P(:)>0)));

end

