function [ Iz ] = MeasPow(obj)
    obj.Fs = 1e8;
    bw = 60e6;
    obj.t = 0:1/obj.Fs:10e-6;
    IComp = chirp(obj.t,-bw/2,obj.t(end), bw/2,'linear',90)+0.15*randn(size(obj.t));
    QComp = chirp(obj.t,-bw/2,obj.t(end), bw/2,'linear',0) +0.15*randn(size(obj.t));
    IQData = IComp + 1i*QComp;

    segmentLength = 128;
    figure(obj.FigNum)
    pspectrum(IQData, obj.Fs, 'spectrogram', 'TimeResolution', 1.27e-6, 'OverlapPercent', 90)
    obj.FigNum = obj.FigNum + 1;
end