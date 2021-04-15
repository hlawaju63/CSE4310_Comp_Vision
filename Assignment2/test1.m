
clc
clear all

%[top, bottom, left, right] = find_bounding_box('walkstraight/frame0052.tif');

img_name = 'walkstraight/frame0052.tif';
result = person_present(img_name)

%[row_speed, col_speed] = person_speed('walkstraight/frame0052.tif', 'walkstraight/frame0062.tif')
