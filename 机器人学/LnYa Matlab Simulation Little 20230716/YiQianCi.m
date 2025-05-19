clc;
clear all;
close all;

global Link 
num=1;
learning_rate =0.8;
ToDeg = 180/pi;
ToRad = pi/180;
tic
i=1;
while(i<=1000)
%输入起始六关节位置
th1=30;
th2=-120;
th3=-70;
th4=0;
th5=0;
th6=0;

%% 输入目标末端位置及旋转矩阵
Tpos=[-140,10,60]';     %期望位置

% %% 绘制机械臂初始位姿及末端姿态
 DHfk_3DoF2_Lnya(th1,th2,th3,0); %绘制机械臂
% plot3(Tpos(1),Tpos(2),Tpos(3),'kX'); hold on;
% view(-21,12);
% pause; cla;

%%

while (1)
    %% FK计算并绘制机器人，及目标点
    % plot3(Tpos(1),Tpos(2),Tpos(3),'kX'); hold on;

    
    %获取机械臂末端当前位置
    ex=Link(7).p(1);
    ey=Link(7).p(2);
    ez=Link(7).p(3);
     
    %% 计算误差
    p_err =[Tpos(1)-ex, Tpos(2)-ey, Tpos(3)-ez]' ;%计算位置误差
    w_err=[0,0,0]'; % 3DoF不考虑姿态误差，这里姿态误差置零
    Loss = norm(p_err) + norm(w_err)  %误差评价
    
    %% 小于期望误差则结束迭代
    if Loss<1e-5
        break;
    end
    
    %否则计算雅可比矩阵并计算角度修正量
    J=Jacobian6DoF_Ln(th1,th2,th3,th4,th5,th6);    %计算雅可比矩阵
    %     %%判断奇异
    %     D = det(J);
    %     if D == 0
    %         fprintf('D= %2.4f ',D); fprintf('\n');
    %         fprintf('Pass the singilarity !'); fprintf('\n');
    %         pause;
    %     end
    
    dth = learning_rate * inv(J) * [p_err; w_err];  %计算修正量，此处单位为弧度
    th1=th1+dth(1)*ToDeg;
    th2=th2+dth(2)*ToDeg;
    th3=th3+dth(3)*ToDeg;

    % x(num)=ex;
    % y(num)=ey;
    % z(num)=ez;
    % num=num+1;
    % plot3(x,y,z,'r.');grid on;
    % hold on;    
end
end
toc
%%再次绘制机器人保持图像
plot3(x,y,z,'r.');grid on;
DHfk_3DoF2_Lnya(th1,th2,th3,0);
plot3(Tpos(1),Tpos(2),Tpos(3),'kX'); hold on;
