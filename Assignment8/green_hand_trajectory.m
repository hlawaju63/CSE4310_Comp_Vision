function trajectory = green_hand_trajectory(filename, start_frame, end_frame)

    trajectory = zeros((end_frame - start_frame +1 ), 2);
    % using i, to create a matrix from i == 1 to i = N(end-start + 1)
    for frame = start_frame:end_frame
        video_frames = read_video_frames(filename);
        hand_size = [40 30];
        [scores, result, center] = green_hand(video_frames, frame, hand_size);
        %figure(2);imshow(scores, []);
        
        
        row = frame - start_frame + 1;
        trajectory(row, 1) = center(1,1);
        trajectory(row, 2) = center(1,2);
        
    end
    
end