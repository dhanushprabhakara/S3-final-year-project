function DecisionValue = svmClassify

load SVMStruct;

load TestFeature.dat;

[DecisionValue] = SVMClass(TestFeature', AlphaY, SVs, Bias, Parameters, nSV, nLabel);

if DecisionValue == 1
    msgbox('Lesion');
elseif DecisionValue == 2
    msgbox('Normal');
end


disp('Done: Classification');

