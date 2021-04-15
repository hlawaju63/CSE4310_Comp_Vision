


function result = person_present(img_name)


%adding a relative path
% this might needs to be changed
%addpath('..assignment2/walkstraight');
%addpath('E:\cse 4310 (computer vision)\assignment\assignment2\walkstraight');
%cd 'E:\cse 4310 (computer vision)\assignment\assignment2\';


% frame 52 is what we are working on as base

%img_name = 'walkstraight/frame0052.tif';

%reading the images in gray
curr_frame = read_gray(img_name);
%dislaying the gray image of type double
%figure(1);
%imshow(curr_frame, []);



%using parse_frame_name and make_frame_name functions to get a filename
% of image with required frame number
[sequence_name, frame] = parse_frame_name(img_name);
% geeting the required frame num image
frame_filename1 = make_frame_name(sequence_name, frame-5);
frame_filename2 = make_frame_name(sequence_name, frame+5);



%reading the gray_frame 5 frame ahead and behind
prev_frame = read_gray(frame_filename1);
next_frame = read_gray(frame_filename2);



%displaying gray_images
%figure(2); imshow(prev_frame,[]);
%figure(3); imshow(next_frame,[]);



diff1 = abs(prev_frame - curr_frame);
%figure(4); 
%imshow(diff1, []);
diff2 = abs(curr_frame - next_frame);
%figure(5); 
%imshow(diff2, []);



motion = min(diff1, diff2);
%figure(6);
%imshow(motion, []);



%saving results to image files, by making sure the
% value is in between 0-255 and casting into 8 bit uint8
%imwrite(uint8(diff1), '..\diff1.jpg');
%imwrite(uint8(diff2), '..\diff2.jpg');
%imwrite(uint8(motion),'..\\motion.jpg');




%computing the position
%thresholding first
threshold = 10;
thresholded = (motion > threshold); %choosing val of img greater than thres
%figure(7); imshow(thresholded, []);



%conncted component analysis
[labels, number] = bwlabel(thresholded, 4);
%figure(8); imshow(labels, []);

colored = label2rgb(labels, @spring, 'c', 'shuffle');
%figure(9); imshow(colored);

% finding the largest connected component
% creating an array of counters, one for each component
counters = zeros(1, number);
    for i = 1:number
        %first, find all pixels having that label == i.
        %searching for pixels with label with i = 1, 2 ...n of image
        component_image = (labels == i);
        % second, sum up all white pixels in component_image
        counters(i) = sum(component_image(:));
        
    end
    
    %taking the label with largest area
    [area, id] = max(counters)
    person = (labels == id);
%   figure(10);
%   imshow(person, []);
    
    if(area < 1000)
        result = 0;
    else
        result = 1;
    end
end

        
