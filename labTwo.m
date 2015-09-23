% % Inilizations
% ============= Read Image and convert =====================
clear all;
close all;
clc
myImage = imread('OlviaWilde.jpg');
convertedImage = uint8(myImage);

% ============= Display Subplot with histogram =============
%%methods('displaySubplotHistogram')
redImage = convertedImage(:,:,1);
greenImage = convertedImage(:,:,2);
blueImage = convertedImage(:,:,3);
%imshow(convertedImage);




%% Assignment 2: Matlab Adjustments
% %================= Brighten Image ==========================
% I = .4;
% %== ([low_in] < [high_in]) : [contrast], [brightness]
% brightImage = imadjust(convertedImage, [0 1], [I 1]);
% % 
% % % =============== Invert Image =============================
% %invesrion of rgb: 
% %Each pixel value is subtracted from the  maxium pixel value
% invertedImage = imcomplement(convertedImage);
% % 
% % % =============== Convert to Gray Scale ====================
% grayImage = rgb2gray(convertedImage);
% % 
% % % =============== Threshold image ==========================
% thresholdedImage = im2bw(convertedImage, 0.5);
% % 
% % % ============= Display Subplot with histogram =============
% figure('name','Matlab built-in functions')
% subplot(2,4,1), imshow(myImage)
% subplot(2,4,2), imhist(redImage)
% subplot(2,4,3), imhist(greenImage)
% subplot(2,4,4), imhist(blueImage)
% subplot(2,4,5), imshow(brightImage)
% subplot(2,4,6), imshow(invertedImage)
% subplot(2,4,7), imshow(grayImage)
% subplot(2,4,8), imshow(thresholdedImage)

%% Assignment 2: Manual Adjustments
% %=======================Manual Editing======================
% %================= Brighten Image ==========================
% I = 2;
% for i=1 : size(convertedImage, 1);
%     for j=1 : size(convertedImage, 2);
%         pixel = convertedImage(i,j);
%         pixel = pixel*I;
%         if pixel < 0
%             newPixel = 0;
%         elseif pixel > 255
%             newPixel = 255;
%         else
%             newPixel = pixel;
%         end
%         brightImageM(i,j) = newPixel;
%     end
% end
% 
% % =============== Invert Image =============================
% I = 255;
% for i=1 : size(convertedImage, 1);
%     for j=1 : size(convertedImage, 2);
%         pixel = convertedImage(i,j);
%         pixel = I-pixel;
%         if pixel < 0
%             newPixel = 0;
%         elseif pixel > 255
%             newPixel = 255;
%         else
%             newPixel = pixel;
%         end
%         invertedImageM(i,j) = newPixel;
%     end
% end
% 
% % =============== Convert to Gray Scale ====================
% for i=1 : size(convertedImage, 1);
%     for j=1 : size(convertedImage, 2);
%         grayImageM(i,j) = (.299*convertedImage(i,j,1))+(.587*convertedImage(i,j,2))+(.114*convertedImage(i,j,3));
%         
%     end
% end
% % =============== Threshold image ==========================
% I = 175;
% for i=1 : size(convertedImage, 1);
%     for j=1 : size(convertedImage, 2);
%         pixel = convertedImage(i,j);
%         if pixel < I
%             newPixel = 0;
%         elseif pixel > I
%             newPixel = 255;
%         end
%         thresholdedImageM(i,j) = newPixel;
%     end
% end
% 
% % ============= Display Subplot with histogram =============
% figure('name','Cody made functions')
% subplot(2,4,1), imshow(myImage)
% subplot(2,4,2), imhist(redImage)
% subplot(2,4,3), imhist(greenImage)
% subplot(2,4,4), imhist(blueImage)
% subplot(2,4,5), imshow(brightImageM)
% subplot(2,4,6), imshow(invertedImageM)
% subplot(2,4,7), imshow(grayImageM)
% subplot(2,4,8), imshow(thresholdedImageM)





%% Assignemnt 3: Auto Contrast

imgMin = 15;
imgMax = 235;
finalImage = uint8(myImage);

for k = 1 : 3;
    if k == 1;
        currentImage = redImage;
        
for i=1 : size(currentImage, 1);
    for j=1 : size(currentImage, 2);
        pixel = currentImage(i,j);
        pixel = (pixel - imgMin) * (255/(imgMax-imgMin));
        if pixel < 0
            newPixel = 0;
        elseif pixel > 255
            newPixel = 255;
        else
            newPixel = pixel;
        end
        contrastedImage(i,j) = newPixel;
    end
end
contrastedImage = finalImage(:,:,1);
    end
    if k == 2;
        currentImage = greenImage;     
        
for i=1 : size(currentImage, 1);
    for j=1 : size(currentImage, 2);
        pixel = currentImage(i,j);
        pixel = (pixel - imgMin) * (255/(imgMax-imgMin));
        if pixel < 0
            newPixel = 0;
        elseif pixel > 255
            newPixel = 255;
        else
            newPixel = pixel;
        end
        contrastedImage(i,j) = newPixel;
    end
end
contrastedImage = finalImage(:,:,2);
    end
    if k == 3;
        currentImage = blueImage;
        
for i=1 : size(currentImage, 1);
    for j=1 : size(currentImage, 2);
        pixel = currentImage(i,j);
        pixel = (pixel - imgMin) * (255/(imgMax-imgMin));
        if pixel < 0
            newPixel = 0;
        elseif pixel > 255
            newPixel = 255;
        else
            newPixel = pixel;
        end
        contrastedImage(i,j) = newPixel;
    end
end
contrastedImage = finalImage(:,:,3);
    end

end
figure, imshow(convertedImage)
figure, imshow(contrastedImage)
finalImage = 
figure, imshow(finalImage)

% imcontrast(redImage);
% figure, imshow(redImage);

%% Assignment 3: 3x3 Filter

% figure, imshow(redImage)
% [m,n]=size(redImage);
% filterSize = 3;
% z=ones(filterSize);
% [p,q]=size(z);
% 
% w=1:p;
% x=round(median(w));
% anz=zeros(m+2*(x-1),n+2*(x-1));
% 
% for i=x:(m+(x-1))
%     for j=x:(n+(x-1))
%         anz(i,j)=redImage(i-(x-1),j-(x-1));
%     end
% end
% 
% sum=0;
% x=0;
% y=0;
% for i=1:m
%     for j=1:n
%         for k=1:p
%             for l=1:q 
%                 sum= sum+anz(i+x,j+y)*z(k,l);
%                 y=y+1;
%             end
%             y=0;
%             x=x+1;
%         end
%         x=0;
%         ans(i,j)=(1/(p*q))*(sum);
%         sum=0;
%     end
% end
% figure, imshow(uint8(ans))