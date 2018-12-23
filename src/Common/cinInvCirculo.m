function [q] = cinInvCirculo(alpha)
    % Coordenadas
    x = cos(alpha);
    y = 3; % Plano sobre el que dibujara
    z = sin(alpha) + 3;
    
    q = zeros(1,6);
    q(1:3) = paramsCilindrico(x,y-1,z); % Centro de la muneca
    q(5) = q(1);
    
end