%%The following code should be run in the editor:
%t = 0:0.00001:1; 

function sigtot=stimpulse(t)

pps = 1000; % the number of pulses per second
syms x
w1 = 0.00004; %positive pulse width
w2 = 0.00004; %negative pulse width
duty1=w1*pps*100; %positive pulse duty
duty2=w2*pps*100; %negative pulse duty
sig1= (0.5)*square(2*pi*pps*t,duty1)+ 0.5; %positive part of the signal
sig2= (-0.5)*square(2*pi*pps*(t-w1),duty2) - 0.5; %positive part of the signal
sigtot = sig1 + sig2; %total signal output

end

%%The following code should be run in the editor:
%t = 0:0.00001:1; 
%plot(t,stimpulse(t));
%grid on;
%axis([0 1 0 1]);
%xlabel('time'); 
%ylabel('amplitude'); 
%title('1-2 plot'); 

