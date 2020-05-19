function [ Iz ] = leakageParamPlot(obj)

% Listening to the signal, you can tell that a three-digit number was 
% dialed. However, you cannot tell which number it was. Next, visualize 
% the signal in time and in frequency domain over the 650 to 1500 Hz band. 
% Set the 'Leakage' parameter of the pspectrum function to 1 to use a 
% rectangular window and improve frequency resolution.

    obj.N = numel(obj.tones); 
    obj.t = (0:obj.N-1)/obj.Fs;
    subplot(2,1,1);
    plot(1e3*obj.t, obj.tones);
    xlabel('Time (ms)');
    ylabel('Amplitude');
    title('DTMF Signal');
    figure(obj.FigNum);
    subplot(2,1,2);
    pspectrum(obj.tones, obj.Fs, 'Leakage', 1, 'FrequencyLimits', [650, 1500]);
    obj.FigNum = obj.FigNum + 1;

end