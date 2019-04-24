attr = ["sepal length", "sepal width", "petal length", "petal width"...
        , "class"];
class_name = ["Iris Setosa", "Iris Versicolour", "Iris Virginica"];

data = csvread("./IrisData/iris_num.csv");
gplotmatrix(data(:,1:4), [], data(:,5))