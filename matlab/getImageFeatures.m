%Creating Histogram of the visual words 
%Created By: Akshay Chopra
%Person Number: 50248989
%Email: achopra6@buffalo.edu


function [h] = getImageFeatures(wordMap, dictionarySize)

% Compute histogram of visual words
% Inputs:
% 	wordMap: WordMap matrix of size (h, w)
% 	dictionarySize: the number of visual words, dictionary size
% Output:
%   h: vector of histogram of visual words of size dictionarySize (l1-normalized, ie. sum(h(:)) == 1)

	% TODO Implement your code here
   % wordMap = wordMap.wordMap;
    wordMap=reshape(wordMap, [size(wordMap,1)*size(wordMap,2), 1]);
    
    %Creating histogram
	h=hist(wordMap,dictionarySize);
       
	assert(numel(h) == dictionarySize);
    
     %Normalizing histogram
     
     h1=h/sum(h(:));
     
      h=h1;
    
      h=h';
end