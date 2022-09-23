%% CHEN 320 - 202 Homework 3
% Problem: 1
% Author: Nathaniel Thomas
% Date: 09/23/2022
% Due:  09/25/2022

% [i] stages take solvent W, which contains X_in of A, and solvent S, which
% contains Y_in fraction of A. W and S are immiscible, and A is extraced
% from W.

% Equilibrium is reached in each stage. The equation is as follows;
S = 1000; % Right stream flow rate, kg/hr (Assume constant)
W = 2000; % Left stream flow rate, kg/hr (Assume constant)
X_in = 0.05; % Left stream composition
Y_in = 0.00; % Right stream composition
K = 10; % Equilibrium constant
N = 10; % Number of stages.

clc;

% Matrix for storing information on composition of the W and S streams.
% Rows are stages, columns are X values
X = zeros(N, N + 1);

for i = (2:N + 1)
    X(i - 1, i - 1) = 1;
    X(i - 1, i) = -(1 + K*S/W);
    X(i - 1, i + 1) = (K*S/W);
end

A = zeros(N, 1);    
A(1, 1) = -0.05;
res = X\A;
res;

rec = 100*(X_in - res(10))/X_in;
fprintf("Final percent recovery: %.10f%% \n", rec);



