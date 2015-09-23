clear all;
%close all;
clc
myImage = imread('OlviaWilde.jpg');
convertedImage = uint8(myImage);

redImage = convertedImage(:,:,1);
greenImage = convertedImage(:,:,2);
blueImage = convertedImage(:,:,3);

finalImage(:,:,1) = redImage;
finalImage(:,:,2) = greenImage;
finalImage(:,:,3) = blueImage;

imshow(finalImage)