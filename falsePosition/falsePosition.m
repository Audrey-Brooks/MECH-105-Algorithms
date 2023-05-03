function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using the false position method
%requires a minimum of 3 inputs. (function, lower bound guess, upper bound
%guess)

%Checks for number of inputs. Has a set range value for specific inputs
%unless otherwise specified. 
if nargin<3
    error('Function requires 3 inputs')
elseif nargin <4
    es=0.0001;
else nargin<5
    es=0.0001;
    maxit=200;
end

%Define variables (will be adjusted in the next loop)
iter=0;
ea=100;
%Defines functions with upper and lower bound guesses.
fxu= func(xu)
fxl= func(xl)
%Defines xr
xr=xl

%%Checks the function at xr and plugs in xr for either xl or xu depending
%%on the falue of fxu. A new xr is then created with the new points and the
%%process continues until it's within the range of the specified error.
while ea>es
    oldxr=xr
    xr=xu-((fxu*(xl-xu))/(fxl-fxu));

    fxr= func(xr)

    if fxr>0
        xu=xr
    elseif fxr<0
        xl=xr
    else fxr=0
        display(xr)
    end
    iter=iter+1
    ea=abs((xr-oldxr)/xr)*100;
end
iter=1
root=xr
fx=func(xr)
end