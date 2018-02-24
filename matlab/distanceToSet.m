%Computes distance between histogram of visual words and training images
% histograms

%Created By: Akshay Chopra
%Person Number: 50248989
%Email: achopra6@buffalo.edu



function histInter = distanceToSet(wordHist, histograms)
% Compute distance between a histogram of visual words with all training image histograms.
% Inputs:
% 	wordHist: visual word histogram - K * (4^(L+1) − 1 / 3) × 1 vector
% 	histograms: matrix containing T features from T training images - K * (4^(L+1) − 1 / 3) × T matrix
% Output:
% 	histInter: histogram intersection similarity between wordHist and each training sample as a 1 × T vector

	% TODO Implement your code here
      t = [];
      for i = 1: size(histograms,2)
          m = min(wordHist,histograms(:,i));
          s = sum(m(:));
          dist= cat(2, t, s);
          t = dist;
      end
      
      %histInter=bsxfun(@min,wordHist,histograms);
  histInter = t;
   % min(a,b);
    %histInter=sum(histInter);
end