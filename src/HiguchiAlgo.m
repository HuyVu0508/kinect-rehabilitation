function result = HiguchiAlgo(movement)

    if(size(movement,1)~=1)
        movement = movement';
    end

%     condition1 = sum(  (movement-mean(movement))>5  )<(size(movement,2)/2);
    condition2 = std(movement) < 10; 
    condition3 = sum(abs((movement - ones(1,size(movement,1))*mean(movement))))<300;
    if(condition2)
%      if(0)
        result = 1;
    else
    
    
    n = length(movement);
%     k0 = 5;
%     windowwidth = 20;
    windowwidth = length(movement);
    k0 = floor(windowwidth/3);
    step = 1;
    i = 1;
    result = [];
    while(i+windowwidth-1<=n)
        X = movement(i:(i+windowwidth-1));
        L = zeros(1,k0);
        for k=1:k0
            Lmk = zeros(1,k);
           for m=1:k
               num = floor((windowwidth-m)/k);
               indx = (0:num)*k + m;              
               Xmk = X(indx);      
               Xmk2 = [Xmk(2:(num+1)),Xmk(num+1)];
               deltaXmk = sum(abs(Xmk2-Xmk));
               Lmk(m) = 1/k*deltaXmk*(windowwidth-1)/(num*k);
%                 Lmk(m) = deltaXmk;
           end     
           L(k) = mean(Lmk);
        end
        
        fit = polyfit(log(1:k0),log(L),1);
        D = -fit(1);
        result = [result,D];
       i = i + step; 
    end
    end
    
    
    
%     result = [ones(1,floor(windowwidth/2)),result,ones(1,floor(windowwidth/2))];
    result = result;

    
    

%     figure;
%     subplot(2,1,1);
%     plot(movement);
%     ylim([0,120]);
% %     ylim([-1,1]);
% %     xlim([0,200]);
%     subplot(2,1,2);
%     plot(result);
%     ylim([0.8,2.5]);
% %     xlim([0,100]);
    
%     % test Higuchi   
%     y=normrnd(0,1,[1,500])
%     x = 1:500;
%     mean(HiguchiAlgo((y+100*sin(x/50))))
%     HiguchiAlgo(1/100*(y+100*sin(x/50)))    
    
end