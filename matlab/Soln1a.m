%Solution 1.1
%Created By: Akshay Chopra
%Person Number: 50248989
%Email: achopra6@buffalo.edu


    %Calling createFilterBank function to get the 20 filters
    filterBank=createFilterBank(); 


   
    %srcimagefolder=dir('/Users/akshaychopra/Documents/MATLAB/Assignment 1/data/art_gallery/*.jpg');
     srcimagefolder=dir('../data/art_gallery/*.jpg');
    disp(srcimagefolder);


    imgpath=srcimagefolder(1).name;
    img=imread(imgpath);
   
    %If the image is 'Grayscale', covert it to 'RGB'.
    if size(img,3)~=3
       img=repmat(img,[1 1 3]);
    end 
   
    
    
    %Now, We will call extractFilterResponses function to apply filter on
    %the image
    
    filterResponses=extractFilterResponses(img,filterBank);

   
    for i=1:3: 60
      im=cat(3,filterResponses(:,:,i),filterResponses(:,:,i+1),filterResponses(:,:,i+2));
    
      imwrite(im,sprintf('../montage_images/im_%d.jpg',i+20));
    
    end
    
    
    outputdir=dir('../montage_images/*.jpg');
    filename={outputdir.name}';
   
 
    montage(filename,'Size',[4 5]);





