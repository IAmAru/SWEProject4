function [ Iz ] = whaleTrillFunc(obj) 
    % The trill signal consists of a train of tonal pulses. Look at the time signal 
    % and the spectrogram obtained by |pspectrum| when no resolution is specified 
    % and when time resolution is set to 10 milliseconds. Set the |'Leakage'| parameter 
    % to 1 to use rectangular windows. Since we want to localize the time position 
    % of the pulses, set overlap percent to 0. Finally, use a |'MinThreshold'| of 
    % $-$60 dB to remove background noise from the spectrogram view. 

    load whaleTrill
    
    p = audioplayer(whaleTrill, obj.Fs,16);
    play(p)
    obj.t = (0:length(whaleTrill)-1)/obj.Fs;
    figure(obj.FigNum)
    ax1 = subplot(3,1,1);
    plot(obj.t, whaleTrill)
    
    
    ax2 = subplot(3,1,2);
    pspectrum(whaleTrill,obj.Fs,'spectrogram','OverlapPercent',0, ...
        'Leakage',1,'MinThreshold',-60)
    colorbar(ax2,'off')
    ax3 = subplot(3,1,3);
    pspectrum(whaleTrill,obj.Fs,'spectrogram','OverlapPercent',0, ...
        'Leakage',1,'MinThreshold',-60,'TimeResolution', 10e-3)
    colorbar(ax3,'off')
    linkaxes([ax1,ax2,ax3],'x')
    xlim([0.3 0.55])
    obj.FigNum = obj.FigNum + 1;
    
end