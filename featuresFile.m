function gaborVector = featuresFile(imgData)

global FileName;

WIDTH = 128;
imgData = imresize(imgData, [WIDTH, WIDTH]);


%% Gray scale Conversion

Comp = ndims(imgData);
if Comp == 3
    imgData = rgb2gray(imgData);
end

figure(3), imshow(imgData);
testFileName = sprintf('Test Image: %s', FileName);
title(testFileName);


%% Gabour Feature Extraction

imgData = double(imgData);

[gaborFeatures] = gaborConvolve(imgData);
Magnitude = gaborFeatures.gabMag;

gaborVector = reshape(Magnitude, WIDTH*WIDTH, 1);


if 1
    Magnitude = gaborFeatures.gabMag;
    gaborVector = reshape(Magnitude, WIDTH*WIDTH, 1);
    
    figure(4),
    surface(peaks, flipud(gaborFeatures.gabMag),...
        'FaceColor','texturemap',...
        'CDataMapping','direct')
    view(-45,70);
    % colormap(gray);
    title('Gabor Filter');
    
    magmax = max(Magnitude(:));
    if magmax > 0
        gabourImg = Magnitude / magmax;   % normalize
    else
        gabourImg = Magnitude / 1.0;   % normalize
    end
    gabourImg = uint8(gabourImg * 255);
    
    figure(5),
    imshow(gabourImg);
    title('Gabor Image');
end
