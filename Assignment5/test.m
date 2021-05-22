

close all
clear all

addpath digits_training
addpath digits_test


%{
 A = [1 2; 2 3]
 B = [4 7; 8 12]
%conveting into grayscale img
I1 = mat2gray(A)
I2 = mat2gray(B)
distance = euclidean_distance(I1, I2)
%}



%{

test_image = '9.png';

class_label = nnc_euclidean(test_image)
%}




my_image1 = imread('digits_test/label1_test7.png');
my_image2 = imread('digits_training/label1_training7.png');
%result1 = euclidean_distance(my_image1, my_image2)
%result2 = nnc_euclidean(my_image1)
[accuracy, confusion_matrix] = nnc_euclidean_stats()


%result3 = chamfer_distance(my_image1, my_image2)
%result4 = nnc_chamfer(my_image1)
%[accuracy, confusion_matrix] = nnc_chamfer_stats()
    

