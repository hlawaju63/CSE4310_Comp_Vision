
function ocean_segmentation(my_image)



addpath data

my_img  = imread(my_image);
figure(1);imshow(my_img);


%blurring is necessary to remove holes
kernel = fspecial('gaussian',9 ,3);
blurred_img = imfilter(my_img, kernel);

%This thresholding helps us to get the lower part (tree of the img)

binary_img = blurred_img > 180 ;
figure(2);imshow(binary_img);


[labels, numbers] = bwlabel(binary_img, 4);
img  = (labels == 1);
result_img1 = img;
result_img1 = ~result_img1;
%figure(3);imshow(result_img1);

result = gradient_norms(my_img);
%figure(8);imshow(result);

result = result > 2.9;
%figure(9);imshow(result);
kernel = fspecial('gaussian',10 ,6);
blurred_img = imfilter(result, kernel);
blurred_img = ~blurred_img;
%figure(10);imshow(blurred_img);

img = blurred_img & result_img1;

figure(11);imshow(img);


end
