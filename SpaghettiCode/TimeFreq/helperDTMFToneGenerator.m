function [tones, Fs, f, lfg, hfg] = helperDTMFToneGenerator(symbols, concatFlag)
% helper function for the DFTEstimationExample and TimeFrequencyAnalysisExample

% Copyright 2015 The MathWorks, Inc.

% Telephone pad symbols = {'1','2','3','4','5','6','7','8','9','*','0','#'}

if nargin < 1,
    symbols = {'5','0','8'};
end

if  nargin < 2
  concatFlag = true;
end


lfg = [697 770 852 941]; % Low frequency group
hfg = [1209 1336 1477];  % High frequency group

% Generate 12 frequency pairs
f   = [reshape(ones(3,1)*lfg,1,12); repmat(hfg,1,4)];

% Generate DTMF tones
Fs  = 8000;       % Sampling frequency 8 kHz
N   = 800;        % Tones of 100 ms
t   = (0:N-1)/Fs; % 800 samples at Fs
pit = 2*pi*t;
tones = zeros(N,numel(symbols));
for i=1:numel(symbols),
    switch (symbols{i})
        case '1'
            tones(:,i) = sum(sin(f(:,1)*pit))';
        case '2'
            tones(:,i) = sum(sin(f(:,2)*pit))';
        case '3'
            tones(:,i) = sum(sin(f(:,3)*pit))';
        case '4'
            tones(:,i) = sum(sin(f(:,4)*pit))';
        case '5'
            tones(:,i) = sum(sin(f(:,5)*pit))';
        case '6'
            tones(:,i) = sum(sin(f(:,6)*pit))';
        case '7'
            tones(:,i) = sum(sin(f(:,7)*pit))';
        case '8'
            tones(:,i) = sum(sin(f(:,8)*pit))';
        case '9'
            tones(:,i) = sum(sin(f(:,9)*pit))';
        case '*'
            tones(:,i) = sum(sin(f(:,10)*pit))';
        case '0'
            tones(:,i) = sum(sin(f(:,11)*pit))';
        case '#'
            tones(:,i) = sum(sin(f(:,12)*pit))';
    end
end
if concatFlag
  % Insert pause between delays
  tones = [tones; 0.05*randn(N/8,numel(symbols))];
  tones = [0.05*randn(N/8,1); tones(:)];
end