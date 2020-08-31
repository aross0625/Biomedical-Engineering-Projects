function [output] = StimulusSignal(signalmatrix,fs,time)

% STIMULUSSIGNAL  Multiplies each each column of the audio matrix by
% a train of stimulus pulses, modulating the original matrix
%   [output] = StimulusSignal(signalmatrix) modulates the input matrix
%   with a stimulus signal and outputs the stimulus pulses in a matrix

inputsignal = signalmatrix(:,1)'; % Initializes column 1 as the signal 1
inputsignal2 = signalmatrix(:,2)'; % Initializes column 2 as the signal 2
inputsignal3 = signalmatrix(:,3)'; % Initializes column 3 as the signal 3
inputsignal4 = signalmatrix(:,4)'; % Initializes column 4 as the signal 4

t = 0:0.000001:time; % Time vector
pps = 1000; % Number of pulses per second
widthA = 0.00004; % Width of the postive pulse in seconds
widthB = 0.00004; % Width of the negative pulse in seconds
dutyA = widthA*pps*100; % Duty of the positive pulse in seconds
dutyB = widthB*pps*100; % Duty of the negative pulse in seconds

positive1= (0.5).*square(pps.*2.*pi.*t,dutyA)+0.5; % Positive pulse
negative1= (-0.5).*square(pps.*2.*pi.*(t-widthA),dutyB)-0.5; % Negative pulse
y1= positive1 + negative1; % Summation of positve and negative pulses

positive2= (0.5).*square(pps.*2.*pi.*(t-0.00008),dutyA)+0.5; % Positive pulse
negative2= (-0.5).*square(pps.*2.*pi.*(t-0.00008-widthA),dutyB)-0.5; % Negative pulse
y2= positive2 + negative2; % Summation of positve and negative pulses

positive3= (0.5).*square(pps.*2.*pi.*(t-0.00016),dutyA)+0.5; % Positive pulse
negative3= (-0.5).*square(pps.*2.*pi.*((t-0.00016)-widthA),dutyB)-0.5; % Negative pulse
y3= positive3 + negative3; % Summation of positve and negative pulses

positive4= (0.5).*square(pps.*2.*pi.*(t-0.00024),dutyA)+0.5; % Positive pulse
negative4= (-0.5).*square(pps.*2.*pi.*((t-0.00024)-widthA),dutyB)-0.5; % Negative pulse
y4= positive4 + negative4; % Summation of positve and negative pulses

plot(t,y1,t,y2,t,y3,t,y4); % Plot to demonstrate pulse sequencing
axis([0 0.001 -2 2]);  % Axis of plot to demonstrate pulse sequencing

t3 = 0:(1)/(fs-(1/time)):time;  % Time vector
inputsignala1 = resample(inputsignal,t3,100000); % Resampling to the desired frequency
inputsignalb2 = resample(inputsignal2,t3,100000); % Resampling to the desired frequency
inputsignalc3 = resample(inputsignal3,t3,100000); % Resampling to the desired frequency
inputsignald4 = resample(inputsignal4,t3,100000); % Resampling to the desired frequency

y1(:,((length(inputsignala1))+1):1:end)=[]; % Reshaping pulse train vectors
y2(:,((length(inputsignalb2))+1):1:end)=[]; % Reshaping pulse train vectors
y3(:,((length(inputsignalc3))+1):1:end)=[]; % Reshaping pulse train vectors
y4(:,((length(inputsignald4))+1):1:end)=[]; % Reshaping pulse train vectors

outputsignal = y1.*inputsignala1; % Mulitplying the first input signal by its respective stimulus pulse train
outputsignal2 = y2.*inputsignalb2; % Mulitplying the second input signal by its respective stimulus pulse train
outputsignal3 = y3.*inputsignalc3; % Mulitplying the third input signal by its respective stimulus pulse train
outputsignal4 = y4.*inputsignald4; % Mulitplying the fourth input signal by its respective stimulus pulse train

plot(outputsignal);
hold on
plot(outputsignal2);
hold on
plot(outputsignal3);
hold on
plot(outputsignal4);
hold off

output = [outputsignal;outputsignal2;outputsignal3;outputsignal4]'; % Returns ouput as envelope-detected matrix

end