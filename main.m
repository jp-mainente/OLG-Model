
% This is a script that implements the
% canonical Diamond OLG Model with perfect foresight and a log utility
% function.
%
% The utility of a given individual is given by:
% U(c1(t),c2(t+1) = log(c1(t) + beta * log(c2(t+1)
%
% The production function is assumed to be Cobb Douglas:
% Y(t) = A * K(t-1)^alpha * L(t) ^(1-alpha)
%
% Population grows at rate n: L(t) = (1+n)^L(0)
%
% One period in the model corresponds to 30 years.
%
% The dynare notation is consistent since I use predetermined_variables 

clear;close all; clc;

% -- Model with change in the population growth n --
% Permanent
dynare olg_dynare_perm_chg
path_perm = oo_.endo_simul';

% Temporary
dynare olg_dynare_temp_chg
path_temp = oo_.endo_simul';

% path_perm = path_temp;- Useful for debugging only

% -- Order of variables in the path: c1, c2, C, y, k, r, w, s --

% -- Graphs --

figure('Color','w','Name','SS Impact on Changes in Pop. Growth Rt.')
set(gcf, 'Position',  [100, 100, 700, 700])
subplot(3,2,1)
h1 = plot(path_perm(:,5));
hold on
h2 = plot(path_temp(:,5));
xlim([1 30])
hleg = legend([h1 h2],"Permanent", ...
                      "Temporary");
set(h1,"LineWidth",2,"Color","k");
set(h2,"LineStyle",'--',"LineWidth",2,"Color",[96/255 96/255 96/255]);
title("Capital",'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
set(hleg,'Interpreter','latex','Location','East','FontSize',9)
xlabel('t','FontSize',11,'Interpreter','latex')
hold off

subplot(3,2,2)
h1 = plot(path_perm(:,4));
hold on
h2 = plot(path_temp(:,4));
xlim([1 30])
hleg = legend([h1 h2],"Permanent", ...
                      "Temporary");
set(h1,"LineWidth",2,"Color","k");
set(h2,"LineStyle",'--',"LineWidth",2,"Color",[96/255 96/255 96/255]);
title("Output",'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
set(hleg,'Interpreter','latex','Location','East','FontSize',9)
xlabel('t','FontSize',11,'Interpreter','latex')
hold off

subplot(3,2,3)
h1 = plot(path_perm(:,3));
hold on
h2 = plot(path_temp(:,3));
xlim([1 30])
hleg = legend([h1 h2],"Permanent", ...
                      "Temporary");
set(h1,"LineWidth",2,"Color","k");
set(h2,"LineStyle",'--',"LineWidth",2,"Color",[96/255 96/255 96/255]);
title("Aggregate Consumption",'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
set(hleg,'Interpreter','latex','Location','NorthEast','FontSize',9)
xlabel('t','FontSize',11,'Interpreter','latex')
hold off

subplot(3,2,4)
h1 = plot(path_perm(:,8));
hold on
h2 = plot(path_temp(:,8));
xlim([1 30])
hleg = legend([h1 h2],"Permanent", ...
                      "Temporary");
set(h1,"LineWidth",2,"Color","k");
set(h2,"LineStyle",'--',"LineWidth",2,"Color",[96/255 96/255 96/255]);
title("Savings",'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
set(hleg,'Interpreter','latex','Location','East','FontSize',9)
xlabel('t','FontSize',11,'Interpreter','latex')
hold off

subplot(3,2,5)
h1 = plot(path_perm(:,6));
hold on
h2 = plot(path_temp(:,6));
xlim([1 30])
hleg = legend([h1 h2],"Permanent", ...
                      "Temporary");
set(h1,"LineWidth",2,"Color","k");
set(h2,"LineStyle",'--',"LineWidth",2,"Color",[96/255 96/255 96/255]);
title("Interest Rate",'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
set(hleg,'Interpreter','latex','Location','East','FontSize',9)
xlabel('t','FontSize',11,'Interpreter','latex')
hold off

subplot(3,2,6)
h1 = plot(path_perm(:,7));
hold on
h2 = plot(path_temp(:,7));
xlim([1 30])
hleg = legend([h1 h2],"Permanent", ...
                      "Temporary");
set(h1,"LineWidth",2,"Color","k");
set(h2,"LineStyle",'--',"LineWidth",2,"Color",[96/255 96/255 96/255]);
title("Wage",'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
set(hleg,'Interpreter','latex','Location','East','FontSize',9)
xlabel('t','FontSize',11,'Interpreter','latex')
hold off


% -- Model change in the TFP A --
% Permanent
dynare olg_dynare_perm_chg_tfp
path_perm = oo_.endo_simul';

% Temporary
dynare olg_dynare_temp_chg_tfp
path_temp = oo_.endo_simul';


% -- Order of variables in the path: c1, c2, C, y, k, r, w, s --

% -- Graphs --

figure('Color','w','Name','SS Impact on Changes in TFP')
set(gcf, 'Position',  [100, 100, 700, 700])
subplot(3,2,1)
h1 = plot(path_perm(:,5));
hold on
h2 = plot(path_temp(:,5));
xlim([1 30])
hleg = legend([h1 h2],"Permanent", ...
                      "Temporary");
set(h1,"LineWidth",2,"Color","k");
set(h2,"LineStyle",'--',"LineWidth",2,"Color",[96/255 96/255 96/255]);
title("Capital",'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
set(hleg,'Interpreter','latex','Location','East','FontSize',9)
xlabel('t','FontSize',11,'Interpreter','latex')
hold off

subplot(3,2,2)
h1 = plot(path_perm(:,4));
hold on
h2 = plot(path_temp(:,4));
xlim([1 30])
hleg = legend([h1 h2],"Permanent", ...
                      "Temporary");
set(h1,"LineWidth",2,"Color","k");
set(h2,"LineStyle",'--',"LineWidth",2,"Color",[96/255 96/255 96/255]);
title("Output",'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
set(hleg,'Interpreter','latex','Location','East','FontSize',9)
xlabel('t','FontSize',11,'Interpreter','latex')
hold off

subplot(3,2,3)
h1 = plot(path_perm(:,3));
hold on
h2 = plot(path_temp(:,3));
xlim([1 30])
hleg = legend([h1 h2],"Permanent", ...
                      "Temporary");
set(h1,"LineWidth",2,"Color","k");
set(h2,"LineStyle",'--',"LineWidth",2,"Color",[96/255 96/255 96/255]);
title("Aggregate Consumption",'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
set(hleg,'Interpreter','latex','Location','East','FontSize',9)
xlabel('t','FontSize',11,'Interpreter','latex')
hold off

subplot(3,2,4)
h1 = plot(path_perm(:,8));
hold on
h2 = plot(path_temp(:,8));
xlim([1 30])
hleg = legend([h1 h2],"Permanent", ...
                      "Temporary");
set(h1,"LineWidth",2,"Color","k");
set(h2,"LineStyle",'--',"LineWidth",2,"Color",[96/255 96/255 96/255]);
title("Savings",'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
set(hleg,'Interpreter','latex','Location','East','FontSize',9)
xlabel('t','FontSize',11,'Interpreter','latex')
hold off

subplot(3,2,5)
h1 = plot(path_perm(:,6));
hold on
h2 = plot(path_temp(:,6));
xlim([1 30])
hleg = legend([h1 h2],"Permanent", ...
                      "Temporary");
set(h1,"LineWidth",2,"Color","k");
set(h2,"LineStyle",'--',"LineWidth",2,"Color",[96/255 96/255 96/255]);
title("Interest Rate",'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
set(hleg,'Interpreter','latex','Location','East','FontSize',9)
xlabel('t','FontSize',11,'Interpreter','latex')
hold off

subplot(3,2,6)
h1 = plot(path_perm(:,7));
hold on
h2 = plot(path_temp(:,7));
xlim([1 30])
hleg = legend([h1 h2],"Permanent", ...
                      "Temporary");
set(h1,"LineWidth",2,"Color","k");
set(h2,"LineStyle",'--',"LineWidth",2,"Color",[96/255 96/255 96/255]);
title("Wage",'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
set(hleg,'Interpreter','latex','Location','East','FontSize',9)
xlabel('t','FontSize',11,'Interpreter','latex')
hold off

