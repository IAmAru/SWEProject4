function [ Iz ] = rmsEnvPW(obj)
% The time-domain plot of the signal confirms the presence of three bursts 
% of energy, corresponding to three pushed buttons. To measure the length 
% of the burst, you can take the pulse width of the RMS envelope.

    obj.env = envelope(obj.tones, 80, 'rms');
    figure(obj.FigNum);
    pulsewidth(obj.env, obj.Fs);
    title('Pulse Width of RMS Envelope');
    obj.FigNum = obj.FigNum + 1;
    
end