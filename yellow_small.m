table = readtable('yellow-small.csv');
predictorNames = {'YELLOW', 'SMALL', 'STRETCH', 'ADULT'};

features = table(:, predictorNames);
label = table.T;
expNum = randperm(size(table, 1));
splitN = 10;
trans = expNum(1:splitN);
test = expNum(splitN+1:end);

% decision tree
model = fitctree(features(trans, :), label(trans));
Predict = model.predict(features(test, :));
Correct = label(test);
testsize = size(Predict, 1);
count = 0;
for i = 1:size(Predict, 2)
    p = Predict(i);
    c = Correct(i);
    if(p{1} == c{1})
        count = count+1;
    end
end
accuracy = count/testsize;
display(accuracy)
view(model, 'Mode', 'graph')
model.NodeSize