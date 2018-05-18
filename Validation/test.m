datasets

idx = 1;
X = ds{idx}.X;
Y = ds{idx}.Y;
Z = ds{idx}.Z;


IXY = mi_hist(X,Y);
IXZ = mi_hist(X,Z);
IYZ = mi_hist(Z,Y);
% I_co = coI_base(X,Y,Z);
% I_mmi_sps = mmi_sps_hist(X,Y,Z,3);
% I_mi = mi_sp_hist(X,Y,0);
% I_mmi_sp = mmi_sp_hist(X,Y,Z,3);