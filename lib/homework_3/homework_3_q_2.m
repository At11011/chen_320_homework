%% CHEN 320 - 202 Homework 3
% Problem: 2
% Author: Nathaniel Thomas
% Date: 09/23/2022
% Due:  09/25/2022

clc
A_init = 1.0; % Initial concentration of A in the reactor, gmol/litre

% Rate constants for all reactions, forward and backwards, 1/s
K_ab = 0.1; K_ba = 0.02; K_bc = 0.5; K_cb = 0.1; K_cd = 0.01; K_dc = 0.1;
K_da = 0.05; K_ad = 0.2; K_bd = 0.3; K_db = 0.1;

% Concentration generation of all components [C_A, C_B, C_C, C_D]
C = [-K_ab - K_ad, K_ba, 0, K_da;
    K_ab, -K_ba - K_bc - K_bd, K_cb, K_db;
    0, K_bc, -K_cb - K_cd, K_dc;
    K_ad, K_bd, K_cd, -K_da - K_dc - K_db;
    1, 1, 1, 1];
A = [0, 0, 0, 0, 1]';
res = C\A;

fprintf("The concentrations of A, B, C, and D are:\n %.5f, %.5f," + ...
    " %.5f, and %.5f gmol/litre.\n", ...
    res(1), res(2), res(3), res(4));







