function result = checkRest(feature,name,featurenum) 
%     restConfig = [89.4366   90.0091   20.0930   10.8171   90.4310   90.0777    1.9369    2.0105   16.1111   11.7796  23.5488   22.4120   11.4955   13.9732   13.1000   15.9011 ];
%     restConfig = [82.6262   80.6178   17.2712   11.2458   87.5173   86.2328   13.6539   16.3499   13.7750    9.8149   68.7339   69.4822    9.0471    8.2503  100.5854  100.9002];
%     restConfigRu = [83.7762   80.9306   15.2821   14.0842   90.6941   87.0065   12.7571   11.0648   14.1850   14.6264   70.2185 69.4750    5.9992    6.0749   96.9138   91.7968];
%     restConfig = restConfigRu;
    if(featurenum==2)
        restConfigFeature2 = [-0.2059    0.0696   -0.0242    0.0994   -0.1759    0.1145   -0.0616   -0.0021   -0.9735   -0.9901   -0.9364   -0.9533   -0.9842   -0.9927   -0.9431   -0.9343   -0.0994   -0.1221   -0.3499   -0.2850   -0.0186   -0.0382   0.3267    0.3566];
        restConfig = restConfigFeature2;
        tol1 = 0.2; tol2 = 0.2;
    else
        restConfig = [82.6262   80.6178   17.2712   11.2458   87.5173   86.2328   13.6539   16.3499   13.7750    9.8149   68.7339   69.4822    9.0471    8.2503  100.5854  100.9002];
        tol1 = 15; tol2 = 5;
    end
%     if(exist(strcat('Samples\',name))==7)
%         load(strcat('Samples\',name,'\restconfig.mat'));
%         restConfig = restconfig; 
%         if((max(abs(feature - restConfig))>15)||max((feature(5:6)-restConfig(5:6))>5))
%             result = 0;
%         else
%             result = 1;
%         end        
%     else
%         disp('Not saving Resting data yet. Please initialize Rest.')
%     end
    
        if((max(abs(feature - restConfig))>tol1)||max((feature(5:6)-restConfig(5:6))>tol2))
            result = 0;
        else
            result = 1;
        end       





end