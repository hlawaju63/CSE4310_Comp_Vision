
function [row_speed, col_speed] = person_speed(img_name1, img_name2)

[top1, bottom1, left1, right1] = find_bounding_box(img_name1)

[top2, bottom2, left2, right2] = find_bounding_box(img_name2)

scale = 1/320; % meter/pixel

%calculating center of both row and column
center_row1 = (top1+bottom1)/2
center_col1 = (left1+right1)/2

center_row2 = (top2+bottom2)/2
center_col2 = (left2+right2)/2

frameRate = 30; % frame/second

[sequence_name1, frame1] = parse_frame_name(img_name1)
[sequence_name2, frame2] = parse_frame_name(img_name2)


row_speed = (( center_row1 - center_row2 )/frame1) * frameRate * scale % pixel/frame * frame/second * meter/pixel
col_speed = (( center_col1 - center_col2 )/frame2) * frameRate * scale % pixel/frame * frame/second * meter/pixel

end