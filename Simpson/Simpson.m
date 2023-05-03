function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
%Inputs
%x = the vector of equally spaced independent variable
%y = the vector of function values with respect to x
% Outputs:
%I = the numerical integral calculated

%%Checks for Valid sizing
if length(x)~=length(y)
    error('Bounds do not match')
end

%%Define bounds
a=min(x);
b=max(x);
r=0;
%%Obtains length of array
n=length(x);

K=length(x);

u=(K+1)/2;
%%checks if array is uniform

if isuniform(x)==0
    error('X vector needs uniform spacing')
end

%%empty matrix of zeros
ods=zeros(1,n);
ev=zeros(1,n);

%Creates a matrix of alternating zeros and 1s
f=linspace(1,n,n);
f=rem(f,2);

%Creates two matrixes containing only 1's and 0's at odd and even values
EvenY=zeros(1,n);
OddY=zeros(1,n);
for i=1:n;
    if f(1,i)==1;
        ev(1,i)=f(1,i);
        ods(1,i)=0;
    else f(1,i)==0;
        ods(1,i)=1;
        ev(1,i)=0;
    end
end

%%Creates two matrices containing only odd and even values
for i=1:n;
    if ods(1,i)==1;
        OddY(1,i)=y(1,i);
        EvenY(1,i)=0;
    else ev(1,i)==1;
        EvenY(1,i)=y(1,i);
        OddY(1,i)=0;
    end
end

%Sets the endpoints of the even and odd matrix equal to zero
EvenY(1,1)=0;
EvenY(1,n)=0;
OddY(1,1)=0;
OddY(1,n)=0;

%%Checks size of n and preforms the 1/3 rule depending on the n value

if n<=1;
    error('Not enough points')
elseif n == 2
    warning('Using Trapezoid Rule')
    I=(b-a)*((y(1,1)+y(1,K))/2);
elseif n==3
    I=(b-a)*(y(1,1)+(4*y(1,u))+y(1,K))/6;
else n>3
    if rem(n,2)==0
      warning('Using Trapezoid Rule')
       I=(b-a)*((y(1,1)+4*(sum(OddY))+2*(sum(EvenY))+y(1,K))/(3*(n-1)))%+(b-a)*((y(1,1)+y(1,K))/2);
    else
        rem(n,2)~=0
        I=(b-a)*((y(1,1)+4*(sum(OddY))+2*(sum(EvenY))+y(1,K))/(3*(n-1)));
    end

end
end