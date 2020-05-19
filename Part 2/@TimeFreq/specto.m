function [ Iz ] = specto(obj)

% By matching the estimated frequencies to the diagram of the telephone pad, 
% you can say that the dialed buttons were '5', '8', and '0'. However, the frequency-domain 
% plot does not provide any type of time information that would allow you to figure 
% out the order in which they were dialed. The combination could be '580','508','805','850', 
% '085', or '058'. To solve this puzzle, use the pspectrum function to compute 
% the spectrogram and observe how the frequency content of the signal varies with 
% time. 
% 
% Compute the spectrogram over the 650 to 1500 Hz band and remove content below 
% the  $-$10 dB power level to visualize only the main frequency components. To 
% see the tone durations and their locations in time use 0% overlap.

   figure(obj.FigNum);
   pspectrum(obj.tones, obj.Fs, 'spectrogram', 'Leakage', 1, 'OverlapPercent', 0, ...
   'MinThreshold',-10,'FrequencyLimits',[650, 1500]);   
   obj.FigNum = obj.FigNum + 1;
% The colors of the spectrogram encode frequency power levels. Yellow colors 
% indicate frequency content with higher power; blue colors indicate frequency 
% content with very low power. A strong yellow horizontal line indicates the existence 
% of a tone at a particular frequency. The plot clearly shows the presence of 
% a 1336 Hz tone in all three dialed digits, telling you that they are all on 
% the second column of the keypad. From the plot you can see that the lowest frequency, 
% 770 Hz, was dialed first. The highest frequency, 941 Hz, was next. The middle 
% frequency, 852 Hz, came last. Hence, the dialed number was 508.
    
end