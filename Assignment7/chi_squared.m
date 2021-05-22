function result = chi_squared(sc1, sc2)

    %vectorizing image

    im1 = sc1(:);
    im2 = sc2(:);

    % Calculate the Euclidean distance
    diff = abs(im1 - im2);
    square = diff.^2;
    sum_square = sum(square);
    distance = sqrt(sum_square);
    
    result = distance;

end