syms th1 th2 L1 L2 L3 tht
ToRad=pi/180;

Rz1=[cos(th1),-sin(th1),0,0;
     sin(th1),cos(th1),0,0;
     0,0,1,0;
     0,0,0,1];
Tx1=[1,0,0,L1;
     0,1,0,0;
     0,0,1,0;
     0,0,0,1];
 
Rz2=[cos(th2),-sin(th2),0,0;
     sin(th2),cos(th2),0,0;
     0,0,1,0;
     0,0,0,1];
Tx2=[1,0,0,L2;
     0,1,0,0;
     0,0,1,0;
     0,0,0,1];
 
Rz3l=[0,-1,0,0;
     1,0,0,0;
     0,0,1,0;
     0,0,0,1];
Tx3l=[1,0,0,L3;
     0,1,0,0;
     0,0,1,0;
     0,0,0,1];
Rz4l=[cos(tht-180*ToRad),-sin(tht-180*ToRad),0,0;
     sin(tht-180*ToRad),cos(tht-180*ToRad),0,0;
     0,0,1,0;
     0,0,0,1];
 
 
 Rz3r=[0,1,0,0;
     -1,0,0,0;
     0,0,1,0;
     0,0,0,1];
Tx3r=[1,0,0,L3;
     0,1,0,0;
     0,0,1,0;
     0,0,0,1];
Rz4r=[cos(180*ToRad-tht),-sin(180*ToRad-tht),0,0;
     sin(180*ToRad-tht),cos(180*ToRad-tht),0,0;
     0,0,1,0;
     0,0,0,1];
 
 
Grip_Left=simplify(Rz1*Tx1*Rz2*Tx2*Rz3l*Tx3l*Rz4l)
Grip_Right=simplify(Rz1*Tx1*Rz2*Tx2*Rz3r*Tx3r*Rz4r)