clc;
close all;
clear all;
warning off all;

Repeat = 1;
while(Repeat)
    choice = menu('Multiple Sclerosis Detection','Create Database',...
        'SVM Training','Select an Query','Classify', 'Exit');
    
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
            close all;
            clear all;
            clc;
            
            Repeat = 0;
    end
end

disp('Have a Nice Day...');

