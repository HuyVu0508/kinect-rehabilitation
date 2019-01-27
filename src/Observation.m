num = 3  ;
figure;
for i=1:num   
     choice = 3;
     load(strcat('Samples\',name,'\move1\sample (',num2str(i),').mat'));
     
%      subplot(2,num/2,i);
%      movement = motion(:,choice);
%       plot(movement);
%       ylim([0,180]);  
%       
%       % title only
%       if(choice==1)
%           title('(1) Upper left arm');
%       elseif(choice==2)
%           title('(2) Upper right arm');
%       elseif(choice==3)
%           title('(3) Lower left arm');
%       elseif(choice==4)
%           title('(4) Lower right arm');
%       elseif(choice==5)
%           title('(5) Thigh left');
%       elseif(choice==6)
%          title('(6) Thigh right');
%       elseif(choice==7)
%           title('(7) Lower leg left');
%       elseif(choice==8)
%           title('(8) Lower leg right');
%       elseif(choice==9)
%           title('(9) Upper left arm 2');
%       elseif(choice==10)
%           title('(10) Upper right arm 2');
%       elseif(choice==11)
%           title('(11) Lower left arm 2');
%       elseif(choice==12)
%           title('(12) Lower right arm 2');
%       elseif(choice==13)
%           title('(13) Thigh left 2');
%       elseif(choice==14)
%           title('(14) Thigh right 2');
%       elseif(choice==15)
%           title('(15) Lower leg left 2');
%       elseif(choice==16)
%           title('(16) Lower leg right 2');
%           
%           
%       end

      % -----------------------
      
      subplot(2,num,i);
      movement = motion(:,choice);
      plot(movement);
      ylim([0,180]);      
      subplot(2,num,i+num);
      result = HiguchiAlgo(movement);
      plot(result);
      ylim([0.8,2.2]);    

end