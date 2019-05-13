table = readtable('yellow-small.csv');
predictorNames = {'YELLOW', 'SMALL', 'STRETCH', 'ADULT'};

features = table(:, predictorNames);
label = table.T;
expNum = randperm(size(table, 1));
trans = expNum(1:15);
test = expNum(16:end);

% decision tree
model = fitctree(features(trans, :), label(trans));
Predict = table2array(model.predict(features(test, :)));
Correct = table2array(label(test));
testsize = size(Predict, 1);
accuracy = sum(Predict == Correct)/testsize;
display(accuracy)
view(model, 'Mode', 'graph')