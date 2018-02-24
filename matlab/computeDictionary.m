% Computes filter bank and dictionary, and saves it in dictionary.mat 
%Created By: Akshay Chopra
%Person Number: 50248989
%Email: achopra6@buffalo.edu


function computeDictionary()

	load('data/traintest.mat'); 

	interval= 1;
	train_imagenames = train_imagenames(1:interval:end);
   
    %Calling function 'getFilterBankAndDictionary' to compute dictionary
    %of visual words. We pass imagepaths as the parameter
	[filterBank,dictionary] = getFilterBankAndDictionary(strcat(['../data/'],train_imagenames));

    
    %Saving the 'dictionary.mat' and 'filterBank'
	save('dictionary.mat','filterBank','dictionary'); 

end
