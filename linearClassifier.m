function validationAccuracy = linearClassifier(trainingData)

inputTable = trainingData;
predictorNames = {'Alcohol', 'Malic_acid', 'Ash', 'Alcalinity_of_ash', ...
    'Magnesium', 'Total_phenols', 'Flavanoids', 'Nonflavanoid_phenols', ...
    'Proanthocyanins', 'Color_intensity', 'Hue', ...
    'OD280OD315_of_diluted_wines', 'Proline'};
predictors = inputTable(:, predictorNames);
response = inputTable.Class;

% Set up holdout validation
cvp = cvpartition(response, 'Holdout', 0.1);
trainingPredictors = predictors(cvp.training, :);
trainingResponse = response(cvp.training, :);

% Train a classifier
% This code specifies all the classifier options and trains the classifier.
classificationDiscriminant = fitcdiscr(...
    trainingPredictors, ...
    trainingResponse, ...
    'DiscrimType', 'linear', ...
    'FillCoeffs', 'off', ...
    'ClassNames', [1; 2; 3]);

% Compute validation predictions
validationPredictors = predictors(cvp.test, :);
validationResponse = response(cvp.test, :);
[validationPredictions, ~] = classificationDiscriminant.predict(validationPredictors);

% Compute validation accuracy
correctPredictions = (validationPredictions == validationResponse);
isMissing = isnan(validationResponse);
correctPredictions = correctPredictions(~isMissing);
validationAccuracy = sum(correctPredictions)/length(correctPredictions);
