classdef TimeFreq  < handle
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        FigNum = 1;
        tones = helperDTMFToneGenerator(); 
        Fs = 8000;
        DT = 7e-6;
        p = [];
        N = [];
        t = 0;
        env = [];
    end
    
    methods
        function obj=TimeFreq(varargin)
        end
        
    end
end

