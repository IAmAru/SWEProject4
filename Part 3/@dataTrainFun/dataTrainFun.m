classdef dataTrainFun < handle
    properties
        net = [];
        YTest = [];
        YPred = [];
        data = [];
        numTimeStepsTrain = 0;
        numTimeStepsTest = [];
        dataTrain = [];
        dataTest = [];
        mu = 0;
        sig = 0;
        dataTrainStandardized = [];
        dataTestStandardized = [];
        XTrain = [];
        YTrain = [];
        numFeatures = 1;
        numResponses = 1;
        numHiddenUnits = 200;
        XTest = [];
        rmse = 0;
    end
    methods (Static)
        function obj = dataTrainFun(data, numTimeStepsTrain)
            obj.data = data;
            obj.numTimeStepsTrain = numTimeStepsTrain;
            obj.dataTrain = data(1:numTimeStepsTrain+1);
            obj.dataTest = data(numTimeStepsTrain+1:end);
            obj.mu = mean(obj.dataTrain);
            obj.sig = std(obj.dataTrain);
            obj.dataTrainStandardized = (obj.dataTrain - obj.mu) / obj.sig;
            obj.XTrain = obj.dataTrainStandardized(1:end-1);
            obj.YTrain = obj.dataTrainStandardized(2:end);
            
        end       
    end
end