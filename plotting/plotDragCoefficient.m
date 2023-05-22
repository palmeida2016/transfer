%% Header
% Script to read forces.dat file from a simulation and plot drag
% coefficient as a function of time.

%% Clear workspace
clc; clear; close all;

%% Define constants
global rho u A;
rho = 998; % Water Density
u = 1.25; % Mean Flow Velocity
A = 0.2 * 0.04; % Frontal Area

movAvgN = 100; % Moving Average of Last N values

%% Define files to read
files = {   '/home/palmeida/Research/conferences/ffs/rotating_re50000_empty/static.dat';
%             '/home/palmeida/Research/conferences/ffs/rotating_re50000_empty/w30.dat';
            '/home/palmeida/Research/conferences/ffs/rotating_re50000_empty/w50.dat';
            '/home/palmeida/Research/conferences/ffs/rotating_re50000_empty/w80.dat';
            '/home/palmeida/Research/conferences/ffs/rotating_re50000_empty/a50.dat';
};

headers = { 'Static' ;
            %'$\omega_{3,4} = 30 \, rad/s$';
            '$\omega_{2,4} = 50 \, rad/s$';
            '$\omega_{2,4} = 80 \, rad/s$';
            '$\omega_{1,3} = 50 \, rad/s$';
};

%% Read and Plot files
hold on;
for i = 1:length(files)
    [time, force] = readData(files{i});
    cd = calculateCd(force);
    cd_mov_average = sum(cd(end-(movAvgN-1):end)) / movAvgN;
    fprintf('Average Cd = %2.4f for case: %s\n', cd_mov_average, headers{i});
    plot(time, cd,"DisplayName",headers{i});
%     yline(cd_mov_average, '--', 'HandleVisibility','off');
end
hold off;

%% Plot Settings
legend('Interpreter','latex','FontSize',18);
xlabel('t $[s]$','Interpreter','latex',"FontSize",18);
ylabel('$C_d$', 'Interpreter', 'latex',"FontSize",18);
title('Drag Coefficient $C_D$', 'Interpreter', 'latex',"FontSize",24);

%% Helper Functions
function [time,force] = readData(name)
    data = readtable(name);

    % Read Time
    time = data{:,1};

    % Read Forces
    force = data{:,3};
    force = split(force, ' ');
    force = force(:,1);
    force = erase(force, ")");
    force = str2double(force);
end

function cd = calculateCd(force)
    global rho u A;

    cd = 2 * force / (rho * u^2 * A);
end