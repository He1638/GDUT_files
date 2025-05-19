close all;
clear;
global Link;

ToDeg = 180/pi;
ToRad = pi/180;

L1=126.15;
L2=47.32;
L3=122.39;


th1=0;
th2=0;
th3=0;

range_th1=7.78*ToRad;
range_th2=120*ToRad;

%[th1,th2]=IK_2Dof(100,-10);
%plot3(100,-100,0,'r*');hold on;
axis equal;
[A4,A5]=DHfk2Dof_Lnya(th1*ToDeg,th2*ToDeg,0);
view(0,90);
% pause;
stp=30;
%% 绘制工作空间
workspace_l=[];
workspace_r=[];
for th1=range_th1:-0.02:-range_th1
    for th2=range_th2:-0.02:-range_th2
        pxl=L2*cos(th1+th2)-L3*sin(th1+th2)+L1*cos(th1);
        pyl=L2*sin(th1+th2)+L3*cos(th1+th2)+L1*sin(th1);
        workspace_l=[workspace_l;[pxl,pyl,0]];
        pxr=L2*cos(th1+th2)+L3*sin(th1+th2)+L1*cos(th1);
        pyr=L2*sin(th1+th2)-L3*cos(th1+th2)+L1*sin(th1);
        %DHfk2Dof_Lnya(th1*ToDeg,th2*ToDeg,1);view(0,90);
        workspace_r=[workspace_r;[pxr,pyr,0]];
    end
end

figure(1);
plot3(workspace_l(:,1),workspace_l(:,2),workspace_l(:,3),'r.');hold on;
DHfk2Dof_Lnya(th1*ToDeg,th2*ToDeg,0);
grid on;
view(0,90);

figure(2);
plot3(workspace_r(:,1),workspace_r(:,2),workspace_r(:,3),'g.');hold on;
DHfk2Dof_Lnya(th1*ToDeg,th2*ToDeg,0);
grid on;
%axis equal;
view(0,90);

%% 绘制给定姿态的工作空间
workspace_l=[];
step=0;
th=[];
for th1=range_th1:-0.01:-range_th1
    step=step+1;
    th2=(-9-th1*ToDeg)*ToRad;
    if  th2<=range_th2 && th2>=-range_th2
        th11=th1
        th22=th2
        
        pxl=L2*cos(th1+th2)-L3*sin(th1+th2)+L1*cos(th1);
        pyl=L2*sin(th1+th2)+L3*cos(th1+th2)+L1*sin(th1);
        th=[th;[th1,th2]];
        workspace_l=[workspace_l;[pxl,pyl,0]];
        figure(3);
        plot3(workspace_l(:,1),workspace_l(:,2),workspace_l(:,3),'k.');hold on;
        if th1-0.01<=-range_th1
            DHfk2Dof_Lnya(th1*ToDeg,th2*ToDeg,0);
        else
            DHfk2Dof_Lnya(th1*ToDeg,th2*ToDeg,1);
        end
        grid on;
        view(0,90);
    end
end

%% 点到点轨迹测试，等步距运动



%% 点到点轨迹测试，五次多项式轨迹规划，同步运动
while(1)

M=20;
ths=[0.135786615805159,-0.292866248484649];
the=[-0.134213384194841,-1.59366257527955];
thrr=Fifth_trajectory(ths,the,10*pi,10*pi);

xe=[];
ye=[];
ze=[];
step=int16(length(thrr)/M)
for n=1:step:length(thrr)
    ns=n
    if n<length(thrr)-step
        DHfk2Dof_Lnya(thrr(n,1)*ToDeg,thrr(n,2)*ToDeg,1);
    else
        DHfk2Dof_Lnya(thrr(n,1)*ToDeg,thrr(n,2)*ToDeg,0);
    end
    xe=[xe; Link(4).p(1)];
    ye=[ye; Link(4).p(2)];
    ze=[ze; Link(4).p(3)];
    plot3(xe,ye,ze,'r*');hold on;
    view(0,90);
end

ths=the;
the=[0.135786615805159,-0.292866248484649];
thrr=Fifth_trajectory(ths,the,10*pi,10*pi);

xe=[];
ye=[];
ze=[];
step=int16(length(thrr)/M)
for n=1:step:length(thrr)
    ns=n
    if n<length(thrr)-step
        DHfk2Dof_Lnya(thrr(n,1)*ToDeg,thrr(n,2)*ToDeg,1);
    else
        DHfk2Dof_Lnya(thrr(n,1)*ToDeg,thrr(n,2)*ToDeg,0);
    end
    xe=[xe; Link(4).p(1)];
    ye=[ye; Link(4).p(2)];
    ze=[ze; Link(4).p(3)];
    plot3(xe,ye,ze,'r*');hold on;
    view(0,90);
end

end


