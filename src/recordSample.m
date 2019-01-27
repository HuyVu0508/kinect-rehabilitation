function [executing,motion,delay] = recordSample(executing0,rested0,motion0,motiontemp0,feature0,delay0,name)
        
        motion = motion0;
        motiontemp = motiontemp0;
        executing = executing0;
        feature = feature0;
        rested = rested0;
        delay = delay0;
        
        
        % Check if person execute exercise
        if(executing==0)
            if( sum(rested(1:length(rested)/2)) - sum(rested(length(rested)/2+1:length(rested))) >=3    )
               executing = 1; 
               disp('START EXECUTING');
               rested;
               
               % Start recording
               motion = motiontemp;
                          
            end
        else
            if( sum(rested(1:length(rested)/2)) - sum(rested(length(rested)/2+1:length(rested))) <=-3 )
               executing = 0; 
               disp('STOP EXECUTING');              
               rested;
               
               if(size(motion,1)>50)
                delay = 20;
               end
            end            
        end
        
        if(delay>0)
           motion = [motion;feature];
           delay = delay - 1;   
           if(delay==0)              
               % Save data           
               if(exist(strcat('Samples\',name))==7)
                   list = dir(strcat('Samples\',name));      
                   n = size(list);               
                    save(strcat('Samples\',name,'\sample',num2str(n-2+1),'.mat'),'motion');
               else
                    disp(strcat('Create new sample folder of ',name));
                    mkdir('Samples\',name);
               end                
           end
        end
        
        
        fsdf
        sf
das


        if(executing==1)
           disp('YES EXECUTING - RECORDING');           
               
               motion = [motion; feature]; 
           
%             % Save all features 
%             % t ~= 5.e^-05
%             if(size(motion,1)<=300)
%                motion = [motion; feature];
%             else
%                motion(1,:) = [];
%                motion = [motion; feature];
%             end  
        else
           disp('N0 EXECUTING'); 
        end

        
        
end