% 通过物理测量预测鲍鱼的年龄。
% 属性说明
% Name / Data Type / Measurement Unit / Description 
% ----------------------------- 
% Sex / nominal / -- / M, F, and I (infant) 
% Length / continuous / mm / Longest shell measurement 
% Diameter	/ continuous / mm / perpendicular to length 
% Height / continuous / mm / with meat in shell 
% Whole weight / continuous / grams / whole abalone 
% Shucked weight / continuous	/ grams / weight of meat 
% Viscera weight / continuous / grams / gut weight (after bleeding) 
% Shell weight / continuous / grams / after being dried 
% Rings / integer / -- / +1.5 gives the age in years 
table = readtable('abalone.csv');

features = table(:, 1:end-1);
label = table(:, end);
