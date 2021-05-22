
close all
clc
clear all

addpath images


correspondences1 = load('img1_wc1.txt');
camera_matrix1 = perspective_calibration(correspondences1);

correspondences2 = load('img1_wc2.txt');
camera_matrix2 = perspective_calibration(correspondences2);


correspondences = load('img1_wc1.txt');
result = pinhole_location(correspondences)


%{
u1 = 68; v1 = 87; u2 = 84; v2 = 46;

result = estimate_3D_point(camera_matrix1, camera_matrix2, u1, v1, u2, v2)
%}



%{
boxes = [2, 10, 3, 9; 3,11,4,10]
current_gt = [4, 16, 5, 15; 5, 17, 6, 15]
iou_thr = 0.8;
[tp, fp, fn] = check_boxes(boxes, current_gt, iou_thr)
%}

%{
%test 1
ground_truth_file = 'ground_truth.txt';
%template = imread('average_face.png');
template = imread('average_face_cropped.png');

scales = make_scales_array(1, 5, 1.1);
detection_thr = 0.5;
iou_thr = 0.5;

[tp, fp, fn] = detection_accuracy(ground_truth_file, template, scales, ...
                                           detection_thr, iou_thr)

%}