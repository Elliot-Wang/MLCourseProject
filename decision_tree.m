%% 创建树
load carsmall % contains Horsepower, Weight, MPG
X = [Horsepower Weight];
rtree = fitrtree(X,MPG);% create regression tree

load fisheriris % load the sample data
ctree = fitctree(meas,species); % create classification tree
view(ctree) % text description
%% 树决策
load ionosphere % contains X and Y variables
ctree = fitctree(X,Y);
Ynew = predict(ctree,mean(X))
%% 检测性能
load fisheriris
ctree = fitctree(meas,species);
resuberror = resubLoss(ctree)