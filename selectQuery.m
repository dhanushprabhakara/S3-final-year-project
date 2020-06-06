function selectQuery

%% Query Image Reader
close all;

[fileName folderName] = uigetfile({'*.jpg'}, 'Select an Image for Classification', '..\Dataset\Test');

if ~fileName
    warndlg('File not Selected');
    
    return;
end

imgTest = imread([folderName fileName]);

figure(1),imshow(imgTest);title('Query Image');

%% Segmentation
segImg = segmentation(imgTest);

%% feature extraction
[featurePattern] = featuresFile(imgTest);
%% writing in files
fidF = fopen('TestFeature.dat', 'w');

%% writing in file
fprintf(fidF, '%f ', featurePattern(1:150));
fprintf(fidF, '\n');
fclose(fidF);

