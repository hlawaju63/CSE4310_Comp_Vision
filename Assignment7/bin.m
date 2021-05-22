function result = bin(theta)

            %we divide into 9 bins for each 
            if(theta < 20)
                x = 1;
            elseif(theta < 40)
                x = 2;
            elseif(theta < 60)
                x = 3;
            elseif(theta < 80)
                x = 4;
            elseif(theta < 100)
                x = 5;
            elseif(theta < 120)
                x = 6; 
            elseif(theta < 140)
                x = 7;
            elseif(theta < 160)
                x = 8;               
            elseif(theta < 180)
                x = 9;
            end
            
            result = x;
end