


function [accuracy, confusion_matrix] = nnc_euclidean_stats()
   
    addpath digits_test

    confusion_matrix = zeros(10,10)


    %calculating accuracy

    for i  = 0 : 9
        for j = 1 : 10

            test_img = strcat('label', num2str(i, '%d') , '_' , 'test' , num2str(j, '%d'), '.png');
            img = imread(test_img);

            class_label = nnc_euclidean(img);
            
            %handling situation i or classlabel = 0, by storing it in 10th
            %rows and col instead

                temp1 = i;
                temp2 = class_label;

                if(i == 0)
                    temp1 = 10;
                end

                if(class_label == 0)
                    temp2 = 10;
                end           
                    confusion_matrix(temp1, temp2) = confusion_matrix(temp1, temp2) + 1;       
            

        end
    end

    %calculating in percentage(value between 0 - 1)
    confusion_matrix = confusion_matrix./10;
    
    
    accuracy = 0; count = 0;
    for i = 1 : 10
        
        accuracy = confusion_matrix(i,i)  + accuracy ;
        count = count+1;
    end
    
    accuracy = accuracy/count;
    

end


