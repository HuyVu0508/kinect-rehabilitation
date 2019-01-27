function feature = FeatureExtract2(skecor) 

    feature = [];
    phi = zeros(1,8);
    theta = zeros(1,8);
    gamma = zeros(1,8);
    
    % Upper arm
    % Left
    a = skecor(6,:)-skecor(5,:);
    a = a/norm(a);    
    phi(1) = a(1); theta(1) = a(2); gamma(1) = a(3); 
    % Right
    a = skecor(10,:)-skecor(9,:);
    a = a/norm(a);    
    phi(2) = a(1); theta(2) = a(2); gamma(2) = a(3); 
    
    % Lower arm
    % Left
    a = skecor(7,:)-skecor(6,:);
    a = a/norm(a);    
    phi(3) = a(1); theta(3) = a(2); gamma(3) = a(3); 
    % Right
    a = skecor(11,:)-skecor(10,:);
    a = a/norm(a);    
    phi(4) = a(1); theta(4) = a(2); gamma(4) = a(3);     
    
    % Thigh
    % Left
    a = skecor(14,:)-skecor(13,:);
    a = a/norm(a);    
    phi(5) = a(1); theta(5) = a(2); gamma(5) = a(3);  
    % Right
    a = skecor(18,:)-skecor(17,:);
    a = a/norm(a);    
    phi(6) = a(1); theta(6) = a(2); gamma(6) = a(3);  
    
    % Lower leg
    % Left
    a = skecor(15,:)-skecor(14,:);
    a = a/norm(a);    
    phi(7) = a(1); theta(7) = a(2); gamma(7) = a(3);  
    % Right
    a = skecor(19,:)-skecor(18,:);
    a = a/norm(a);    
    phi(8) = a(1); theta(8) = a(2); gamma(8) = a(3);      

    feature = [phi,theta,gamma];
end