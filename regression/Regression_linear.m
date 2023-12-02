function [f,r2] = regression_linear(x_num,y_num)
    x_data = x_num;
    y_data = y_num;
    n = length(x_data);
    sumx = sum(x_data);
    sumy = sum(y_data);
    sumxy = sum(x_data.*y_data);
    sumx2 = sum(x_data.^2);
    x_tb = sumx / n;
    y_tb = sumy / n;
    a1 = (n*sumxy - sumx*sumy)/(n*sumx2 - sumx*sumx);
    a0 = y_tb - a1*x_tb;
    Sr = sum((y_data-a0-a1*x_data).^2);
    St = sum((y_data-y_tb).^2);
    r2 = (St - Sr) / St;
    f = @(x) (a0 + a1*x);
end