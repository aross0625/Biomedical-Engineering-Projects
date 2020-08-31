
function [output] = EnvelopeDetector(filteredsignal,sampf,time)

% ENVELOPEDETECTOR  Detects the envelope of a given signal
%   [output] = EnvelopeDetector(filteredsignal,samplingfrequency) detects
%   the envelope of filteredsignal at the given sampling frequency, 
%   samplingfrequency, and returns the envolope as an array or matrix.
        
inputsignal = abs(filteredsignal(:,1))'; % Initializes column 1 as the signal 1
inputsignal2 = abs(filteredsignal(:,2))'; % Initializes column 2 as the signal 2
inputsignal3 = abs(filteredsignal(:,3))'; % Initializes column 3 as the signal 3
inputsignal4 = abs(filteredsignal(:,4))'; % Initializes column 4 as the signal 4

t2 = 0:(1/2*(sampf-(1/time))):(time); % Time vector for the impulse reponse function
tc = 0.0079577; % Time constant for the impulse response function
impulseresponse = 1/tc.*exp(-t2/tc).*heaviside(t2); % Defines the impulse response function

convolution = (1/(sampf-(1/time))).*conv(inputsignal,impulseresponse); % Envelope-Detection of signal 1
convolution2 = ((1/(sampf-(1/time))).*conv(inputsignal2,impulseresponse)); % Envelope-Detection of signal 2
convolution3 = ((1/(sampf-(1/time))).*conv(inputsignal3,impulseresponse)); % Envelope-Detection of signal 3
convolution4 = ((1/(sampf-(1/time))).*conv(inputsignal4,impulseresponse)); % Envelope-Detection of signal 4

output(:,1) = convolution';
output(:,2) = convolution2';
output(:,3) = convolution3';
output(:,4) = convolution4';

plot(convolution);
hold on
plot(convolution2);
hold on
plot(convolution3);
hold on
plot(convolution4);
hold off

%output = [convolution;convolution2;convolution3;convolution4]'; % Returns ouput as envelope-detected matrix

end
