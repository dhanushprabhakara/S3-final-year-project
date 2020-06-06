clc;
close all;
clear all;
warning off all;

Repeat = 1;
while(Repeat)
    choice = menu('Brain Tumor Detection','Create Database',...
        'SVM Training','Select an Query','Classify',...
        'SVM Bulk Testing', 'Exit');
    
    switch choice
        case 1
            disp('Creating Database');
            featureCollection;
            
        case 2
            disp('SVM Training');
            svmTraining;
            
        case 3
            disp('Query Image');
            selectQuery;
            
        case 4
            disp('Classify');
            svmClassify;
            
        case 5
            disp('SVM Bulk Testing');
            for i = 1:10
                n = 80;
                confMat = multiSvm(n);
                totalVal = sum(confMat(:));
                corrtVal = sum(diag(confMat));
                accuracy(i) = (corrtVal/totalVal)*100;
                accuracy(i)
            end
            fprintf('Accuracy %4f', max(accuracy));
            
        case 6
            close all;
            clear all;
            clc;
            
            Repeat = 0;
    end
end

disp('Have a Nice Day...');

