function [ Iz ] = compareData(obj)
            figure
            subplot(2,1,1)
            plot(obj.YTest)
            hold on
            plot(obj.YPred,'.-')
            hold off
            legend(["Observed" "Forecast"])
            ylabel("Cases")
            title("Forecast")

            subplot(2,1,2)
            stem(obj.YPred - obj.YTest)
            xlabel("Month")
            ylabel("Error")
            title("RMSE = " + obj.rmse)
        end