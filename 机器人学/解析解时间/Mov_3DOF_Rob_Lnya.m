close all;
clear;

ToDeg = 180/pi;
ToRad = pi/180;
L1=50;
L2=100;
L3=100;

i=100;
tic
while(i>0)
    th1=0;
    th2=0;
    th3=0;
    DHfk3Dof_Lnya(th1,th2,th3,0);
    view(134,12);
    
    stp=30;
    
    r=80;
    x=-140;
    y=10;
    z=60;

   [th1,th2,th3]=IK_3DOF_Rob_Lnya(L1,L2,L3,x,y,z);
   th1=th1*ToDeg;
   th2=th2*ToDeg;
   th3=th3*ToDeg;
i=i-1;
end
toc
   
   plot3(x,y,z,'kX'); hold on;






