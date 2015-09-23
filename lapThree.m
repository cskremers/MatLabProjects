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

%% Assignemnt 3: Auto Contrast
% 
% imgMin = 15;
% imgMax = 235;
% finalImage = uint8(myImage);
% 
% for k = 1 : 3;
%     if k == 1;
%         currentImage = redImage;
%         
% for i=1 : size(currentImage, 1);
%     for j=1 : size(currentImage, 2);
%         pixel = currentImage(i,j);
%         pixel = (pixel - imgMin) * (255/(imgMax-imgMin));
%         if pixel < 0
%             newPixel = 0;
%         elseif pixel > 255
%             newPixel = 255;
%         else
%             newPixel = pixel;
%         end
%         contrastedImage(i,j) = newPixel;
%     end
% end
% contrastedImage = finalImage(:,:,1);
%     end
%     if k == 2;
%         currentImage = greenImage;     
%         
% for i=1 : size(currentImage, 1);
%     for j=1 : size(currentImage, 2);
%         pixel = currentImage(i,j);
%         pixel = (pixel - imgMin) * (255/(imgMax-imgMin));
%         if pixel < 0
%             newPixel = 0;
%         elseif pixel > 255
%             newPixel = 255;
%         else
%             newPixel = pixel;
%         end
%         contrastedImage(i,j) = newPixel;
%     end
% end
% contrastedImage = finalImage(:,:,2);
%     end
%     if k == 3;
%         currentImage = blueImage;
%         
% for i=1 : size(currentImage, 1);
%     for j=1 : size(currentImage, 2);
%         pixel = currentImage(i,j);
%         pixel = (pixel - imgMin) * (255/(imgMax-imgMin));
%         if pixel < 0
%             newPixel = 0;
%         elseif pixel > 255
%             newPixel = 255;
%         else
%             newPixel = pixel;
%         end
%         contrastedImage(i,j) = newPixel;
%     end
% end
% contrastedImage = finalImage(:,:,3);
%     end
% 
% end
% figure, imshow(convertedImage)
% figure, imshow(contrastedImage)
% figure, imshow(finalImage)
% 
% imcontrast(redImage);

%% Assignment 3: 3x3 Filter

figure, imshow(redImage)
[m,n]=size(redImage);

%Enter the size of the filter below!
    %Works for any size filter not just 3x3 and 5x5
filterSize = 3;
z=ones(filterSize);
[p,q]=size(z);

w=1:p;
x=round(median(w));
anz=zeros(m+2*(x-1),n+2*(x-1));

for i=x:(m+(x-1))
    for j=x:(n+(x-1))
        anz(i,j)=redImage(i-(x-1),j-(x-1));
    end
end

sum=0;
x=0;
y=0;
for i=1:m
    for j=1:n
        for k=1:p
            for l=1:q 
                sum= sum+anz(i+x,j+y)*z(k,l);
                y=y+1;
            end
            y=0;
            x=x+1;
        end
        x=0;
        ans(i,j)=(1/(p*q))*(sum);
        sum=0;
    end
end
figure, imshow(uint8(ans))