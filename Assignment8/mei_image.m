function result = mei_image(filename, start_frame, end_frame)

    frames = read_video_frames(filename);
    MEI = 0;
    for i  = (start_frame+1) : (end_frame-1) 
        diff1 = abs(rgb2gray(frames(:,:,:, i-1)) - rgb2gray(frames(:,:,:, i )));
        diff2 = abs(rgb2gray(frames(:,:,:, i+1 )) - rgb2gray(frames(:,:,:, i )));
        frame_diff =  min(diff1, diff2);
        MEI = MEI + frame_diff;
    end

    result = MEI;
    imshow(MEI, [])

end



