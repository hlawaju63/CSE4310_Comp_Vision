
function [tp, fp, fn] = check_boxes(boxes, current_gt, iou_thr)

    tp = 0;
    fp = 0;
    fn = 0;
    check_fn = 0; % 1 if any of detection result gives 
    
    [bounding_row, ~] = size(boxes);
    [ground_truth_row, ~] = size(current_gt);
    
    %going for each detection box
    for i = 1 : bounding_row
        %going for each ground truth box
        for j = 1 : ground_truth_row
            
            
            
            T_AintersB = max(boxes(i,1), current_gt(j, 1));
            B_AintersB = min(boxes(i,2), current_gt(j, 2));
            L_AintersB = max(boxes(i,3), current_gt(j, 3));
            R_AintersB = min(boxes(i,4), current_gt(j, 4));

            Height_A = boxes(i,2) - boxes(i,1) + 1;
            Width_A = boxes(i,4) - boxes(i,3) + 1;
            Area_A = Height_A * Width_A;
            
            Height_B = current_gt(j,2) - current_gt(j,1) + 1;
            Width_B = current_gt(j,4) - current_gt(j,3) + 1;
            Area_B =  Height_B * Width_B;
            
            Height_AintersB = B_AintersB - T_AintersB + 1;
            Width_AintersB = R_AintersB - L_AintersB + 1;
            
            % handling cases if there is no interesection and height
            % or width == 0
            if (Height_AintersB < 0 ||  Width_AintersB < 0)
                Area_AintersB = 0;
            else
                Area_AintersB = Height_AintersB * Width_AintersB ;
            end

            Area_AunionB = Area_A + Area_B - Area_AintersB;
            
            IOU  = Area_AintersB/Area_AunionB;
            
            %if at least on IOU score >= iou_thr
            if (IOU > iou_thr)
                tp = tp + 1; 
                check_fn = 1;
            else
                fp = fp + 1; %if not true positive
            end
            
      
        end
               
    end
    
    % Non of the detection box was has IOU over iou_thr
    if(check_fn ~= 1)
        fn = 1;
    end
end
