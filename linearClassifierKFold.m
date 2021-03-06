function [validationAccuracy] = linearClassifierKFold(trainingData)

inputTable = trainingData;
predictorNames = {'Alcohol', 'Malic_acid', 'Ash', 'Alcalinity_of_ash', ...
    'Magnesium', 'Total_phenols', 'Flavanoids', 'Nonflavanoid_phenols', ...
    'Proanthocyanins', 'Color_intensity', 'Hue', ...
    'OD280OD315_of_diluted_wines', 'Proline'};
predictors = inputTable(:, predictorNames);
response = inputTable.Class;

% Train a classifier
% This code specifies all the classifier options and trains the classifier.
classificationDiscriminant = fitcdiscr(...
    predictors, ...
    response, ...
    'DiscrimType', 'linear', ...
    'FillCoeffs', 'off', ...
    'ClassNames', [1; 2; 3]);

% Perform cross-validation
partitionedModel = crossval(classificationDiscriminant, 'KFold', 10);

% Compute validation accuracy
validationAccuracy = partitionedModel.KFold;
