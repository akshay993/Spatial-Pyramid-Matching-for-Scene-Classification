% Computes training features for all training images and stores it in
% vision.mat

%Created By: Akshay Chopra
%Person Number: 50248989
%Email: achopra6@buffalo.edu

function buildRecognitionSystem()
% Creates vision.mat. Generates training features for all of the training images.

	load('dictionary.mat');
	load('../data/traintest.mat');

	% TODO create train_features
    
    interval=1;
    train_imagenames = train_imagenames(1:interval:end);
    
   
   %Iterating Training images and creating the wordsmap for each image and
   %then concatinating
     for i=1:size(train_imagenames)   
           imageName = strrep(train_imagenames{i},'.jpg','.mat');
           WordMaps= strcat(['../data/'],imageName);
           
                WordMap=load(WordMaps);
                 WordMap=WordMap.wordMap;
                    [h]=getImageFeaturesSPM(3, WordMap, size(dictionary,1));
                    
                    if(i==1)
                       h2=h;
                    else
                        h2=cat(2,h2,h);
                    end
                
            
     end
             %  h =h2;
                   
                
            train_features=h2;
        
    

	save('vision.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels');

end