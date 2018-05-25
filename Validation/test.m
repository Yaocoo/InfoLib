datasets
I  = mi_hist(ds(:,1),ds(:,2));

I2 = mmi_hist(ds(:,1),ds(:,2),ds(:,4));


I4 = mi_hist(ds(:,1),ds(:,1));
I3 = mmi_hist(ds(:,1),ds(:,1),ds(:,2));

%%
datasets

mi_hist(ds2(:,2), ds2(:,3))

mi_hist(ds2(:,2), ds2(:,4))

mmi_hist(ds2(:,3), ds2(:,4), ds2(:,2))