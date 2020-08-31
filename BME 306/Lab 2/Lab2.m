%% BME 306 Lab 2 - Introduction to Audio in Matlab
% Alexander Ross 
% 10/7/19

%% Question 1

% The reason is because in principle, the more electrodes one uses, the
% finer the place resolution for coding frequencies

%% Question 2

% The CIS approach is advantagous because it addresses the channel
% interactions issues by using nonsimulatanious, interleaved pulses.  This
% means that only one electrode is stimulated at a time, so that pulses are
% delivered in a nonoverlapping (nonsimulatanious) fasion.

%% Question 3
t = 0:0.2/400:0.2;
fc = 60;
s = sin(2*pi*fc*t);
plot(t,s);

% Step size of the time vector: 0.2/400 Seconds
% Sampling frequency: 2000 Hertz

%% Question 4
t2 = 0:1/800:0.2;
s2 = sin(2*pi*fc*t2);
plot(t,s,'o');
hold on
plot(t2,s2);


%% Question 5
fc = 60;
t3 = 0:0.2/300:0.2;
s3 = sin(2*pi*fc*t3);
t4 = 0:1/400:0.2;
s4 = sin(2*pi*fc*t4);
plot(t3,s3,'o');
hold on
plot(t4,s4);

%% Question 6

fc = 60;
t3 = 0:0.2/24:0.2;
s3 = sin(2*pi*fc*t3);
t4 = 0:1/120:0.2;
s4 = sin(2*pi*fc*t4);
plot(t3,s3,'o');
hold on
plot(t4,s4);

tlim = ([-1 1]);



%% Question 7

fc = 60;
t3 = 0:1/60:0.2;
s3 = sin(2*pi*fc*t3);
t4 = 0:1/70:0.2;
s4 = sin(2*pi*fc*t4);
t5 = 0:0.2/400:0.2;
s5 = -sin(2*pi*fc*t5);
hold on
legend();
plot(t3,s3,'o','DisplayName','60Hz');
plot(t4,s4,'*','DisplayName','70Hz');
plot(t5,s5,'DisplayName','Aliased')
hold off

%% Question 8

% See attached voicetosignal.m
% See attached plot


%% Question 9

% Sampling frequency = 8000Hz
% Bits per sample = 8
% The function records in mono (one channel)

%% Question 10

% See attached voicetosignal.m
% See attached plot

%% Question 11

% See attached voicetosignal.m
% See output function
% See attached plot


%% Question 12

x1 = -5:0.01:5;
x2 = 0:0.01:10;
s1 = abs(x1)+abs(x2);
s2 = abs(x1+x2);
s3 = abs(x1)*4;
s4 = abs(x1*4);

figure();
subplot(2,2,1);
plot(s1);
title('Expected Linear Output (addition)')
subplot(2,2,2);
plot(s2);
axis ([0 1000 0 15]);
title('Actual Linear Output (addition)')
subplot(2,2,3);
plot(s3);
title('Expected Linear Output (multiplication)')
subplot(2,2,4);
plot(s4);
title('Actual Linear Output (multiplication)')

% Explanation: The Expected Linear Output graphs should match the Actual
% Linear Output graphs for both the multiplication and addition properties.
% This is because the functions that are depicted in the plots are the tests
% for linearity.  As can be seen, the mulitiplicitive property holds, 
% however the additive property does not. Since they don't all match, the 
% system is not linear

