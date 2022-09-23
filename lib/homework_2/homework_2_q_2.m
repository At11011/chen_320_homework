%% CHEN 320 - 202 Homework 2
% Problem: 2
% Author: Nathaniel Thomas
% Date: 09/16/2022
% Due:  09/18/2022

%% Problem 2
r = 15 / 2; % Radius of the spherical tank, ft
V = 500; % Volume of liquid in the tank, ft^3
% Function for determining height
f = @(h) V - (pi .* h.^2 * (3 .* r - h))./3;

% Start with a guess of the tank's radius
h = r;
h = fzero(f, h);

fprintf("The height of liquid in the tank is %.3f ft.\n", h);