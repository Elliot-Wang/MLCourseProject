wine_table = readtable('wine.csv');

[trainedClassifier, validationAccuracy] = linearClassifier(wine_table)

[trainedClassifier, validationAccuracy] = linearClassifierKFold(wine_table)