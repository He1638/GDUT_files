function rpy=rot2rpy(rot)


p=atan2(-rot(3,1),   sqrt(rot(1,1)^2+ rot(2,1)^2)   );
if p<=0.5*pi && p>=-0.5*pi
    r=atan2(rot(3,2),rot(3,3));
    y=atan2(rot(2,1), rot(1,1));
else
    r=atan2(-rot(3,2),-rot(3,3));
    y=atan2(-rot(2,1), -rot(1,1));
end
rpy=[r,p,y];



% function rot = rpy2rot(roll,pitch,yaw)
% 
% Cphi = cos(roll);  Sphi = sin(roll);
% Cthe = cos(pitch); Sthe = sin(pitch);
% Cpsi = cos(yaw);   Spsi = sin(yaw);
% 
% rot = [Cpsi*Cthe  -Spsi*Cphi+Cpsi*Sthe*Sphi  Spsi*Sphi+Cpsi*Sthe*Cphi;
%        Spsi*Cthe  Cpsi*Cphi+Spsi*Sthe*Sphi   -Cpsi*Sphi+Spsi*Sthe*Cphi;
%        -Sthe      Cthe*Sphi                  Cthe*Cphi                 ];