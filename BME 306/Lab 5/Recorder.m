function [output] = Recorder(t)

% RECORDER  Records the an audio signal
%   [output] = Recorder(t) records an audio signal for 't' seconds and
%   returns the audio data array

myVoice = audiorecorder; % Initializes the audio recording

pause(2); % Pause before recording the audio 

% Define callbacks to show when
% recording starts and completes.
myVoice.StartFcn = 'disp(''Start speaking.'')'; % Starts the audio recording
recordblocking(myVoice,t); % Recording the audio
myVoice.StopFcn = 'disp(''End of recording.'')'; % Ends the audio recording

output = getaudiodata(myVoice); % Converting audio recording into a signal array

plot(output);

return

end