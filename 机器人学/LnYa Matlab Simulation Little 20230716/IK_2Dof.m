function [th1,th2]=IK_2Dof(px,py)

L2=51.56;
L3=121.83;
ToRad=pi/180;
ay=py+L2*sin(99*ToRad)-L3*cos(99*ToRad);
ax=px-L2*cos(99*ToRad)-L3*sin(99*ToRad);
th1=atan2( ay,ax);
th2=-99*ToRad-th1;