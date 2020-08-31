% Alexander Ross 
% 10/14/19
% Introductory Discription: CochlearImplant is designed to be the software
% component of a standard cochlear implant device. It records an audio
% recording, filters it, generates an envelope of it, thresholds it, and
% adds a stimulus signal to it.  This is done by the Recoder function,
% TheFilter function, EnvelopeDetector function, Threshold function, and
% StimulusSignal function.  See the individual function scripts for more 
% detailed information about their functionality.

%% Recorder Function

% Description: The purpose of the Recorder function is to record an audio
% recording and generate a signal vector from that recording.  The ouput of
% the function is the signal vector

fs = 8000; % Sampling Frequence in Hertz

time = input("How long would you like to record for (in seconds)?   "); % Speaking time in seconds of the Recorder Function

Recorder(time); % Calling the Recorder Function

doubleArray = ans; % Defines doubleArray as the output of the Recorder Function

%% TheFilter Function

% Description: The purpose of the TheFilter function is to filter the
% output of the Recorder function and return a 4-column filtered matrix
% with each column being the original vector filtered at a different
% frequency band.

TheFilter(doubleArray,fs); % Calling the TheFilter Function

FilteredMatrix = ans; % Defines FilteredMatrix as the output of the TheFilter Function

%% EnvelopeDetector Function

% Description: The purpose of the EnvelopeDetector function is to detect
% the envelope of the output of the TheFilter function and return a
% matrix with the envelope of each column.  

EnvelopeDetector(FilteredMatrix,fs,time); % Calling the EnvelopeDetector Function

EnvelopeDetectedMatrix = ans; % Defines EnvelopeDetectorMatrix as the output of the EnvelopeDetector Function

%% Threshold Function

% Description: The purpose of the Threshold function is to threshold the
% output of the TheFilter function.  This makes any noise recorded in the
% signal matrix zero.  The output is a matrix of thresholded signals.

Threshold(EnvelopeDetectedMatrix); % Calling the Threshold Function

ThresholdedMatrix = ans; % Defines ThresholdedMatrix as the output of the Threshold Function

%% StimulusSignal Function

% Description: The purpose of the StimulusSignal Function is to create a
% stimulus signal and turn it into the signal matrix by multiplying each
% column by a train of stimulus pulses.  This is known as modulation.  The
% output is a matrix of stimulus pulses

StimulusSignal(ThresholdedMatrix,fs,time); % Calling the StimulusSignal Function

StimulusSignalMatrix = ans; % Defines StimulusSignalMatrix as the output of the StimulusSignal Function


