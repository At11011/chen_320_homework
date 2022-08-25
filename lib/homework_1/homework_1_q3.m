%% CHEN 320-202 Homework 1
% Question 3
% Author: Nathaniel Thomas
% Date: 08/25/2022

%% Question 3 Plain Plot
x = (0:0.01:pi);
y = sin(x);
plot(x, y);
hold off

%% Question 3 Enhanced Plot
x = (0:0.01:pi);
y = sin(x);
plot(x, y, "-k");
hold on
title("Plot of sin(x), $0 < x < \pi$", "Interpreter", "latex");
xlabel("x");
ylabel("y");
xlim([0, pi]);
ylim([0, 1.01]);
