
Ntrl = 300;

x1 = fix(rand(Ntrl,1).*5)+1; % 1-5
x2 = fix(rand(Ntrl,1).*5)+1;

y1 = fix(rand(Ntrl,1).*2); % 0-OFF, 1-ON
y2 = fix(rand(Ntrl,1).*2); % 0-OFF, 1-ON

Ix1 = mi_lcw_hist(x1,1,y1,1);
Ix2 = mi_lcw_hist(x2,5,y1,1);

Ix1x2 = mi_lcw_hist([y1 y2],[1 5],x1,1); % Contribution of y1,y2 to x1

