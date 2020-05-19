% Initializing the dataset. Something that, ultimately, ends up being the
% user's discretion (which is why I'm putting it here in the main file
% rather than anywhere else.
close all
clear

data = chickenpox_dataset;
data = [data{:}];

%From here, the user will be defining the name of the x and y axes and the
%title by creating a class object and feeding it those three arguments.
%This is, essentially, just creating the used object.

p = plotDataset("Month", "Cases", "Monthly Cases of Chickenpox");

%Now using the function dataSetPlot, we just feed it the arguments we
%defined before and the needed data. That's all we need, I believe.

dataSetPlot(p, data);

%Thankfully, the plot is printed out correctly!

%Once again, we have to define things on this end to be able to give the
%user as much control as is needed given the circumstances.

%Here, we're just following the live script, where it's training in the
%first 90% of the data and testing the machine in the last 10%.
%However, this could be defined in the class easily.

numTimeStepsTrain = floor(0.9*numel(data));

%That being said, it's all we need to define on this end. As such, we can
%create another class to store all the given values. In that one, which I 
%called dataTrainFun, I defined the values of mu, sig, XTrain, and YTrain.
% We'll be feeding it the Chickenpox data and the numTimeStepsTrain data.

%From here, it'll be doing everything from training the machine to having
%it predict the data.

a = dataTrainFun(data, numTimeStepsTrain);
LSTMNArch(a);

% With this, I'll now compare the data.

compareData(a);

% And finally, update the network.
updateNetwork(a);
