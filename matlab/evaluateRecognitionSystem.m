% Evaluates the recognition system for all test-images and returns the confusion matrix

%Created By: Akshay Chopra
%Person Number: 50248989
%Email: achopra6@buffalo.edu

function [conf] = evaluateRecognitionSystem()
% Evaluates the recognition system for all test-images and returns the confusion matrix

	load('vision.mat');
	load('../data/traintest.mat');

	% TODO Implement your code here
    
    confusion=zeros(8,8);
    
    srctestfiles=test_imagenames
   
    srctestfiles=strcat(['../data/'],srctestfiles);
    
    for i=1: size(srctestfiles)
              
              guessedImage = guessImage( srctestfiles{i} );
              
%               IndexC=strfind(mapping, guessedImage);
%               Index = find(not(cellfun('isempty', IndexC)));

                for j=1: size(mapping,2)
                    if(strcmp(guessedImage,mapping{j}))
                        break;
                    end
                end


               
              confusion(test_labels(i),j )=confusion(test_labels(i),j )+1;
              
    end    
   
    conf=confusion;
    
    accuracy=trace(conf) / sum(conf(:));
    disp(accuracy);
    
    percentage=accuracy*100;
    disp(percentage);
    
    

end