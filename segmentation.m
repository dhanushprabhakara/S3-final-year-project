function segImg = segmentation(imgTemp)

imgR = imresize(imgTemp,[256 256]);
% imgR = double(imgR);
% figure(1),imshow(imgR),title('Original Image');

[x,y] = ginput(1);
x = uint8(x);
y = uint8(y);
segImg = imgSegment(imgR, x, y);
% states = regionprops(segImg,'all');

statRegion = regionprops(segImg, 'all');
eleNo = length(statRegion);

areaThr = 1000;
    for i = 1:eleNo
        area = statRegion(i).Area;
        if areaThr(1) > area
            index = statRegion(i).PixelIdxList;
            segImg(index) = 0;
        end
    end

figure(2),imshow(segImg),title('Segmented Image');

