function [output] = Threshold(signalmatrix)

% THRESHOLD  Thresholds the input signal matrix to prevent unwanted stimulation 
% of the cochlear electrodes
%   [output] = Threshold(signalmatrix) thresholds the input matrix and
%   returns the thresholded signal matrix as an output

inputsignal = signalmatrix(:,1)'; % Initializes column 1 as the signal 1
inputsignal2 = signalmatrix(:,2)'; % Initializes column 2 as the signal 2
inputsignal3 = signalmatrix(:,3)'; % Initializes column 3 as the signal 3
inputsignal4 = signalmatrix(:,4)'; % Initializes column 4 as the signal 4

THR = 0.0002; % Defines the Threshold

for ii = 1:1:length(inputsignal) % Loops through all values of inputsignal
    if inputsignal(ii) >= THR % Selects all signal values above the threshold
        continue % Keeps all values above the threshold in the signal
    else % Selects all signal values below the threshold
        inputsignal(ii) = 0; % Makes any value below the threshold zero
    end
end

for ii = 1:1:length(inputsignal2) % Loops through all values of inputsignal2
    if inputsignal2(ii) >= THR % Selects all signal values above the threshold
        continue % Keeps all values above the threshold in the signal
    else % Selects all signal values below the threshold
        inputsignal2(ii) = 0; % Makes any value below the threshold zero
    end
end

for ii = 1:1:length(inputsignal3) % Loops through all values of inputsignal3
    if inputsignal3(ii) >= THR % Selects all signal values above the threshold
        continue % Keeps all values above the threshold in the signal
    else % Selects all signal values below the threshold
        inputsignal3(ii) = 0; % Makes any value below the threshold zero
    end
end

for ii = 1:1:length(inputsignal4) % Loops through all values of inputsignal4
    if inputsignal4(ii) >= THR % Selects all signal values above the threshold
        continue % Keeps all values above the threshold in the signal
    else % Selects all signal values below the threshold
        inputsignal4(ii) = 0; % Makes any value below the threshold zero
    end
end

plot(inputsignal);
hold on
plot(inputsignal2);
hold on
plot(inputsignal3);
hold on
plot(inputsignal4);
hold off

output = [inputsignal;inputsignal2;inputsignal3;inputsignal4]'; % Returns ouput as envelope-detected matrix

end