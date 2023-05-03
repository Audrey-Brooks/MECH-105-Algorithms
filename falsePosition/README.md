# This is a function called falsePosition.
falsePosition finds the root of a function using the false position method. 
# requires a minimum of 3 inputs: 
function, lower bound guess, and upper bound guess.
Can have up to 5 inputs the other 2 being: estimated error, and maximum iterations. 
# Outputs
Root, number of iterations, the estimated error, and the the function evaluated at the root location.
# Example of call code:
[root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
