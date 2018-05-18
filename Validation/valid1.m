S1 = [0 0 0 0 0 0 1 1 1 1 1 1];
R1 = [0 0 2 0 1 2 0 1 1 2 2 0];
R2 = [0 0 2 0 1 2 0 1 1 1 1 0];

% I1 = mi_base(S1, R1);
I2 = mi_hist([S1' R1'], R1');

% % I3 = pwMI_base(S1,1,R1,1);
% I4 = mi_lc_hist(S1',1,R1',1);
% 
% % I5 = wPwMi_base(S1,1,R1,1);
% I6 = mi_lcw_hist(S1',1,R1',1);
% I7 = mi_lcwk_hist(S1',1,R1',2,1);
% 
% I8 = mi_sps_hist(S1',R1',1);

