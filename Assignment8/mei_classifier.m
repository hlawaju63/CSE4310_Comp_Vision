function class_label = mei_classifier(filename, start_frame, end_frame)

    input_gesture = mei_image(filename, start_frame, end_frame);

    %creating an array of frame num for starting and ending of each frame
    %from the video digits_model_quan_ex3.avi for training
    start_frame_num = [22;143;220;350;495;608;763;906;1035;1206];
    end_fram_num = [91;165;300;445;544;701;850;961;1150;1277];


    %filename for training example
    filename_1 = 'digits_model_quan_ex3.avi';
    %using frames = round(duration * frame_rate) to get the frame
    frames = read_video_frames(filename_1);

    eucli_dist = inf;

    for i = 1:10 

        %calculating for 0
        start_frame = frames(:,:,:,start_frame_num(i,1));  
        end_frame = frames(:,:,:,end_fram_num(i,1));
        img = mei_image(filename_1, start_frame, end_frame);
        figure(2);imshow(img,[]);
        current_dist = euclidean_distance(input_gesture, img);

        %taking the min eucli_dist among all
        if(eucli_dist > current_dist)
            eucli_dist = current_dist;
            class_label = i-1;
        end

    end


end







