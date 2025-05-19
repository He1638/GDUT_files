function Mov_SimTribody_Lnya

close all;
ToDeg=180/pi;
ToRad=pi/180;

m1=1e1;
m2=1.5e1;
m3=1.3e1;
G=6.67e-11;

p1=[3,0,0]';
p2=[0,0,3]';
p3=[0,3,0]';

v1=[0,0,3]'*-1e-1;
v2=[3,0,0]'*1e-1;
v3=[3,0,3]'*1e-1;

EndTime=1000;  
dtime=10;



%%
for n=0:dtime:EndTime
    a1=(G*m1*m2/norm(p1-p2)^3)*(p1-p2)+(G*m1*m3/norm(p1-p3)^3)*(p1-p3);
    a2=(G*m2*m1/norm(p2-p1)^3)*(p2-p1)+(G*m3*m2/norm(p2-p3)^3)*(p2-p3);
    a3=(G*m3*m1/norm(p3-p1)^3)*(p3-p1)+(G*m3*m2/norm(p3-p2)^3)*(p3-p2);
    
    v1=v1+a1*dtime;
    v2=v2+a2*dtime;
    v3=v3+a3*dtime;
    p1=p1+v1*dtime;
    p2=p2+v2*dtime;
    p3=p3+v3*dtime;
%     axis([-1000,1000,-1000,1000,-1000,1000]);
    grid on;
    axis equal;
 
    plot3(p1(1),p1(2),p1(3),'rO'); hold on;
    plot3(p2(1),p2(2),p2(3),'bO');hold on;
    plot3(p3(1),p3(2),p3(3),'gO');hold on;

    drawnow;
    pause(0.01);
%     cla;
end




% %% 设置坐标轴端点
% px=[2,0,0]';
% py=[0,2,0]';
% pz=[0,0,2]';
% 
% px=oR*px+op;
% py=oR*py+op;
% pz=oR*pz+op;
% 
% %% 设置固定参考坐标轴端点
% wx=[4,0,0]';
% wy=[0,4,0]';
% wz=[0,0,4]';
% wo=[0,0,0]';
% 
% % %绘制固定参考坐标系
% Connect3D(wo,wx,'r',0.5); hold on;
% Connect3D(wo,wy,'b',0.5); hold on;
% Connect3D(wo,wz,'g',0.5);hold on;
% plot3(wo(1),wo(2),wo(3),'rX');
% plot3(wo(1),wo(2),wo(3),'rO');
% 
% % %绘制局部坐标系
% Connect3D(op,px,'r',2); hold on;
% Connect3D(op,py,'b',2); hold on;
% Connect3D(op,pz,'g',2);hold on;
% 
% 
% view(145,33);
% axis equal
% axis([-10,10,-10,10,-10,10]);
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% grid on;
% pause(0.1);
% drawnow;
% 
% if(fcla)
%     cla;
% end
