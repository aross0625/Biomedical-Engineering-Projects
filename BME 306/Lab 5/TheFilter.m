function [output] = TheFilter(AudioSignal,SamplingFrequency)

% THEFILTER  Filters an audio signal vector at 4 different frequency bands
%   [output] = TheFilter(doubleArray,fs) filters the audio signal
%   doubleArray at the given sampling frequency fs and returns the filtered
%   signal as an 4-column matrix, with each column being the filtered
%   signal filtered at a different fequency band.

fs = SamplingFrequency;

[b1,a1] = butter(5, [100 400]/(fs/2)); 
[b2,a2] = butter(5, [400 800]/(fs/2)); 
[b3,a3] = butter(5, [800 1300]/(fs/2)); 
[b4,a4] = butter(5, [1300 1800]/(fs/2));

y = filter(b1,a1,AudioSignal)';
y1 = filter(b2,a2,AudioSignal)';
y2 = filter(b3,a3,AudioSignal)';
y3 = filter(b4,a4,AudioSignal)';

% To test: initialize AudioSignal as s

t = (0:1/fs:0.9999)';
s = cos(2*pi*200*t)+cos(2*pi*600*t)+cos(2*pi*1050*t)+cos(2*pi*1550*t);

plot(AudioSignal)
hold on
plot(y);
hold on
plot(y1);
hold on
plot(y2);
hold on
plot(y3);
hold off
legend('original','100-400Hz range','400-800Hz range','800-1300Hz range','1300-1800Hz range')

output = [y;y1;y2;y3]'; % Returns a matrix of the filtered audio signal at different pass bands in 4 different columns

end