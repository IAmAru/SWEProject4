function [ Iz ] = logFreqS(obj)
    obj.Fs = 1e3;                    
    obj.t = 0:1/obj.Fs:10;               
    fo = 10;                     
    f1 = 400;                    
    y = chirp(obj.t,fo,10,f1,'logarithmic');
    figure(obj.FigNum)
    pspectrum(y,obj.Fs,'spectrogram','FrequencyResolution',1, ...
        'OverlapPercent',90,'Leakage',0.85,'FrequencyLimits',[1 obj.Fs/2]) 
    obj.FigNum = obj.FigNum + 1;
    % The spectrogram of the chirp becomes a straight line when the frequency scale 
    % is logarithmic.

    ax = gca;
    ax.YScale = 'log';