function startProgram
clear all
matlabAdjustments();
readImageAndConvert()
%%myAdjustments(uint8Image);
end

function readImageAndConvert
myImage = imread('JetSkiAir.jpg');
uint8Image = uint8(myImage);
end

function matlabAdjustments

end

function myAdjustments

end