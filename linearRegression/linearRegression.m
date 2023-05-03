function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%Computes the linear regression based on inputs:
%1. x: x-values for our data set
%2. y: y-values for our data set
%Outputs:
%1. fX: x-values with outliers removed
%2. fY: y-values with outliers removed
%3. slope: slope from the linear regression y=mx+b
%4. intercept: intercept from the linear regression y=mx+b
%5. Rsquared: R^2, a.k.a. coefficient of determination


%%Sorts data
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder)

%%Compares length of both arrays
Lx=length(x);
Ly=length(y);
%Checks that x and y have the same number of inputs
if Lx~=Ly
    error('X and Y must contain the same number of points')
end

%%Determines the number of data points
n=length(x);

%%Determines first and third quartile
firstquartile=floor((n+1)/4);
thirdquartile=floor((3*n+3)/4);

%% y points at first and third quartile
Q1=sortedY(firstquartile);
Q3=sortedY(thirdquartile);

IQR=Q3-Q1;

%%Error  thresholds
lowthreshold = Q1 - (1.5*IQR);
highthreshold = Q3 + (1.5*IQR);

xi=x
yi=y
x = []
y = []

for i=1:n
    if yi(i) >= lowthreshold && yi(i) <= highthreshold
        y = [y,yi(i)]
        x = [x,xi(i)] 
    end
end
n=length(x)

%%Sorts data again
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder)

%%Value for fx and fy
fX=sortedX
fY=sortedY

%%Average y
ybar=mean(y);

%%Normal equations
slope=(n*sum(x.*y)-(sum(x)*sum(y)))/(n*sum(x.^2)-(sum(x))^2)

intercept=ybar-slope*(mean(x))

%%equations to calculate R squared
SStot=sum((y-ybar).^2);

SSres=sum((y-(x.*slope+intercept)).^2);
%% R squared
Rsquared=1-(SSres/SStot)


end