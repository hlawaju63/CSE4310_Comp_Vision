function [eigenvectors, eigenvalues] = mnist_pca(data_file, class_label, d)

    [count,mnist_digits, mnist_label] =  load_mnist(data_file);
    
    col = 1;
    for i = 1 : count
        var = mnist_digits(:,:,i);
        var = double(var);
        %imshow(var,[]);
        label = mnist_label(i); 
        %disp(label);

        if(label == class_label)

            %brightness n contrast normalization

            img = (var - mean(var(:)));
            img =  img / std(var(:));
               
            imshow(img, []);

            %each column is a vectorize image
            vectors(:, col) = img(:);
            col = col+1;
        end

    end


    [average, eigenvectors, eigenvalues] = compute_pca(vectors);

    %eigenvectors , n eigenvalues with d colum
    eigenvectors = eigenvectors(:, 1:d);
    eigenvalues = eigenvalues(1:d, :);

end



