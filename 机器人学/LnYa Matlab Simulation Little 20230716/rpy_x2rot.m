function rot = rpy_x2rot(roll,pitch,yaw)

Cphi = cos(roll);  Sphi = sin(roll);
Cthe = cos(pitch); Sthe = sin(pitch);
Cpsi = cos(yaw);   Spsi = sin(yaw);

rot=[                  Cpsi*Cthe,                 -Cthe*Spsi,       Sthe;
 Cphi*Spsi + Cpsi*Sphi*Sthe, Cphi*Cpsi - Sphi*Spsi*Sthe, -Cthe*Sphi;
  Sphi*Spsi - Cphi*Cpsi*Sthe, Cpsi*Sphi + Cphi*Spsi*Sthe,  Cphi*Cthe]

   
% [ Cpsi*Cthe, Cpsi*Sphi*Sthe - Cphi*Spsi, Sphi*Spsi + Cphi*Cpsi*Sthe]
% [ Cthe*Spsi, Cphi*Cpsi + Sphi*Spsi*Sthe, Cphi*Spsi*Sthe - Cpsi*Sphi]
% [     -Sthe,                  Cthe*Sphi,                  Cphi*Cthe]