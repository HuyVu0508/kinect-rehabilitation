function [] = skeletonViewer(skeleton, image, nSkeleton )
    tic
    nSkeleton = 1;
%     imshow(image); 

    SkeletonConnectionMap = [[1 2]; % Spine
                             [2 3];
                             [3 4];
                             [3 5]; %Left Hand
                             [5 6];
                             [6 7];
                             [7 8];
                             [3 9]; %Right Hand
                             [9 10];
                             [10 11];
                             [11 12];
                             [1 17]; % Right Leg
                             [17 18];
                             [18 19];
                             [19 20];
                             [1 13]; % Left Leg
                             [13 14];
                             [14 15];
                             [15 16]
                             [5 9]];
    for (i = 1:20)
     if (nSkeleton > 0)
         X1 = [skeleton(SkeletonConnectionMap(i,1),1) skeleton(SkeletonConnectionMap(i,2),1)];
         Y1 = [skeleton(SkeletonConnectionMap(i,1),2) skeleton(SkeletonConnectionMap(i,2),2)];
         line(X1,Y1, 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '+', 'Color', 'g');
         
     end
%      if (nSkeleton > 1)
%          X2 = [skeleton(SkeletonConnectionMap(i,1),1) skeleton(SkeletonConnectionMap(i,2),1)];
%          Y2 = [skeleton(SkeletonConnectionMap(i,1),2) skeleton(SkeletonConnectionMap(i,2),2)];     
%          line(X2,Y2, 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '+', 'Color', 'g');
%      end
    
    hold on;
 end
 hold off;
 
 t=toc;
                     
end