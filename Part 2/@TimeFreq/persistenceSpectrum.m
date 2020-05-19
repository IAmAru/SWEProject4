function [ Iz ] = persistenceSpectrum(obj)

% Finding Interferences Using Persistence Spectrum
% The persistence spectrum of a signal is a time-frequency view that shows the 
% percentage of the time that a given frequency is present in a signal. The persistence 
% spectrum is a histogram in power-frequency space. The longer a particular frequency 
% persists in a signal as the signal evolves, the higher its time percentage and 
% thus the brighter or "hotter" its color in the display. Use the persistence 
% spectrum to identify signals hidden in other signals.
% 
% Consider an interference narrowband signal embedded within a broadband signal. 
% Generate a chirp sampled at 1 kHz for 500 seconds. The frequency of the chirp 
% increases from 180 Hz to 220 Hz during the measurement.

obj.Fs = 1000;
obj.t = (0:1/obj.Fs:500)';

x = chirp(obj.t,180,obj.t(end),220) + 0.15*randn(size(obj.t));

% The signal also contains a 210 Hz interference, with an amplitude of 0.05, 
% that is present only for 1/6 of the total signal duration.

idx = floor(length(x)/6);
x(1:idx) = x(1:idx) + 0.05*cos(2*pi*obj.t(1:idx)*210);

% Compute the power spectrum of the signal over the 100 to 290 Hz interval. 
% The weak sinusoid is obscured by the chirp.

figure(obj.FigNum)
pspectrum(x,obj.Fs,'FrequencyLimits',[100 290])
obj.FigNum = obj.FigNum + 1; 
% Compute the persistence spectrum of the signal. Now both signal components 
% are clearly visible.
 
figure(obj.FigNum)
colormap parula
pspectrum(x,obj.Fs,'persistence','FrequencyLimits',[100 290],'TimeResolution',1)
end
