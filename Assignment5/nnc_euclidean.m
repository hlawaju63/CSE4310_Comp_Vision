

function class_label = nnc_euclidean(test_image)

  
    
    min = 10000000;

    for i  = 0 : 9
        for j = 1 : 15

            test_name = strcat('label', num2str(i, '%d') , '_' , 'training' , num2str(j, '%d'), '.png');
            img = imread(test_name);clc
            
            distance = euclidean_distance(test_image, img);

            if(distance < min)
                min = distance ;
                class_label = i ;
            end        

        end
    end

end



