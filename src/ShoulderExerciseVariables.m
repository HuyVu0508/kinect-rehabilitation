function variables = ShoulderExerciseVariables(skecor)
%  Variables structure:
rawdata = skecor(5:12,:);
variables = [];
for i=1:(12-5+1)
    variables=[variables,rawdata(i,:)];
end
       
end