




function distance = euclidean_distance(image1, image2)


    img1 = double(image1);
    img2 = double(image2);

    %vectorizing image

    im1 = img1(:);
    im2 = img2(:);

    % Calculate the Euclidean distance
    diff = abs(im1 - im2);
    numerator_square = diff.^2;
    denominator = abs(im1 + im2);
    val = numerator_square ./ denominator;
    sum_square = sum(val);
    distance = 1/2 * (sum_square);



end



