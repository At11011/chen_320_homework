%% CHEN 320-202 Homework 1
% Author: Nathaniel Thomas
% Date: 08/25/2022

%% Problem 1 (Part 1)

% Given values
p = 1000; % kg/m^3

% Source: https://www.engineeringtoolbox.com/water-dynamic-kinematic-viscosity-d_596.html
mu = 0.0008891; % N*s/m^2

d = 0.5; % m

% Get user input
u = input("Please enter a flow velocity (m/s): ");

% Calculate friction factor
re = reynolds_number(p, u, mu, d);
f = friction_factor(re);

fprintf("Friction factor: %.5f \n", f);

%% Problem 1 (Part 2)
vel = (0.001:0.05:1);
re_mult = reynolds_number(p, vel, mu, d);
f_mult = friction_factor(re_mult);

% Plot the values
plot(vel, f_mult);
title("Friction factor vs Fluid velocity for water in a 0.5m pipe" + ...
    " at $25\ ^\circ C$", "Interpreter", "latex");
xlabel("Velocity $\frac{m}{s}$", "Interpreter", "latex");
ylabel("Friction factor", "Interpreter", "latex");
%% Problem 2
pi = pi_sum();
fprintf("Value of pi: %.10f\n", pi);

%% Problem 3


%% Functions for Homework 1

%% Question 1 functions

% Function for calculating Reynolds number
% Input parameters:
% p = density (kg/m^3)
% u = flow velocity (m/s)
% mu = dynamic viscosity
% d = inner diameter (m)
% 
% Output:
% re = Reynolds number 
function re = reynolds_number(p, u, mu, d)
    % Uses dot operators to allow use on arrays
    re = p .* u .* d ./ mu;
end

% Function for calculating friction factor
% Input parameters:
% re = Reynolds number
% 
% Output:
% f = friction factor
function f = friction_factor(re)
    f = zeros(1, length(re));

    % Control flow is not elemental, hence the for-loop
    for i = (1:length(f))
        if re(i) <= 2100
            f(i) = 16./re(i);
        elseif re(i) < 1E5
            f(i) = 0.0791./(re(i).^0.25);
        else
            f(i) = 0.004;
        end
    end
end

%% Question 2 functions

% Function for calculating pi
% 
% Output:
% pi = pi estimate, where 
% (last term of the summation) / (pi estimate) < 10 ^ -8
function pi = pi_sum()
    k = 0;
    pi = 0;
    last = 1;

    % Dividing 1 / 0 gives "inf" value in MATLAB, first iteration OK
    while abs(last / pi) >= 1E-8
        last = sqrt(12) .* (-3).^-k / (2.*k + 1);
        pi = pi + last;
        k = k + 1;
    end
end