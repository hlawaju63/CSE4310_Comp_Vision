
function result = remove_holes(my_image)

addpath data;


%reading the image
image = imread(my_image);


%converting into double to perform operations
d_image = double(image);
figure(1);imshow(d_image /255);

%negating the value of matrices i.e 0 to 1, 1 to 0
C = ~(d_image);
figure(2);imshow(C);

[labels, numbers] = bwlabel(C, 4);



img = labels == 1;
img = ~img;
figure(3);imshow(img);
result = img;

end
