%Created By: Akshay Chopra
%Person Number: 50248989
%Email: achopra6@buffalo.edu


function [h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize)
% Compute histogram of visual words using SPM method
% Inputs:
%   layerNum: Number of layers (L+1)
%   wordMap: WordMap matrix of size (h, w)
%   dictionarySize: the number of visual words, dictionary size
% Output:
%   h: histogram of visual words of size {dictionarySize * (4^layerNum - 1)/3} (l1-normalized, ie. sum(h(:)) == 1)

    % TODO Implement your code here
    
    wordMap1 = wordMap;
    
    [r c]=size(wordMap1);
    
    
   M= mat2cell(wordMap1, [floor(r/4) floor(r/4) floor(r/4) (r-(3*floor(r/4)))], [floor(c/4) floor(c/4) floor(c/4) (c-(3*floor(c/4)))]); 

   N=mat2cell(wordMap1,[floor(r/2) (r-(floor(r/2)))], [floor(c/2) (c-(floor(c/2))) ]   );
   
   for i=1:4
       for j=1:4
           [h]=getImageFeatures(M{i,j}, dictionarySize);
           
           if(i==1 && j==1)
               h1=h;
           else
               h1=cat(1,h1,h);
           end
           
       end
   end
    
    h1 = h1/sum(h1(:));
    
    for i=1:2
        for j=1:2
            [h]=getImageFeatures(N{i,j}, dictionarySize);
            if(i==1 && j==1)
               h2=h;
           else
               h2=cat(1,h2,h);
           end
           
       end
   end
    
    h2 = h2/sum(h2(:));
    
     [h]=getImageFeatures(wordMap1, dictionarySize); 
     h3=h;
     
     h=cat(1,h1/2,h2/4,h3/4);
     
     
     
end