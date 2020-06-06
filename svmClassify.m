function DecisionValue = svmClassify

load SVMStruct_Single;

load TestFeature.dat;

[DecisionValue] = SVMClass(TestFeature', AlphaY, SVs, Bias, Parameters, nSV, nLabel);

if DecisionValue == 1
    msgbox('Tumor');
elseif DecisionValue == 2
    msgbox('Normal');
end


disp('Done: Classification');

