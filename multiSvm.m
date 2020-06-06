function confMat = multiSvm(nIn)

% Load the feature data.
load('Features.dat');
load('Outtype.dat')

featureVector = Features;
labels = Outtype;

N = length(labels);
n = (N * nIn)/100;

% Split train and test data
randomindices = randperm(N);
randomindices = randomindices(1:n);
otherindices = (1:N)';
testingSetIndex = setdiff(otherindices,randomindices)';
trainingSetIndex = randomindices;

trainfeatures = featureVector(trainingSetIndex,:);
trainLable = labels(trainingSetIndex,:);

testfeatures = featureVector(testingSetIndex,:);
trueLabels = labels(testingSetIndex,:);

disp('svmTraining ... Done');
for testSample = 1:size(testfeatures,1)
    for mSvmN = 1:groupN
        if mSvmN == groupN
            predictedLabels(testSample).slLable=groupN;
        else
            firstGro = find(trainLable == mSvmN);
            secondGro = find(trainLable > mSvmN);
            
            tempLable(firstGro) = mSvmN;
            tempLable(secondGro) = groupN+1;
            tempLable = tempLable(find(tempLable))';
            
            modelSvm = fitcsvm(trainfeatures(find(tempLable),:) ,tempLable);
            predictedLabels(testSample).slLable =  Classificationsvm(modelSvm, testfeatures(testSample,:));
        end
    end
end

disp('svmClassification ... Done');

confMat = confusionmat(trueLabels, predictedLabels);
results = [trueLabels, predictedLabels];
strXLS = sprintf('Results_%d.xlsx', nIn);
xlswrite(strXLS, results);

