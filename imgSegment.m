function segImg = imgSegment(imgTemp, x, y)

if (ndims(imgTemp) == 3)
    imgTemp = rgb2gray(imgTemp);
end

[M N] = size(imgTemp);
m = zeros(M, N);
m(y, x) = 1;

figure();
title('Segementation');
imshow(imgTemp, 'initialmagnification', 'fit', 'displayrange', [0 255]);
hold on;

segImg = contour_generation(imgTemp, m, 300, 0.01);

