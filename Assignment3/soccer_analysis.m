
function soccer_analysis(my_image)

addpath data
my_img  = imread(my_image);
figure(1);imshow(my_img);

% making a kernel for blurring the image
% to get rid of  players in binary img
kernel = fspecial('gaussian',9 ,2.3);

%blurring the img with kernel
blurred_img = imfilter(my_img, kernel);
%figure(2);imshow(blurred_img);

%seperating each rgb color component from
%blurred img
color_img = double(blurred_img);
r = color_img(:,:,1);
g = color_img(:,:,2);
b = color_img(:,:,3);

%defining the green part as green if its intensity
%is greater than 10 that of r and b color
%and dilating image to make uniform white pores
%i.e rid of dotts of whites and black
%green is whiite in binaryy (i.e 1, rest is 0)
green = ((g-r > 10 & (g-b > 10 )));
imdilate(green, ones(7,7));
imclose(green, ones(7,7));
%figure(3); imshow(green);

%negating green so that now red part becomes binary 1
%and it starts at pixel (1,1)
neg_green = ~green;
%figure(4);imshow(neg_green);

%getting all white areas using connected component
[labels, numbers] = bwlabel(neg_green, 4);
%now only taking the labels that are not connected 
%to pixel (1,1), in this case only the players
%present in the field in rgb, or the white components
%in the green field from binary.
%This gives all the areas except white areas
%connected to piexl (1,1)
req_img = (labels ~=1);
%figure(5); imshow(req_img);


%----------------------------------
%----------------------------------
%----------------------------------
%----------------------------------
%-----------Part b-----------------



red = ((r-g > 3 & (r-b > 3 )));
imdilate(red, ones(7,7));
%figure(6); imshow(red );

%taking white connected coponent from neg_green
%starting from pixel(1,1). This gives the red stadium part
%only, and negating this gives green part of stadium

req_img_1 = (labels == 1);
%figure(7); imshow(req_img_1);
req_img_1 = ~req_img_1;

%fig 6,7,8 along with neg_ green gives understanding
%of how and logical operation in fig 9 works


%figure(8); imshow(req_img_1);
%FIG 9 IS USING LOGICAL AND FOR 7 N 8
figure(9); imshow(red & req_img_1);

%----------------------------------
%----------------------------------
%----------------------------------
%----------------------------------
%-----------Part c-----------------

%same as part b but with change in bluring intensity
kernel_2 = fspecial('gaussian',5 ,1.3);
blurred_img_2 = imfilter(my_img, kernel_2);
color_img = double(blurred_img_2);
r = color_img(:,:,1);
g = color_img(:,:,2);
b = color_img(:,:,3);
blue = ((b-g > 10 & (b-r > 10 )));
imdilate(blue, ones(7,7));
%figure(10); imshow(blue );
figure(11); imshow(blue & req_img_1);



end

