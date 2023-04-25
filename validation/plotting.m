clc;

% Format forces re=26000
re26000 = readtable('re26000.dat');
re26000 = re26000{:,3};
re26000 = split(re26000, ' ');
re26000 = re26000(:,1:3);
re26000 = erase(re26000, ")");
re26000 = str2double(re26000);

% Format forces re=40000
re40000 = readtable('re40000.dat');
re40000 = re40000{:,3};
re40000 = split(re40000, ' ');
re40000 = re40000(:,1:3);
re40000 = erase(re40000, ")");
re40000 = str2double(re40000);

% Format forces re=50000
re50000 = readtable('re50000.dat');
re50000 = re50000{:,3};
re50000 = split(re50000, ' ');
re50000 = re50000(:,1:3);
re50000 = erase(re50000, ")");
re50000 = str2double(re50000);

% Format forces re=50000
re50000_2 = readtable('re50000_2.dat');
re50000_2 = re50000_2{:,3};
re50000_2 = split(re50000_2, ' ');
re50000_2 = re50000_2(:,1:3);
re50000_2 = erase(re50000_2, ")");
re50000_2 = str2double(re50000_2) + 2;

% Time
t = 0:0.0001:5;

% Calculate Cd
rho = 1;
u = 0.65;
u2 = 1;
u3 = 1.25;
A = 0.2 * 0.04;
cd26000 = 2 * re26000(:,1) / (rho * u^2 * A);
cd40000 = 2 * re40000(:,1) / (rho * u2^2 * A);
cd50000 = 2 * re50000(:,1) / (rho * u3^2 * A);
cd50000_2 = 2 * re50000_2(:,1) / (998 * u3^2 * A);

% Plot Controls
hold on;
%plot(t, forces(:, 1), 'DisplayName','$F_x$')
plot(t, cd26000, 'DisplayName','$Re = 26000$')
plot(t, cd40000, 'DisplayName','$Re = 40000$')
plot(t, cd50000, 'DisplayName','$Re = 50000$')
plot(t(1:length(cd50000_2)), cd50000_2, 'DisplayName','$Re = 50000$ 2')
hold off;
legend('Interpreter','latex','FontSize',14)
xlabel('t $[s]$','Interpreter','latex')
title('Drag Coefficient $C_D$', 'Interpreter', 'latex')
