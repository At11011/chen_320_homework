%% CHEN 320-202 Homework 1
% Question 6
% Author: Nathaniel Thomas
% Date: 08/25/2022

%% Question 6

syms a b x;
exp = 1 / (a.^2 + (b.^2).*(x.^2));
res = int(exp, x);
fprintf("Expression: %s\n", exp);
fprintf("Integral: %s\n", res);