function result = hog_feature(image, top, left, block_size)

%top left corner
%block_size x block_size;

%starting code
A = double(image);
dx = [-1, 0, 1];
dy = dx';

gradient_y = abs(imfilter(A, dy));
gradient_x = abs(imfilter(A, dx));
    
grad_norms = (gradient_x.^2 + gradient_y.^2).^0.5;

block_spacing = block_size / 2;

X = zeros(4, 9);

%---- pattern --------> top1 left1------top2 left2------
%---- pattern --------> top3 left3------top4 left4------
%top1 left1 is i, j(top, left given)
%first sub-block starting top left
top1 = top;
left1 = left;

%second sub-block at right of first block
top2 = top;
left2 = left + block_spacing;

%third sub-block at right of first block
top3 = top + block_spacing;
left3 = left;

%fourth sub-block at right of first block
top4 = top + block_spacing;
left4 = left + block_spacing;


[x, y] = size(A);

block = 0;
bins = 0;


for i = 1:x
    for j = 1:y
    
            thetas =  atan2(gradient_y(i,j), gradient_x(i,j));  %correct, angles increase clockwise
            thetas = thetas / pi * 180;
            thetas(thetas < 0) = thetas(thetas < 0) + 180;
            thetas(thetas > 180) = 180;
        
        %if pixel lies in first sub block 1
        if(     (i >= top1 && i < (top1 + block_spacing) )  &&  (j >= left1 && j < (left1 + block_spacing) ) )
            block = 1;
            bins = bin(thetas);
            X(block, bins) = X(block, bins) + grad_norms(i,j);
            
        %if pixel lies in first sub block 2
        elseif( (i >= top2 && i < (top2 + block_spacing) )  &&  (j >= left2 && j < (left2 + block_spacing) ) )
            block = 2;      
            bins = bin(thetas);
            X(block, bins) =  X(block, bins)+ grad_norms(i,j);
            
        %if pixel lies in first sub block 3
        elseif( (i >= top3 && i < (top3 + block_spacing) )  &&  (j >= left3 && j < (left3 + block_spacing) ) )
            block = 3;        
            bins = bin(thetas);
            X(block, bins) =  X(block, bins)+ grad_norms(i,j);
            
        %if pixel lies in first sub block 4
        elseif( (i >= top4 && i < (top4 + block_spacing) )  &&  (j >= left1 && j < (left4 + block_spacing) ) )
            block = 4;
            bins = bin(thetas);
            X(block, bins) =  X(block, bins)+ grad_norms(i,j);
            
        end
    end 
end

%concatenating blocks
v = X(:);
v = v / norm(v); % Divide by Euclidean norm
v(v > 0.2) = 0.2; % Clip values over 0.2
v = v / norm(v); % Divide again by Euclidean norm

result = v;

end




%{
thetas =  atan2(gradient_y(i,j), gradient_x(i,j));  %correct, angles increase clockwise
result = thetas / pi * 180;
result(result < 0) = result(result < 0) + 180;
result(result > 180) = 180;

%}
