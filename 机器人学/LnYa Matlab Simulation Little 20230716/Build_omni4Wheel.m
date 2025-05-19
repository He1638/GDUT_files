% %Build Omni4_WheelRobot
clear;
close all;

syms   L R vx vy dth Tspeed;

u=[];

th='th';
ToDeg = 180/pi;
ToRad = pi/180;
UX = [1 0 0]';
UY = [0 1 0]';
UZ = [0 0 1]';

Wheel= struct('name','Wheel' , 'Beta',  0*ToRad, 'Lr', 0, 'alf', 0*ToRad, 'gama',0*ToRad,'r',0,'az',UZ);     % az 
Wheel(1)= struct('name','1' , 'Beta',  45*ToRad, 'Lr', 'L', 'alf', 45*ToRad, 'gama',0*ToRad,'r','R','az',UZ);        %Wheel 1
Wheel(2)= struct('name','2' , 'Beta',  135*ToRad, 'Lr', 'L', 'alf', 135*ToRad, 'gama',0*ToRad,'r','R','az',UZ);        %Wheel 2
Wheel(3)= struct('name','3' , 'Beta',  225*ToRad, 'Lr', 'L', 'alf', 225*ToRad, 'gama',0*ToRad,'r','R','az',UZ);        %Wheel 3
Wheel(4)= struct('name','4' , 'Beta',  315*ToRad, 'Lr', 'L', 'alf', 315*ToRad, 'gama',0*ToRad,'r','R','az',UZ);        %Wheel 3

lt=Wheel(2).r
Tspeed=-sym(Wheel(2).r)

for n=1:1:4
    
    bRw=(Rotz(sym(th))).';
    dRb=(Rotz(Wheel(n).Beta))';

              
    Tspeed=[1, 0 ,-sym(Wheel(n).Lr)*cos(Wheel(n).alf);
                0,  1, -sym(Wheel(n).Lr)*sin(Wheel(n).alf);
                0,0,0];
    v2u=[1, tan(Wheel(n).gama),0]/sym(Wheel(n).r);
    u=[u;simplify(v2u*dRb*Tspeed*bRw)]
end
   u=u*R

% th=0*ToRad;
% thb=0*ToRad;
% tha=0*ToRad;
% thw=0*ToRad;
% 
% bRw=(Rotz(th))'
% dRb=(Rotz(thb))'
% Tspeed=[1, 0 ,-L*cos(tha);
%                 0,  1, -L*sin(tha);
%                 0,0,0]
%             
%  v2u=[1, tan(thw),0]/R
% 
% u=simplify(v2u*dRb*Tspeed*bRw)