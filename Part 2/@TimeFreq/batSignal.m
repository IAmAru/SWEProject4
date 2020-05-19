function [ Iz ] = batSignal(obj)

    load batsignal
    obj.Fs = 1/obj.DT;
    figure(obj.FigNum)
    pspectrum(batsignal,obj.Fs,'spectrogram','FrequencyResolution',3e3, ...
        'OverlapPercent',99,'MinTHreshold',-60,'Reassign',true)
    obj.FigNum = obj.FigNum + 1;
end