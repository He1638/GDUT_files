ToRad=pi/180;
roll=0*ToRad;
pitch=30*ToRad;
yaw=40*ToRad;
R = rpy2rot(roll,pitch,yaw)



a_th = acos((R(1,1) + R(2,2) + R(3,3) - 1)/2);
a_w =(a_th / (2 * sin(a_th))) * [  R(3,2)-R(2,3),  R(1,3)-R(3,1),  R(2,1)-R(1,2)  ]'
