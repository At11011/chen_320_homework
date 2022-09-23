%% CHEN 320 - 202 Homework 2
% Problem: 3
% Author: Nathaniel Thomas
% Date: 09/16/2022
% Due:  09/18/2022

%% Problem 3

Q = 850; % Desired heat flux, Btu/(h ft^2)
h = 1.0; % Convective heat transfer coefficient, Btu/(h ft^2 degF)
T = 100 + 459.67; % Surrounding temperature, R
e = 0.9; % Emmisivity, Dimensionless
o = 1.174E-9; % Btu/(h ft R^4)

% Function for determining the average surface temperature
f = @(Ts) h*(Ts - T) + e * o * (Ts^4 - T^4) - Q;

Ts = T*2; % Guess that the average surface is double the surroundings
Ts = fzero(f, Ts);
fprintf("The average surface temperature is %.3f degF \n", Ts - 459.67);