function [q] = paramsCilindrico(xc,yc,zc)
    q = zeros(1,3);
    q(1) = atan2(-xc,yc);
    q(2) = zc-1;
    q(3) =sqrt(xc^2 + yc^2);
end