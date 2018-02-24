%Solution 1.3
%Creating WordMap for  Image using the filterbank and the dictionary
%Created By: Akshay Chopra
%Person Number: 50248989
%Email: achopra6@buffalo.edu

load('dictionary.mat');
srcimagefolder=dir('../data/art_gallery/*.jpg');
%load('vision.mat');;
%Calculating WordMap for 3 images
    for i=1 : 3

        imgpath=srcimagefolder(i).name;

        img=imread(imgpath);

        %If the image is 'Grayscale', covert it to 'RGB'.
        if size(img,3)~=3
           img=repmat(img,[1 1 3]);
        end 

        
        %Calling createFilterBank function to get the 20 filters
        filterBank=createFilterBank(); 

        
%          %Now, We will call extractFilterResponses function to apply filter on
%          %the image   
%         filterResponses=extractFilterResponses(img,filterBank);

        
        %Calling getVisualWords to compute the WordMap for the  image
        [wordMap] = getVisualWords(img, filterBank, dictionary);
        
         %imwrite(wordMap,sprintf('/Users/akshaychopra/Documents/wordmaps/im_%d.jpg',i));
        
    end

   
   



