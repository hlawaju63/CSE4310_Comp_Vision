Hemanta Lawaju
1001716565

Task 2 >

For task 2, the person wont be there if the image is satic(same) in both frames
i.e, diff1, diff2 and the motion would result black image ideally, but since 
there might be noise causing small connected components with some area, we are supposing area formed by
such connected component to be less than 1000. So, we are not considering connected 
components with area less than 1000 to be person


Task 3 >

For this task, we considered the frame rate to be 30 frame/sec. Then we calculated the
centroid (row and col) in both frames(frame0052.tif, frame0062.tif). Then we calulated how far in pixels, 
the centroid were from each other ,both (row and col). Then we divided by frame rate. Using the formula 
% pixel/frame * frame/second * meter/pixel. 