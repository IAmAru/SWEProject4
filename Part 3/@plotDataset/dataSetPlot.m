function [ Iz ] = dataSetPlot(Plot, dataset)
    figure
    plot(dataset)
    xlabel(Plot.xlabel)
    ylabel(Plot.ylabel)
    title(Plot.title)
end