myImage = imread('JetSkiAir.jpg');
% convertedImage = uint8(myImage);
imshow(myImage)
[width,height,depth]=size(myImage);
totalSize = width*height;
fprintf('Vertical number of pixels is: %d\n', width);
fprintf('Horizontal number of pixels is: %d\n', height);
fprintf('Total number of pixels is: %d\n', totalSize);