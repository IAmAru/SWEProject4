classdef plotDataset < handle
    properties
        xlabel = ""
        ylabel = ""
        title = ""
    end
    
    methods (Static)
        function Plot = plotDataset(varargin)
            Plot.xlabel = varargin{1};
            Plot.ylabel = varargin{2};
            Plot.title = varargin{3};
        end
    end
end