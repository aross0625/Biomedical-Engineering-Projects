%% BME 306 Lab 1 - introduction to discrete signals 
% Alexander Ross 
% 9/30/19

%% Question 2
% Create a unit rectangle using the rectpuls command and plot it.
clear all;
close all;
clf;
figure(1); % start a new figure
t=-8:0.001:8; % define a time axis
s = rectpuls(t); % unit rectangle
plot(t,s); % create plot
grid on; % add grid lines
axis([-8 8 -4 4]); % scale the display axes
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label
title('1-2 plot'); % supply a figure title 

%% Question 3
length(s);
% The length is 16001
index1 = find(t==0);
% The index of the signal vector at t=0 is 8001

%% Question 4
figure(2); % start a new figure
t=-8:0.1:8; % define a time axis
s = rectpuls(t); % unit rectangle
l=-8:1:8; % define a time axis
g = rectpuls(l); % unit rectangle
plot(l,g);
hold on
plot(t,s); % create plot
grid on; % add grid lines
axis([-8 8 -4 4]); % scale the display axes
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label
title('1-2 plot'); % supply a figure title 
hold off


% As the number of discrete values in the 't' array decreases, the
% accurracy of each rect fucntion decreases as well.  The more indexes the
%'t' array has, the more close to the ideal rect function you will get.

%% Question 5
clear all;
close all;
clf;
figure(3);
t=-8:0.001:8; % define a time axis
s1 = rectpuls(t-2);
s2 = rectpuls(2*t);
s3 = 2*rectpuls(-t-2);
s4 = -rectpuls(t) + 2;

subplot(2,2,1); % create plot
plot(t,s1);
title('plot 1'); % supply a figure title 
axis([-8 8 -4 4]); % scale the display axes
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label

subplot(2,2,2); % create plot
plot(t,s2);
title('plot 2'); % supply a figure title 
axis([-8 8 -4 4]); % scale the display axes
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label

subplot(2,2,3); % create plot
plot(t,s3);
title('plot 3'); % supply a figure title 
axis([-8 8 -4 4]); % scale the display axes
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label

subplot(2,2,4); % create plot
plot(t,s4);
title('plot 4'); % supply a figure title 
axis([-8 8 -4 4]); % scale the display axes
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label

%% Question 6
clear all;
close all;
clf;
figure(3);
t=-8:0.001:8; % define a time axis
syms x
s1 = heaviside(t); %step function 1
s2 = heaviside(t-2);
s3 = heaviside(-t);
s4 = -heaviside(t)+1;

subplot(2,2,1); % create plot
plot(t,s1);
title('plot 1'); % supply a figure title 
axis([-8 8 -4 4]); % scale the display axes
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label

subplot(2,2,2); % create plot
plot(t,s2);
title('plot 2'); % supply a figure title 
axis([-8 8 -4 4]); % scale the display axes
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label

subplot(2,2,3); % create plot
plot(t,s3);
title('plot 3'); % supply a figure title 
axis([-8 8 -4 4]); % scale the display axes
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label

subplot(2,2,4); % create plot
plot(t,s4);
title('plot 4'); % supply a figure title 
axis([-8 8 -4 4]); % scale the display axes
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label

%% Question 7
clear all;
close all;
clf;
figure(4);
t=-8:0.001:8; % define a time axis
syms x
s1 = heaviside(t-2).*cos(2*pi*t);
s2 = rectpuls((t-2.5)/5).* sin(3*t+(pi*(1/6)));
s3 = cos(10*t)+2;
s4 = abs(cos(2*pi*6*t));

subplot(2,2,1); % create plot
plot(t,s1);
title('plot 1'); % supply a figure title 
axis([-8 8 -4 4]); % scale the display axes
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label

subplot(2,2,2); % create plot
plot(t,s2);
title('plot 2'); % supply a figure title 
axis([-8 8 -4 4]); % scale the display axes
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label

subplot(2,2,3); % create plot
plot(t,s3);
title('plot 3'); % supply a figure title 
axis([-8 8 -4 4]); % scale the display axes
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label

subplot(2,2,4); % create plot
plot(t,s4);
title('plot 4'); % supply a figure title 
axis([-8 8 -4 4]); % scale the display axes
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label

%% Question 8
clear all;
close all;
clf;
figure(5);
t=-8:0.001:8; % define a time axis
syms x
s1 = square(2*pi*t*1/3); %square wave
s2 = sawtooth(2*pi*t*1/3); %sawtooth wave
s3 = 1/2*square(2*pi*t*1/3,25)+1/2; % rectangular wave with 25% duty cycle
s4 = sawtooth(2*pi*t*1/3,0.5); %triangle wave

subplot(2,2,1); % create plot
plot(t,s1);
title('plot 1'); % supply a figure title 
axis([-8 8 -4 4]); % scale the display axes
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label

subplot(2,2,2); % create plot
plot(t,s2);
title('plot 2'); % supply a figure title 
axis([-8 8 -4 4]); % scale the display axes
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label

subplot(2,2,3); % create plot
plot(t,s3);
title('plot 3'); % supply a figure title 
axis([-8 8 -4 4]); % scale the display axes
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label

subplot(2,2,4); % create plot
plot(t,s4);
title('plot 4'); % supply a figure title 
axis([-8 8 -4 4]); % scale the display axes
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label

%% Question 9

% See attached file 'stimpulse.m' for Question 9

