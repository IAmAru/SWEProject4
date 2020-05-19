function [ Iz ] =  LSTMNArch(obj)
    layers = [ ...
        sequenceInputLayer(obj.numFeatures)
        lstmLayer(obj.numHiddenUnits)
        fullyConnectedLayer(obj.numResponses)
        regressionLayer];

    options = trainingOptions('adam', ...
        'MaxEpochs',250, ...
        'GradientThreshold',1, ...
        'InitialLearnRate',0.005, ...
        'LearnRateSchedule','piecewise', ...
        'LearnRateDropPeriod',125, ...
        'LearnRateDropFactor',0.2, ...
        'Verbose',0, ...
        'Plots','training-progress');

    obj.net = trainNetwork(obj.XTrain,obj.YTrain,layers,options);

    obj.dataTestStandardized = (obj.dataTest - obj.mu) / obj.sig;
    obj.XTest = obj.dataTestStandardized(1:end-1);

    obj.net = predictAndUpdateState(obj.net,obj.XTrain);
    [obj.net,obj.YPred] = predictAndUpdateState(obj.net,obj.YTrain(end));

    obj.numTimeStepsTest = numel(obj.XTest);
    for i = 2:obj.numTimeStepsTest
        [obj.net,obj.YPred(:,i)] = predictAndUpdateState(obj.net,obj.YPred(:,i-1),'ExecutionEnvironment','cpu');
    end

    obj.YPred = obj.sig*obj.YPred + obj.mu;
    obj.YTest = obj.dataTest(2:end);
    obj.rmse = sqrt(mean((obj.YPred-obj.YTest).^2));

    figure
    plot(obj.dataTrain(1:end-1))
    hold on
    idx = obj.numTimeStepsTrain:(obj.numTimeStepsTrain+obj.numTimeStepsTest);
    plot(idx,[obj.data(obj.numTimeStepsTrain) obj.YPred],'.-')
    hold off
    xlabel("Month")
    ylabel("Cases")
    title("Forecast")
    legend(["Observed" "Forecast"])
end