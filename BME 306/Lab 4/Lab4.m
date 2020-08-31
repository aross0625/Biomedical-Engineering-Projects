%% BME 306 Lab 4 - Fourier Analysis Introduction
% Alexander Ross 
% 10/14/19

%% Question 1

fs = 400;
t = 0:1/fs:0.125;
s = sin(2*pi*80*t);
DTF = abs(fft(s));

N = length(t)
t2 = 0:(fs/N):(400-(400/N));

figure();
subplot(2,1,1)
plot(t,s);
grid on
hold on
subplot(2,1,2)
plot(t2,DTF)
grid on

% Frequencies of the peaks: 78.4314, 321.5686

%% Question 2
fs = 400;
t = 0:1/fs:0.125;
s = sin(2*pi*80*t);
DTF = fftshift(abs(fft(s)));

N = length(DTF);
t2 = (-fs/2):(fs/N):400/2-400/N;

figure();
subplot(2,1,1)
plot(t,s);
grid on
hold on
subplot(2,1,2)
plot(t2,DTF)
grid on

% Answer: -82.3529, 74.5098


%% Question 3
t = -2.5:1/500:2.5;
s = rectangularPulse(-2,2,t);
plot(t,s);


%% Question 4

fs = 500;
t = -2.5:1/500:2.5;
s = rectangularPulse(-2,2,t);

N = length(t);
t2 = (-fs/2):(fs/N):500/2-500/N;

s2 = abs(4*sinc(4*t2));
s3 = 1/fs*fftshift(abs(fft(s)));

figure();
hold on
plot(t2,s3);
plot(t2,s2)
grid on
hold off

%% Question 5

fs = 500;
t = -5:1/500:5;
s = rectangularPulse(-2,2,t);

N = length(t);
t2 = (-fs/2):(fs/N):500/2-500/N;

s2 = abs(4*sinc(4*t2));
s3 = 1/fs*fftshift(abs(fft(s)));

figure();
hold on
plot(t2,s3);
plot(t2,s2)
grid on
hold off


% -----------

fs = 500;
t = -10:1/500:10;
s = rectangularPulse(-2,2,t);

N = length(t);
t2 = (-fs/2):(fs/N):500/2-500/N;

s2 = abs(4*sinc(4*t2));
s3 = 1/fs*fftshift(abs(fft(s)));

figure();
hold on
plot(t2,s3);
plot(t2,s2)
grid on
hold off

% Answer: Increasing the length of the time vector makes the amplitude of
% the plots closer together.  The analytical solution becomes more
% accurate as the time vector.


%% Question 6

fs = 50;
t = -2.5:1/50:2.5;
s = rectangularPulse(-2,2,t);

N = length(t);
t2 = (-fs/2):(fs/N):50/2-50/N;

s2 = abs(4*sinc(4*t2));
s3 = 1/fs*fftshift(abs(fft(s)));

figure();
hold on
plot(t2,s3);
plot(t2,s2)
grid on
hold off


% -----------

fs = 5000;
t = -2.5:1/5000:2.5;
s = rectangularPulse(-2,2,t);

N = length(t);
t2 = (-fs/2):(fs/N):5000/2-5000/N;

s2 = abs(4*sinc(4*t2));
s3 = 1/fs*fftshift(abs(fft(s)));

figure();
hold on
plot(t2,s3);
plot(t2,s2)
grid on
hold off

% Comparison: The plot of 50Hz is more accurate, while 5000Hz is less accurate for the
% analytical solution than at 500Hz.  The amplitude overlap of the two
% functions is significantly increased at 50Hz, and is reduced at 5000Hz.  
% Additionally, the time vector from the previous problem
% changed, so the dimensions of the plotted function are different.

%% Question 7

% The spectra from Question 5 with the longest time vector showed the most
% accurate depiction of the continious-time signal.  Longer time vector is
% directly related to how well the analytical solution matches the
% continous time signal

%% Question 8

t = 20;

myVoice = audiorecorder;

pause(2);

% Define callbacks to show when
% recording starts and completes.
myVoice.StartFcn = 'disp(''Start speaking.'')';
recordblocking(myVoice,t);
myVoice.StopFcn = 'disp(''End of recording.'')';

doubleArray = getaudiodata(myVoice);

%% Question 9

t = 20;

myVoice2 = audiorecorder;

pause(2);

% Define callbacks to show when
% recording starts and completes.
myVoice2.StartFcn = 'disp(''Start speaking.'')';
recordblocking(myVoice2,t);
myVoice2.StopFcn = 'disp(''End of recording.'')';

doubleArray2 = getaudiodata(myVoice2);

%% Question 10

fs = 8000;
t = (0:1/40:fs/2)';

N = length(t)-1;
t2 = (-(fs/2):(fs/(N)):(8000/2-8000/N))';

s1 = fftshift(abs(fft(doubleArray)));
s2 = fftshift(abs(fft(doubleArray2)));

figure();
hold on
plot(t2,s1);
plot(t2,s2)
grid on
hold off


%% Question 11

cuttoff1 = 0.05*max(s1);
cuttoff2 = 0.05*max(s2);

width1 = [];
width2 = [];

for ii = 1:length(s1)
    if s1(ii) >= cuttoff1
        width1 = [width1, t2(ii)];
    end
end

for jj = 1:length(s2)
    if s2(jj) >= cuttoff2
        width2 = [width2, t2(jj)];
    end
end
    
fprintf('The bandwidth spans from %f. Hz to %f. Hz\n', width1(1), width1(length(width1)));
fprintf('The bandwidth spans from %f. Hz to %f. Hz\n', width2(1), width2(length(width2)));

% Output:
%The bandwidth spans from -1057.650000. Hz to 1057.650000. Hz
%The bandwidth spans from -1040.800000. Hz to 1040.800000. Hz

%% Question 12

fs = 12000;
t = (0:1/26.66666664:fs/2)';

N = length(t);
t2 = (-(fs/2):(fs/(N)):12000/2-12000/N)';

s1 = fftshift(abs(fft(doubleArray)));
s2 = fftshift(abs(fft(doubleArray2)));

figure();
hold on
plot(t2,s1);
plot(t2,s2)
grid on
hold off

% Answer: The amplitude of the spectra at frequencies of about 4000Hz are 
% approxmiately 10-20 units.  It is not important to capture these frequencies 
% in the cochlear implant program because these frequencies are beyond the 
% range of human hearing.  This can be seen in the attached graph, as the
% amplitude of frequencies beyond 4000Hz is not significant to the broader 
% spectra