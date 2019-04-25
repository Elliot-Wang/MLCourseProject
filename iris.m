attr_name = ["sepal length", "sepal width", "petal length", "petal width"...
        , "class"];
class_name = ["Iris Setosa", "Iris Versicolour", "Iris Virginica"];

data = csvread("./IrisData/iris_num.csv");
features = data(:, 1:4);
label = data(:, 5);

% data visual
figure(1)
gplotmatrix(features, [], label)
figure(2)
parallelcoords(features, 'Group', label)