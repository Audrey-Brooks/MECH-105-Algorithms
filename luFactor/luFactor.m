function [L, U, P] = luFactor(A)
% luFactor(A) preforms LU decomposition with pivoting.
% inputs: A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix

%%Obtains size for number of rows and columns
n = size(A,1);
m = size(A,2);
h = n-1;

%Checks for a square matrix
if m ~= n
    error('n must equal m')
end

%%Creates a matrix of just zeros
P1 = eye(n,m);
P2 = eye(n,m);

%Creates a matrix of zeros.
Aprime=zeros(n,n)
%Creates an identity matrix
L = eye(n,m);
%Defines values to be used in the loop
Aprime = A;
j=1;
k=1;
%%Preforms the LU Decomposition with pivoting and adjusts the privot
%%matrix
for i=1:n
    for y=1:n
        if abs(A(j,k)) < abs(A(y,k))
            Aprime(j,:) = Aprime(y,:);
            Aprime(y,:) = Aprime(j,:);

            P2(j,:) = P1(y,:);
            P2(y,:) = P1(j,:);
        else
            P2(y,:) = P1(y,:);
        end
    end

    for x = (i+1):n
        MF  = Aprime(x,i) ./ Aprime(i,i);
        L(x,i) = MF;
        EQ = Aprime(i,:).*MF - Aprime(x,:);
        Aprime(x,:) = EQ;
    end
end
U = Aprime
U(2,:)=-U(2,:)
P = P2;

end