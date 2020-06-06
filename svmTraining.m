function svmTraining

% function SVM Train
% Load the featrue data.
load Features.dat
load Outtype.dat

% [models numClasses] = SVMTrain(Features, Outtype);
%
%save SVMStruct models numClasses;

[AlphaY, SVs, Bias, Parameters, nSV, nLabel] = SVMTrain(Features', Outtype');

save SVMStruct_Single AlphaY SVs Bias Parameters nSV nLabel

disp('Done');

