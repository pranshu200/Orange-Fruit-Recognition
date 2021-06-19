clc % Clear command window.
clear all  % Delete all variables.
close all  % Close all figure windows except those created by imtool.
warning off %To turn off the warning.

%Step 1: Reading the Image
I = imread(['brinjal.jpg']);
subplot(1,2,1);
imshow(I);
title('Original Image');

%Step 1.1: Kmeans to get fully segmented Image.
redChannel=I(:, :, 1);
greenChannel=I(:, :, 2);
blueChannel=I(:, :, 3);
data=double([redChannel(:), greenChannel(:), blueChannel(:)]);
for i=1:10
numberOfClasses=i;
[m n]=kmeans(data,numberOfClasses);
m=reshape(m,size(I,1),size(I,2));
n=n/255;
clusteredImage=label2rgb(m,n);
subplot(1,2,2);
imshow(clusteredImage);
title(i);
pause;
end