function [A] = specialMatrix(n,m)
%Creates a matrix where the values of each element in the first row is the number of the column.
%The value of each element in the first column is the number of the row.
%The rest of the elements each has a value equal to the sum of the element above it and element to the left.
%Mech105 Review4
if nargin~=2
    error('2 arguments required')
end

% Now the real challenge is to fill in the correct values of A
A(1,:)=1:m;
A(:,1)=1:n;
for i=2:n
    for j=2:m
        A(i,j)=A(i-1,j)+A(i,j-1);
    end
end

end