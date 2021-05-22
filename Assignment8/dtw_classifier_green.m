function class_label = dtw_classifier_green(filename, start_frame, end_frame)
        
        input_trajectory = green_hand_trajectory(filename, start_frame, end_frame);

        %creating an array of frame num for starting and ending of each frame
        %from the video digits_model_quan_ex3.avi for training
        start_frame_num = [22;143;220;350;495;608;763;906;1035;1206];
        end_fram_num = [91;165;300;445;544;701;850;961;1150;1277];


        %filename for training example
        filename_1 = 'digits_model_quan_ex3.avi';

        values = zeros(1,10);
        for x = 1:10 

            %initialization
            %calculating for 0
            start_frame = start_frame_num(x,1); 
            end_frame = end_fram_num(x,1);
            trajectory = green_hand_trajectory(filename_1, start_frame, end_frame);

            [m, ~] = size(input_trajectory);
            [n, ~] = size(trajectory);

            scores = zeros(m,n);

            scores(1,1) = norm(input_trajectory(1, :) - trajectory(1, :));

            for i = 2 : m
                scores(i, 1) = scores(i-1, 1) + norm(input_trajectory(i, :) - trajectory(1, :));
            end
            for j = 2 : n
                scores(1, j) = scores(1, j-1) + norm(input_trajectory(1, :) - trajectory(j, :));
            end

            %Main loop

            for i = 2 : m
                for j = 2 : n
                    min_select = min(scores(i-1,j), scores(i, j-1));
                    min_score = min(min_select, scores(i-1, j-1));
                    scores(i, j) = norm(input_trajectory(i, :) - trajectory(j, :)) + min_score;
                end
            end


            values(x) = scores(i,j);


        end

         class_label = find( values == min(values)) - 1;

    end
    