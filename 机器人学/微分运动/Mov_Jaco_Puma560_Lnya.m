close all;
clear;

figure; 

% th1=0;
% th2=0;
% th3=0;
% th4=0;
% th5=0;
% th6=0;

th1=50;
th2=-70;
th3=170;
th4=30;
th5=60;
th6=10;

DHfk_J_Puma560_Lnya(th1,th2,th3,th4,th5,th6,0); 
pause;
num=1;

% 参数设置
radius = 150;      % 圆周半径
omega = pi/10;        % 角速度（弧度/迭代步）
v = radius * omega; % 切向速度大小

for i = 1:20
    % 计算当前角度（假设初始角度为0）
    theta = omega * (i-1);
    
    % 设置切向速度方向
    dD = [0;-v * sin(theta) ; v * cos(theta); 0; 0; 0];
    
    % 计算关节角变化
    J = Jacobian6DoF_Ln(th1, th2, th3, th4, th5, th6);
    dth = inv(J) * dD;
    
    % 更新关节角
    th1 = th1 + dth(1)/pi*180;
    th2 = th2 + dth(2)/pi*180;
    th3 = th3 + dth(3)/pi*180;
    th4 = th4 + dth(4)/pi*180;
    th5 = th5 + dth(5)/pi*180;
    th6 = th6 + dth(6)/pi*180;
    
    % 绘制机器人状态和行列式
    figure(1);
    DHfk_J_Puma560_Lnya(th1, th2, th3, th4, th5, th6, 0);
    x = det(J);
    fprintf('x= %2.4f ', x);
    xout(num) = x;
    t(num) = i;
    num = num + 1;
    
    figure(3);
    axis([0, num, -5000000, 5000000]);
    plot(t, xout, 'r-O'); hold on;
end



