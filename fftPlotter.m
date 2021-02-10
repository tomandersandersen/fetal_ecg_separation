function fftPlotter(t, y, title_string)
T = t(end) - t(1);
L = length(y);
dt = T/L;
Fs = 1/dt;
Y = fft(y);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

custom_title = 'FFT: ' + title_string;
figure('Name',custom_title,'NumberTitle','off')
plot(f,P1) 
title(custom_title)
xlabel('f [Hz]')
ylabel('|P(f)|')
grid minor;


end
