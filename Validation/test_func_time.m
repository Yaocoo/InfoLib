datasets;
X = ds{1}.X;
Y = ds{1}.Y;
Z = ds{1}.Z;
Ntrl = ds{1}.Ntrl;

%% similar speed.
P = pEstimater_hist([X Y Z]);
P1 = P;

%
tic;
idx = P(:)>0;
E3 = -sum(P(idx).*log2(P(idx)));
toc;

%
tic;
E2 = -sum(P(P(:)>0).*log2(P(P(:)>0)));
toc;

%
tic;
P1(P1 == 0) = []; % P becomes a vector
E1 = -sum(P1.*log2(P1));
toc;

fprintf('Finished!\n');

%%
dimX = size(X); % two dimentions
dimY = size(Y); % two dimentions

%
tic
pXY = pEstimater_hist([X Y]);
dimP = size(pXY);
pXY1 = reshape(pXY,[ prod(dimP(1:dimX(2))), prod(dimP(dimX(2)+1:dimX(2)+dimY(2))) ]);
pX = sum(pXY1,2);
pY = sum(pXY1,1);
toc

% faster
tic
pXY = pEstimater_hist([X Y]);
pX = pEstimater_hist(X);
pY = pEstimater_hist(Y);
toc

fprintf('Finished!\n');

%%
%
tic
I1 = mi_hist(X,Z);
toc

% faster
tic
I2 = mi_fh(X,Z,Ntrl);
toc

fprintf('Finished!\n');

%%
%
tic
I1 = mi_lcw_hist(X,1,Z,2);
toc

% faster
tic
I2 = mi_lcw_fh(X,Z,Ntrl);
toc

I2(1,2);

fprintf('Finished!\n');

%%







