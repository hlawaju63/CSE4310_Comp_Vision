function distance = chamfer_distance(image1, image2)

    %converting grayscale to binary
    
    im1 = (image1 ~= 0);
    im2 = (image2 ~= 0);
    
    n1 = sum(im1(:));
    dt2 = bwdist(im2);
    chamfer_im1_to_im2 = sum(sum(im1 .*dt2))/n1;

    
    n2 = sum(im2(:));
    dt1 = bwdist(im1);
    chamfer_im2_to_im1 = sum(sum(im2 .*dt1))/n2;     
    
    distance = chamfer_im1_to_im2 + chamfer_im2_to_im1;
end