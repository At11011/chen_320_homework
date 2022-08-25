%% CHEN 320-202 Homework 1
% Question 5
% Author: Nathaniel Thomas
% Date: 08/25/2022

%% Question 5

syms x;
exp = x .^ 2 + 9 * x + 8;
result = factor(exp);
fprintf("Expression: %s\n", exp);
fprintf("Factor: %s\n", result);