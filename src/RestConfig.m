function [motionrest1,saved] = RestConfig(skecor,feature,motionrest,str)   
    maxframe = 50;
    saved = 0;
    
    % Only 0.0013
    rvec = skecor(9,:) - skecor(5,:);
    rvec = rvec/norm(rvec);
    condition1 = abs(rvec(3))<0.05
    load('Data\restBasicConfig.mat');
    feature0 = restbasicconfig;
    tol2 = 20;
    condition2 = sum(abs(feature-feature0)>=tol2)==0
    
    % Check if satisfies  skecor / feature
    if(condition1&&condition2)
       disp('Basic conditions OK!!!') 
       if(size(motionrest,1)<=maxframe)
            size(motionrest,1)
       else
          disp('Keep standing still.') 
       end
       
       % While length(motionrest)<maxframe, keep adding frames 
       if(size(motionrest,1)<maxframe)
           motionrest = [motionrest;feature];          
       else        
        motionrest = [motionrest(2:maxframe,:);feature];
        
        mean0 = mean(motionrest);
        test = sum(sum((motionrest - ones(maxframe,1)*mean0)>=1.5));
        
        if(test==0)                
            restconfig = mean(motionrest);
            
            % Save to file
            if(exist(strcat('Samples\',name))==7)             
                save(strcat('Samples\',name,'\restconfig.mat'),'restconfig','motionrest');
            else
                disp(strcat('Create new sample folder of ',name));
                mkdir('Samples\',name);
                save(strcat('Samples\',name,'\restconfig.mat'),'restconfig','motionrest');
            end           
            saved = 1;
            disp('Rest Configuration Saved.')
        end
       end
    end
    
    motionrest1 = motionrest;
    
end