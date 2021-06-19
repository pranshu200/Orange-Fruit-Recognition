%{
Orange Fruit Recognition using Image Segmentation
Implemented using EDGE Detection and Color Based Segmentation.
%}
clc % Clear command window.
clear all  % Delete all variables.
close all  % Close all figure windows except those created by imtool.
warning off %To turn off the warning.

%Step 1: Reading the Image
I = imread(['brinjal.jpg']);
subplot(5,2,1);
imshow(I);
title('Original Image');

%Step 1.1: Kmeans to get fully segmented Image.
redChannel=I(:, :, 1);
greenChannel=I(:, :, 2);
blueChannel=I(:, :, 3);
data=double([redChannel(:), greenChannel(:), blueChannel(:)]);
numberOfClasses=5;
[m, n]=kmeans(data,numberOfClasses);
m=reshape(m,size(I,1),size(I,2));
n=n/255;
clusteredImage=label2rgb(m,n);

%Step2: Colour Based Segmentation
%To convert the image to gray scale image.
m= rgb2gray(clusteredImage);
subplot(5,2,2);
imshow(m);
title('Gray Scale Image')
imwrite(m, 'GrayScale.jpg');

%To find the orange colored objects.
orange=I(:,:,1);
subplot(5,2,3);
imshow(orange);
title('Orange Fruit Detection');
imwrite(orange, 'orangePartDetection.jpg');

%To get the segmented image for Orange coloured Objects.
l=imsubtract(orange,m);
J=im2bw(l,0.25);
subplot(5,2,4);
imshow(J);
title('Orange Segmented Image');
imwrite(J, 'orange_part_segmented.jpg');

%Edge Based Segmentation
%Step 3: Detecting the Entire Cell
%temp1 = edge(J,'sobel');
%temp1 = edge(J,'canny');
temp1 = edge(J,'approxcanny');
subplot(5,2,5);
imshow(temp1);
title('Binary Gradient Mask');
imwrite(temp1, 'BinaryGradientMask.jpg');

%Step 4: Dilating the Image
dialated1 = strel('line', 3, 90);
dialated2= strel('line', 3, 0);
temp2 = imdilate(temp1, [dialated1 dialated2]);
subplot(5,2,6);
imshow(temp2);
title('Dilated Gradient Mask');
imwrite(temp2, 'DialatedGradientMask.jpg');

%Step 5: Filling Interior Gaps
fill1 = imfill(temp2, 'holes');
subplot(5,2,7);
imshow(fill1);
title('Binary Image With Filled Holes');
imwrite(fill1, 'FilledHoles.jpg');

%Step 6: Removing Connected Objects on the Border
border1 = imclearborder(fill1, 4);
subplot(5,2,8);
imshow(border1);
title('Cleared Border Image');
imwrite(border1, 'clearedBorder.jpg');

%Step 7: Smoothing the Object
seD = strel('diamond',1);
final1 = imerode(border1,seD);
final1 = imerode(final1,seD);
subplot(5,2,9);
imshow(final1);
title('Segmented Image');
imwrite(final1, 'finalGraySegmentation.jpg');

%Step 8: Original outlined Image
outline = bwperim(final1);
Segmentedout = I;
Segmentedout(outline) = 0;
subplot(5,2,10);
imshow(Segmentedout);
imwrite(Segmentedout, 'output.jpg');
title('Outlined Original Image');
imwrite(Segmentedout, 'Output.jpg');

%Display Segmented Image from Kmeans
figure, imshow(clusteredImage);
title('Segemnted Image');
%Display Orange Fruit Detected output
imwrite(J,'SantraOutput.jpg');
figure, imshow(J);
title('Orange Fruit Detected');
%Display Final output
figure, imshow(Segmentedout);
title('FINAL BORDERED IMAGE');