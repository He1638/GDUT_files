close all;
ToRad=pi/180;
ToDeg=180/pi;
roll=0*ToRad;
pitch=0*ToRad;
yaw=0*ToRad;

tht=60;


op=[0,0,0]; %原点
oR = rpy2rot(roll,pitch,yaw);  %初始姿态

tx=tht*ToRad;
oRt = rpy2rot(roll+tx,pitch+tx,yaw+tx);  %目标姿态

%计算角速度
w=calculate_w(oR,oRt);
figure(1)
DrawFrame(oRt, op, 0); 

%%
figure(2)
stp=5;
for i=1:stp:tht
  DrawFrame(oRt, op, 0); 
       
  the=i*ToRad;
  oRx = rpy2rot(roll+the,pitch,yaw); 
  DrawFrame(oRx, op, 0);
end
pause;

for i=1:stp:tht
  DrawFrame(oRt, op, 0); 
       
  the=i*ToRad;
  oRx = rpy2rot(roll+tht*ToRad,pitch+the,yaw); 
  DrawFrame(oRx, op, 0);
end
pause;

for i=1:stp:tht
  DrawFrame(oRt, op, 0); 
       
  the=i*ToRad;
  oRx = rpy2rot(roll+tht*ToRad,pitch+tht*ToRad,yaw+the); 
  DrawFrame(oRx, op, 0);
end
pause;


%%
figure(3);
stp=5;
for i=1:stp:tht
  DrawFrame(oRt, op, 0); 
       
  the=i*ToRad;
  oRx = rpy2rot(roll+the,pitch+the,yaw+the); 
  DrawFrame(oRx, op, 0);
  pause(0.5);
end




%%
figure(4)
for n=0:0.1:1
   DrawFrame(oRt, op, 0);  
   R_m=oR*Rodrigues(w,n);
   DrawFrame(R_m, op, 0);
   pause(0.5);
end


% DrawFrame(oWR, oWp, 0);

