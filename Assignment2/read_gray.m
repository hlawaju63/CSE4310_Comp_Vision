
function gray_double_img = read_gray(frame_filename)

%reading the integer val of images
img = imread(frame_filename)
%converting to double value for mathmatical operations
%and converting in range of 0-1
double_img = double(img)

%converting to grayscale double and returning it
gray_double_img = (double_img(:,:,1) + double_img(:,:,2) + double_img(:,:,3))/3


end