%% CHEN 320-202 Homework 1
% Question 4
% Author: Nathaniel Thomas
% Date: 08/25/2022

%% Question 4

% Generate values to plot
x = (0:0.01:pi);
y1 = sin(x);
y2 = cos(x);

% Plot graphs
hold on
plot(x,  y1, "-r");
plot(x,  y2, "-b");

% Visual enhancements
grid on
xlim([0, pi]);
ylim([-1.01, 1.01]);
% Draw the x axis
line(xlim, [0, 0], 'Color', 'k', 'LineWidth', 2); 

% Use LaTeX interpreter to print pi symbol
title("Plots of sin(x) and cos(x) from $0 < x < \pi$", "Interpreter", ...
    "latex");
xlabel("x");
ylabel("y");
legend(["sin(x)","cos(x)"]);
