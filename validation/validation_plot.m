% Clear
clc; clear; close all;

% define figure properties
opts.Colors     = get(groot,'defaultAxesColorOrder');
opts.saveFolder = 'img/';
opts.width      = 24;
opts.height     = 14;
opts.fontType   = 'Times';
opts.fontSize   = 9;

% create new figure
fig = figure('Position',[1 1 1500 1000]);

% Get data
DefaultDataset = csvread('Default Dataset.csv');
x = DefaultDataset(:,1);
y = DefaultDataset(:,2);

% My values
re = [23000, 40000, 50000, 50000];
cd = [1.30786 1.04939 0.859569 1.136];

% Plot
loglog(re(1),cd(1), 'or', 'MarkerSize', 12)
hold on;
loglog(re(2),cd(2), '^r', 'MarkerSize', 12)
loglog(re(3),cd(3), 'xr', 'MarkerSize', 12)
loglog(re(4),cd(4), '*b', 'MarkerSize', 12)
loglog(x,y, 'k-')
hold off;

% Label Points


% Axis Configurations
axis([1e-1, 1e6, 0.01, 100])
title('Drag Coefficient vs. Reynolds Number')
xlabel('Reynolds Number')
ylabel('$C_d$', 'Interpreter', 'Latex')
legend('$Re = 23000$', '$Re = 40000$', '$Re = 50000$', '$Re = 50000$ 2', 'Experimental', 'Interpreter', 'Latex')

% Scaling
fig.Units               = 'centimeters';
fig.Position(3)         = opts.width;
fig.Position(4)         = opts.height;

% Define tic marks
xtick = [1 2 5];
xtic = [];
for i = -1:5
    a = xtick * 10^i;
    xtic = cat(2, xtic, a);
end
xtic(end+1) = 10^6;
xticks(xtic);
xticklabels({'10^{-1}', '2', '5', '1', '2', '5', '10', '2', '5', '10^2', ...
'2', '5', '10^3', '2', '5', '10^4', '2', '5', '10^5', '2', '5', '10^6'})
set(gca, 'XMinorTick', 'Off');
set(gca, 'XGrid', 'on', 'XMinorGrid', 'off');

ytick = [1 2 4 6 8];
ytic = [];
for i = -2:1
    a = ytick * 10^i;
    ytic = cat(2, ytic, a);
end
ytic(end+1) = 100;
yticks(ytic);
yticklabels({'0.01', '2', '4', '6', '8', '0.1', '2', '4', '6', '8', '1',...
    '2', '4', '6', '8', '10', '2', '4', '6', '8', '100'})
set(gca, 'YMinorTick', 'Off');
set(gca, 'YGrid', 'on', 'YMinorGrid', 'off');

% Text Properties
set(fig.Children, ...
    'FontName',     'Times', ...
    'FontSize',     12);

% remove unnecessary white space
set(gca,'LooseInset',max(get(gca,'TightInset'), 0.02))