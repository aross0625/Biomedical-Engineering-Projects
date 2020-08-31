function [signal] = voicetosignal(t,question)

myVoice = audiorecorder;

pause(2);

% Define callbacks to show when
% recording starts and completes.
myVoice.StartFcn = 'disp(''Start speaking.'')';
recordblocking(myVoice,t);
myVoice.StopFcn = 'disp(''End of recording.'')';

doubleArray = getaudiodata(myVoice);

Fs = 8000;
time = 0:1/Fs:(Fs*t)/Fs-1/Fs;

plot(time,doubleArray);
xlabel('time'); % supply a x-axis label
ylabel('amplitude'); % supply a y-axis label
title('Audio Signal');

signal = (doubleArray)';

fprintf('The sampling frequency is %d\n', Fs);

%question = input('Would you like to hear what you just said? Please type "1" for yes or "2" for no\n');
  if question == 1
      play(myVoice);
      pause(t);
  else
      return
  end 


end


function [output] = EnvelopeDetector()

myVoice = audiorecorder;

pause(2);

% Define callbacks to show when
% recording starts and completes.
myVoice.StartFcn = 'disp(''Start speaking.'')';
recordblocking(myVoice,5);
myVoice.StopFcn = 'disp(''End of recording.'')';

doubleArray = getaudiodata(myVoice);
subplot(2,1,2);
plot(abs(doubleArray));
title('Audio Signal (rectified)');
subplot(2,1,1)
plot(doubleArray)
title('Audio Signal (double)');

end

