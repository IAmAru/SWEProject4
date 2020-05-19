a = TimeFreq();
p = audioplayer(a.tones, a.Fs, 16);
play(p)

leakageParamPlot(a);
rmsEnvPW(a);
specto(a);
whaleTrillFunc(a);
batSignal(a);
chirpFun(a);
MeasPow(a);
logFreqS(a);
waterfallFun(a);
persistenceSpectrum(a);