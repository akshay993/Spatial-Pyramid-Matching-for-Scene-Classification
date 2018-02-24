%Created By: Akshay Chopra
%Person Number: 50248989
%Email: achopra6@buffalo.edu

function [filterBank, dictionary] = getFilterBankAndDictionary(imPaths)
% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   filterBank: N filters created using createFilterBank()
%   dictionary: a dictionary of visual words from the filter responses using k-means.

% TODO Implement your code here
    

%Iterating for all the images to computer the dictionary
for i=1:length(imPaths);
    imagepath=imPaths{i};
   
    img=imread(imagepath);
    
    %Calling createFilterBank function to get the 20 filters
    filterBank  = createFilterBank();
    
    
    %If the image is 'Grayscale', covert it to 'RGB'.
   if size(img,3)~=3
       img=repmat(img,[1 1 3]);
   end 
   
    
   %Now, We will call extractFilterResponses function to apply filter on
    %the image    
   filterResponses=extractFilterResponses(img,filterBank);
   
   %Computing the multiplication of size of the image
   sizeimp=size(img,1)*size(img,2);
    
          
          newshape=reshape(filterResponses,[sizeimp,60]); %Reshaping the filtered image
          p=randperm(sizeimp,100); %Raandomly selecting 100 pixels from the filtered image
          newfilterresponse=newshape(p,:);
           
           if(i==1)              
           newres=newfilterresponse;
           
           else
               newres=cat(1,newres,newfilterresponse);
           end
        
    
end
     
     %Applying k clustering on all the concatenated images for 150 clusters
     [~,dictionary]=kmeans(newres,150,'EmptyAction','drop');
    
    
    


    

end
