%% CHEN 320 - 202 Homework 2
% Problem: 1
% Author: Nathaniel Thomas
% Date: 09/16/2022
% Due:  09/18/2022

%% Problem 1(a):
% Reaction: 2CO + + O_2 -> 2CO_2

T = 2000;   % Temperature, K
P = 1;      % Pressure, atm
k = 62.4E6; % Equilibrium constant, atm
n_CO = 2;   % Basis of CO, gmoles
n_O2 = 1;   % Basis of O_2, gmoles
n_N2 = 3.76;% Basis of N_2, gmoles

syms x

% Function handle for final expression
k_func = ((x.^2).*(6.76 - 0.5.*x)) - (k.*(1 - 0.5.*x).*(2-x).^2);

% Function handle for derivative of final expression
k_func_diff = diff(k_func);

% Convert to Matlab Functions
k_func = matlabFunction(k_func);
k_func_diff = matlabFunction(k_func_diff);

x_i = 0.1; % Initial guess for moles of CO reacted, gmoles
x_i1 = x_i - k_func(x_i)./k_func_diff(x_i);

% Newton's Method
% Control loop. Stop after [tol] is reached.

tol=10^-4;  itr_max=100;           % Input tolerance and maximum iterations                         % Input starting point
for i=1:itr_max                    % Begin iterative solution
    fx = k_func(x_i);              % Calculate function  value
    dfx=k_func_diff(x_i);          % Calculate df/fx
    x_i1=x_i-fx/dfx;                % Apply Newton's method
    Rerr=(x_i1-x_i)./x_i1;           % Calculate relative error
                                   % Print out intermediate results
    fprintf(' i=%d  x=%f  f(x)=%f   relative error=%f\n',i,x_i1,fx,Rerr)    
    x_i=x_i1;                       % Tranfer xnew to x0 for next iteration   
    if abs(Rerr)<tol               % Check for convergence
         break
    end
end

if i>itr_max-1                     % Check for maximum iteration limit 
    fprintf('Maximum iterations exceeded without convergence\n')
else
end     

fprintf("The mole fraction is: %.3f\n", x_i1);
% Newton's method cannot converge due to the extremely steep slope at the x
% = 0.1 point.

%% Problem  1(b)
% Illinois Method
tol=10^-4; itr_max=100;           % Input tolerance and maximum iterations 
x0=0.1;                           % Input starting point
f = k_func;                       % Define function as an anonymous function
%
% Bound the root with a positive and negative function value
%
dx=0.1*x0;                       % Set step size dx for bounding the root
if dx<10^-8;dx=10^-8;end         % Clamp dx to 10^-8 if less than this
x1=x0+dx;                        % Increment x by dx
                                 % Move in the desired direction
if abs((x1))>abs(f(x0));dx=-dx;end 
while f(x0)*f(x1)>0              % Check for a bounded root
    x0=x1;                       % Transfer x1 to x0
    x1=x0+dx;                    % If not bounded, continue incrementing 
                                 %      x by dx
end
fprintf('The function has been bounded between x= %f and %f\n',x0,x1)
%
% Begin iterative solution of bounded root using Illinois method
%
fun=f(x0);                       % Initialize fun
for i=1:itr_max
                                 % Apply estimate of the root
    xnew=x1-f(x1)*(x1-x0)/(f(x1)-fun);    
    Rerr=(xnew-x1)/xnew;         % Calculate relative error  
                                 % Print out intermediate results
    fprintf(' i=%d  x=%f  f(x)=%f   relative error=%f\n',i,xnew,f(x1),Rerr)      
                                 % Check for convergence
    if abs(Rerr)<tol,break,end    
    if (f(x1)*f(xnew))<0         % Check for alternating sign of function 
                                 %      values
        x0=x1;                   % Transfer value of xnew to x1 for next 
                                 %      iteration                                  
        x1=xnew;                 % Transfer value of xnew to x1 for next 
                                 %      iteration
        fun=f(x0);               % Use use regula falsi method when the
                                 %      sign of the function alternates
    else
        x1=xnew;                 % Transfer value of xnew to x1 for next
                                 %      iteration
        fun=0.5*f(x0);           % Use Illinois method modification when 
                                 %      the sign does not alternate
    end
end
if i>itr_max-1                    % Check for maximum iteration limit 
    fprintf('Maximum iterations exceeded without convergence\n')
else
end
fprintf("The mole fraction is: %.3f\n", x1);

%% Problem 1(c)

% Use fzero() to find a solution:
xi = 0.1;
res = fzero(k_func, xi);
fprintf("The mole fraction is: %.3f\n", res);