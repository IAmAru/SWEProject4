function [ Iz ] = chirpFun(obj)

load splat
p = audioplayer(y,obj.Fs,16);
play(p)
figure(obj.FigNum)
pspectrum(y,obj.Fs,'spectrogram')
obj.FigNum = obj.FigNum + 1;

% Let us reconstruct a portion of the "splat" sound by extracting a ridge in 
% the time-frequency plane. We use |fsst| to sharpen the spectrum of a noisy version 
% the splat signal, |tfridge| to identify the ridge of the chirp sound, and |ifsst| 
% to reconstruct the chirp. The process denoises the reconstructed signal.
% 
% Add Gaussian noise to the chirp portion of the "splat" sound. The added noise 
% simulates an audio recording taken with an inexpensive microphone. Examine the 
% time-frequency spectral content.

rng('default')
t = (0:length(y)-1)/obj.Fs;
yNoise = y + 0.1*randn(size(y));
yChirp = yNoise(t<0.35);
figure(obj.FigNum)
pspectrum(yChirp,obj.Fs,'spectrogram','MinThreshold',-70)
obj.FigNum = obj.FigNum + 1;
% Sharpen the spectrum using the Fourier synchrosqueezed transform, |fsst|. 
% |fsst| localizes energy in the time-frequency plane by reassigning energy in 
% frequency for a fixed time. Compute and plot the synchrosqueezed transform of 
% the noisy chirp.

fsst(yChirp,obj.Fs,'yaxis')

% The chirp appears as a localized ridge in the time-frequency plane. Identify 
% the ridge using |tfridge|. Plot the ridge along with the transform.

[sst,f] = fsst(yChirp,obj.Fs); 
[fridge, iridge] = tfridge(sst,f,10);
helperPlotRidge(yChirp,obj.Fs,fridge);

% Next, reconstruct the chirp signal using the ridge index vector |iridge|. 
% Include one bin on each side of the ridge. Plot the spectrogram of the reconstructed 
% signal.

yrec = ifsst(sst,kaiser(256,10),iridge,'NumFrequencyBins',1);
figure(obj.FigNum)
pspectrum(yrec,obj.Fs,'spectrogram','MinThreshold',-70)
obj.FigNum = obj.FigNum + 1;
% Reconstructing the ridge has removed noise from the signal. Play the noisy 
% and denoised signals consecutively to hear the difference.

p = audioplayer([yChirp;zeros(size(yChirp));yrec],obj.Fs,16);
play(p);
end