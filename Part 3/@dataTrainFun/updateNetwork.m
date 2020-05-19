function [ Iz ] = updateNetwork(obj)
            obj.net = resetState(obj.net);
            obj.net = predictAndUpdateState(obj.net,obj.XTrain);
            obj.YPred = [];
            obj.numTimeStepsTest = numel(obj.XTest);
            for i = 1:obj.numTimeStepsTest
                [obj.net,obj.YPred(:,i)] = predictAndUpdateState(obj.net,obj.XTest(:,i),'ExecutionEnvironment','cpu');
            end
            obj.YPred = obj.sig*obj.YPred + obj.mu;
            obj.rmse = sqrt(mean((obj.YPred-obj.YTest).^2));
            
            figure
            subplot(2,1,1)
            plot(obj.YTest)
            hold on
            plot(obj.YPred,'.-')
            hold off
            legend(["Observed" "Predicted"])
            ylabel("Cases")
            title("Forecast with Updates")

            subplot(2,1,2)
            stem(obj.YPred - obj.YTest)
            xlabel("Month")
            ylabel("Error")
            title("RMSE = " + obj.rmse)
        end