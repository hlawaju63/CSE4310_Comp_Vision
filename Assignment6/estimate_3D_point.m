function result = estimate_3D_point(c1, c2, u1, v1, u2, v2)

    format long g
    
    %Calculating points for camera matrix 1 -->c1
    %finding point x1,y1,z1 ,using u1,v1, and x = 0
    %setting up the matrices

    A = [   ( c1(1,2) - c1(3,2)*u1 ) ( c1(1,3) - c1(3,3)*u1 );
            ( c1(2,2) - c1(3,2)*v1 ) ( c1(2,3) - c1(3,3)*v1 );
        ];

    %considering x = 1
    x = 1;
    B = [   c1(3,1)*x*u1 + u1 - c1(1,1)*x - c1(1,4);
            c1(3,1)*x*v1 + v1 - c1(2,1)*x - c1(2,4);
        ];

    W = A \ B;

    % So one Point! on img with c1 = (x1,y1,z1) -- > point 1
    P1 = [x ; W]; % Point 1 (x1, y1, z1)


    % For another point x = 2
    x = 3;
    B = [   c1(3,1)*x*u1 + u1 - c1(1,1)*x - c1(1,4);
            c1(3,1)*x*v1 + v1 - c1(2,1)*x - c1(2,4);
        ];

    % W = [ y1 z1]'
    W = A \ B;

    P2 = [x ; W]; % Point 1 (x2, y2, z2)

    %defining line vector parallel to these points 1--> u_1 = P2 - P1 , vector parralel to line
    u_1 = P2 - P1;

    %%

    % -----------------------------------
    % -----------------------------------
    % -----------------------------------
    % -----------------------------------

    %%

    % Now calculating points  for Camera Matirx 2, c2
    %finding point x1,y1,z1 ,using u2,v2, and x = 0
    %setting up the matrices

    A = [   ( c2(1,2) - c2(3,2)*u2 ) ( c2(1,3) - c2(3,3)*u2 );
            ( c2(2,2) - c2(3,2)*v2 ) ( c2(2,3) - c2(3,3)*v2 );
        ];

    %considering x = 1
    x = 1;
    B = [   c2(3,1)*x*u2 + u2 - c2(1,1)*x - c2(1,4);
            c2(3,1)*x*v2 + v2 - c2(2,1)*x - c2(2,4);
        ];

    W = A \ B;

    % So one Point! on img with c2 = (x1,y1,z1) -- > point 1
    P3 = [x ; W]; % Point 1 (x1, y1, z1)


    % For another point x = 2
    x = 3;
    B = [   c2(3,1)*x*u2 + u2 - c2(1,1)*x - c2(1,4);
            c2(3,1)*x*v2 + v2 - c2(2,1)*x - c2(2,4);
        ];

    % W = [ y1 z1]'
    W = A \ B;

    P4 = [x ; W]; % Point 4 (x4, y4, z4)

    %defining line vector parallel to these points 1--> u_1 = P2 - P1 , vector parralel to line
    u_2 = P4 - P3;


    %%

    % -----------------------------------
    % -----------------------------------
    % -----------------------------------
    % -----------------------------------

    %%



    %Solving eqn 
    A = [ dot(u_1', u_1) dot(-1*u_2' , u_1);
          dot(u_1', u_2) dot(-1*u_2' , u_2);
        ]

    B = [ dot(P3', u_1) - dot(P1',u_1);
          dot(P3', u_2) - dot(P1',u_2);
        ]


    W = A \ B;

    a1 = W(1,1);
    a2 = W(2,1);

    %Calculating MidPoint

    result = ( (P1 + a1*u_1) + (P3 + a2*u_2) ) / 2;

end
