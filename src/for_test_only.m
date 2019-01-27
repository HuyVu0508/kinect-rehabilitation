% function result = for_test_only()
% 
% end

function result = for_test_only(motion)
%     for i=1:size(motion,2)
%        figure;
%        plot(motion(:,i));
%        ylim([-1,1]);
%     end
    
%     subplot(3,1,1);
%     plot(motion(:,1:4));
% %     ylim([0,120]);
%     ylim([-1,1]);  
%     subplot(3,1,2);
%     plot(motion(:,7:12));
% %     ylim([0,120]);
%     ylim([-1,1]);    
%     subplot(3,1,3);
%     plot(motion(:,17:20));
% %     ylim([0,120]);
% %     ylim([-1,1]);    
%     
%     subplot(3,1,1);
%     plot(motion(:,1:2));
%     ylim([0,120]);
% %     ylim([-1,1]);  
%     subplot(3,1,2);
%     plot(motion(:,3:4));
%     ylim([0,120]);
% %     ylim([-1,1]);    
%     subplot(3,1,3);
%     plot(motion(:,11:12));
%     ylim([0,120]);
% %     ylim([-1,1]); 


%     subplot(2,2,1);
%     plot(motion(:,1:2));
%     ylim([0,120]);
% %     ylim([-1,1]);
%     subplot(2,2,2);
%     plot(motion(:,3:4));
%     ylim([0,120]);
% %     ylim([-1,1]);    
%     subplot(2,2,3);
%     plot(motion(:,9:10));
%     ylim([0,120]);
% %     ylim([-1,1]);
%     subplot(2,2,4);
%     plot(motion(:,11:12));
%     ylim([0,120]);
    
    motion = [];
    result = [];
    for num = 1:16
        resultnum = [];
        for i=1:10
%             load(strcat('Samples\Huy\Feature1\move1_canh tay 4 goc\sample (',num2str(i),').mat'));
            load(strcat('Samples\Huy\Feature1\move2_khuyu tay 4 goc\sample (',num2str(i),').mat'));
%             load(strcat('Samples\Huy\Feature1\move3_canh tay gio qua dau\sample (',num2str(i),').mat'));
            
            % Xu ly data
            frames = 7;
%             size(motion)
            y = filter(ones(1,frames)/frames,1,motion);
            motion = y([(frames+1):size(motion,1)],:);
            
            fd = HiguchiAlgo(motion(:,num));
            resultnum = [resultnum;fd];
            
            if(num==100)
               figure;
               plot(motion(:,num));
               ylim([0,120]);
               i
            end
            
        end
        result = [result,resultnum];
    end
    figure;    
%     plot(result);
    hold on
%     for i=1:size(result,1)
%         scatter([1:16],result(i,:));
%     end
    for i=1:16
        scatter(i*ones(1,size(result,1)),result(:,i));
    end
    hold off
    
    legend('(1)','(2)','(3)','(4)','(5)','(6)','(7)','(8)','(9)','(10)','(11)','(12)','(13)','(14)','(15)','(16)');
%     ylim([0.8,2.5]);
    vr = var(result);
    mx = max(result-ones(10,1)*mean(result));
    m = mean(result);


end