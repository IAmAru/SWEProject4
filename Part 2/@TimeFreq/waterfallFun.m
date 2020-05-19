function [ Iz ] = waterfallFun(obj)
    
    obj.Fs = 10e3;
    obj.t = 0:1/obj.Fs:2;
    x1 = vco(sawtooth(2*pi*obj.t,0.5),[0.1 0.4]*obj.Fs,obj.Fs);
    figure(obj.FigNum)
    pspectrum(x1,obj.Fs,'spectrogram','Leakage',0.8)
    obj.FigNum = obj.FigNum + 1;
    view(-45,65)
    colormap bone
end