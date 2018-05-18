X0 = [0 0 1 1 1 1];
Y0 = [0 0 0 0 0 0];

X1 = [0 0 0 1 1 1 1 1 1];
Y1 = [1 1 1 1 1 1 1 1 1];

X2 = [0 0 0 0 1];
Y2 = [2 2 2 2 2];

I1 = mi_hist([X0 X2]',[Y0 Y2]');
I2 = mi_hist([X1,X2]',[Y1 Y2]');

histogram(X0);
histogram(X1);
histogram(X2);
histogram([X0 X2]);
histogram([X1 X2]);
