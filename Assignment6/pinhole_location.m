function result = pinhole_location(correspondences)

    camera_matrix = perspective_calibration(correspondences);


    u1 =  correspondences(1,4);
    v1 =  correspondences(1,5);
    u2 =  correspondences(2,4);
    v2 =  correspondences(2,5);


    result = estimate_3D_point(camera_matrix, camera_matrix, u1, v1, u2, v1);


end