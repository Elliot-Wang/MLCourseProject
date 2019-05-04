table = readtable('yellow-small.csv')
predictorNames = {'YELLOW', 'SMALL', 'STRETCH', 'ADULT'};

features = table(:, predictorNames);
label = table.T;
expNum = size(table, 1);

% decision tree
tree = fitctree(features(trans, :), label(trans));
predict = table2array(tree.predict(features(test, :)));
correct = table2array(label(test));
testsize = size(predict, 1);
accuracy = sum(predict == correct)/testsize;
display(accuracy)