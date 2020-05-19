function helperPlotRidge(yChirp,Fs,fridge)
% Plot helper function for the TimeFrequencyAnalysisExample

% Copyright 2016 The MathWorks, Inc.

fsst(yChirp,Fs,'yaxis')
hold on
tChirp = (0:length(yChirp)-1)/Fs;
plot(tChirp*1000,fridge/1000,'LineWidth',2,'Color','r') 
xlabel('Time (ms)'), ylabel('Frequency (kHz)') 
title('Time-Frequency Ridge of a Chirp') 
hold off

end