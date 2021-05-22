
function camera_matrix = perspective_calibration(correspondences)

   format long g
   [row,~] = size(correspondences);
    
    A = zeros(2*row, 11);
    B = zeros(2*row, 1);
    
    for j = 1 : row
        
        x_j = correspondences(j,1);
        y_j = correspondences(j,2);
        z_j = correspondences(j,3);
        u_j = correspondences(j,4);
        v_j = correspondences(j,5);
        
        A(2*j -1, (1:11) ) = [x_j y_j z_j 1 0 0 0 0 -x_j*u_j -y_j*u_j -z_j*u_j ];
        
        A(2*j, (1:11) ) = [0 0 0 0 x_j y_j z_j 1 -x_j*v_j -y_j*v_j -z_j*v_j];
        
        B(2*j -1, 1) = [u_j] ;
        
        B(2*j, 1) = [v_j] ;
    end
    
    x = A \ B;
    
    camera_matrix = [
                        x(1) x(2) x(3) x(4);
                        x(5) x(6) x(7) x(8);
                        x(9) x(10) x(11) 1;            
                    ]
    
end