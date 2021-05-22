
clc
close all
clear all

addpath gesture_videos


%test 1
filename = 'digits_model_joni_ex3.avi';

start_frame = 1200;

end_frame = 1277;
%figure(1);imshow(start_frame, []);
%figure(2);imshow(start_frame, []);
result = mei_image(filename, start_frame, end_frame);
imshow(result,[])


%{
%test 2
filename = 'digits_model_joni_ex3.avi';
frames = read_video_frames(filename);
start_frame = 183;
end_frame = 212;
class_label = mei_classifier(filename, start_frame, end_frame)
%}

%{
%test 3


tic;
filename = 'digits_model_joni_ex3.avi';
start_frame = 1200;
end_frame = 1277;
trajectory = green_hand_trajectory(filename, start_frame, end_frame)
[m, ~] = size(trajectory)

% when plotting, the y axis should be flipped.
figure(3);plot(trajectory(:,1), -trajectory(:,2));
toc;
%}


%test 4
filename = 'digits_model_joni_ex3.avi';
start_frame = 1200;
end_frame = 1277;
class_label = dtw_classifier_green(filename, start_frame, end_frame)


