%Created By: Akshay Chopra
%Person Number: 50248989
%Email: achopra6@buffalo.edu



function [wordMap] = getVisualWords(img, filterBank, dictionary)
% Compute visual words mapping for the given image using the dictionary of visual words.

% Inputs:
% 	img: Input RGB image of dimension (h, w, 3)
% 	filterBank: a cell array of N filters
% Output:
%   wordMap: WordMap matrix of same size as the input image (h, w)

    % TODO Implement your code here
    
    %Computing filterresponse for the image  by applying th filters
    filterResponses=extractFilterResponses(img,filterBank);
    
    
    sizeimp=size(img,1)*size(img,2);   
    
    
   filterResponses2D=reshape(filterResponses,[sizeimp,60]);
   
   %Now assigning closest visual word to the filtered image
   [D,I]= pdist2(dictionary,filterResponses2D,'euclidean','Smallest',1);
       
   
    I=I';
    
    
    I=reshape(I,[size(img,1),size(img,2)]);
    
    %imagesc(I);
    
    wordMap=I;
   

end
