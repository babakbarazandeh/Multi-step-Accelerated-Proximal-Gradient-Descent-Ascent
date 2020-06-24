clear all 
clc
close all
% rng(20)
% rng(15)
%rng(3)
%rng(9)
rng(30)
%%%%%%%%%%%%%%% Set-up of the problem A_{m * n}+ l * |x|

m = 100%500;       % number of examples
n = 500%2500;      % number of features

x0 = sprandn(n,1,0.05);
A = randn(m,n);
A = A*spdiags(1./sqrt(sum(A.^2))',0,n,n); % normalize columns
v = sqrt(0.001)*randn(m,1);
b = A*x0 + 0* v;
l = 1 ;% .5

F = @(x,A,b,l) norm(A*x-b,2)^2 + l * norm(x,1);
fprintf('solving instance with %d examples, %d variables\n', m, n);
fprintf('nnz(x0) = %d; signal-to-noise ratio: %.2f\n', nnz(x0), norm(A*x0)^2/norm(v)^2);







%%%%%%%%%%%%%% Set-up for algorhtims 
maxit_f = 10; %%% Number of iterations for FISTA
R = 3;
maxit_i = 1; %%% Number of iterations for ISTA
max_i_eva = maxit_f; %%% Number of iteration for evalutiong g(A) in subgradinet and ista
while_instead_of_loop = true;
T = 200; %%%% Number of iteration for outside iteration 
SGD_stepsize = 1e-3; %%%% Step size for Subgradinet when minimizing x
delta = 1e-1; %%%% Projection norm threshold
x_ini = randn(n,1); %%%% Initilization x

[f_s,xi_sub, yi_sub] = sub_minimax(T,A,b, x_ini, maxit_i, delta, l,SGD_stepsize,F,R, max_i_eva,  while_instead_of_loop);
[f_f,xi_fista, yi_fista] = fista_minimax(T,A,b, x_ini,R, maxit_f,delta,l,F); 
[f_i,xi_ista, yi_ista] = ista_minimax(T,A,b,x_ini, maxit_i, delta,l,F, R,max_i_eva);




figure(3)
hold on
plot(log (abs(f_f)),'r','LineWidth',2)
plot(log(abs(f_s)),'g','LineWidth',2)
plot(log(abs(f_i)),'b','LineWidth',2)
legend('Proposed Algorithm','Subgradient Descent-Ascent','Proximal Gradient Descent-Ascent')
xlabel('Iteration Number')
ylabel('Objective Value')
 hold off
 
 figure(4)
hold on

plot(filter_smooth(xi_fista),'r','LineWidth',2)
plot(filter_smooth(xi_sub),'g','LineWidth',2)
plot(filter_smooth(xi_ista),'b','LineWidth',2)
legend('Proposed Algorithm','Subgradient Descent-Ascent','Proximal Gradient Descent-Ascent')
xlabel('Iteration Number')
ylabel('$\mathcal{X} (\bar{\mathbf{\theta}}, \bar{\mathbf{\alpha}}) $','Interpreter','latex')
 hold off
 
figure(5)
hold on
plot(log(abs(yi_fista)),'r','LineWidth',2)
plot(log(abs(yi_sub)),'g','LineWidth',2)
plot(log (abs(yi_ista)),'b','LineWidth',2)
legend('Proposed Algorithm','Subgradient Descent-Ascent','Proximal Gradient Descent-Ascent')
xlabel('Iteration Number')
ylabel('$\mathcal{Y} (\bar{\mathbf{\theta}}, \bar{\mathbf{\alpha}}) $','Interpreter','latex')%ylabel('yi Value')
 hold off
% figure(4)'$\hat{\mathbf{\theta}}_2 = 5\cdot \mathbf{\theta}_2$'\mathcal{Y}({\theta},\bf{\alpha})
% plot(h)


% import matplotlib.pyplot as plt
% plt.close('all')
% 
% plt.figure()
% plt.stem(x0, markerfmt='go')
% plt.stem(x_ista, markerfmt='bo')
% plt.stem(x_fista, markerfmt='ro')
% 
% plt.figure()
% plt.plot(times_ista, pobj_ista, label='ista')
% plt.plot(times_fista, pobj_fista, label='fista')
% plt.xlabel('Time')
% plt.ylabel('Primal')
% plt.legend()
% plt.show()




    
   

 
