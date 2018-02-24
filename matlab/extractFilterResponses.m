%Created By: Akshay Chopra
%Person Number: 50248989
%Email: achopra6@buffalo.edu


function [filterResponses] = extractFilterResponses(img, filterBank)
% Extract filter responses for the given image.
% Inputs: 
%   img:                a 3-channel RGB image with width W and height H
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W x H x N*3 matrix of filter responses


% TODO Implement your code here


    
   %If the image is 'Grayscale', covert it to 'RGB'.
   if size(img,3)~=3
       img=repmat(img,[1 1 3]);
   end 
  
   
   %If Image is not floating point type, we convert it
    if(~isfloat(img))
        img=im2double(img);
    end


    %Now,We convert our image to L*a*b space
    imgnew=RGB2Lab(img(:,:,1), img(:,:,2), img(:,:,3));

    
    %We apply the filters on the image, we concatenate the resulting images
    %one by one
    for i=1:20
       imresponse=imfilter(imgnew,filterBank{i});
       if(i==1)
           imresponsenew=imresponse;
       else
           imresponsenew=cat(3,imresponsenew,imresponse);
       end
       
    end
    
    
 filterResponses=imresponsenew;
end
