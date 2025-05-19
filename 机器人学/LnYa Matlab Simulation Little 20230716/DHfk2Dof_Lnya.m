function [A4,A5]=DHfk2Dof_Lnya(th1,th2,fcla)
% close all

global Link

Build_2DOFRobot_Lnya;
radius    = 10;
len       = 30;
joint_col = 0;


plot3(0,0,0,'ro');

Link(2).th=th1*pi/180;
Link(3).th=th2*pi/180;
%Link(4).th=th3*pi/180;

%  Link(2).th=Link(2).th+th1*pi/180;
%  Link(3).th=Link(3).th+th2*pi/180;
%  Link(4).th=Link(4).th+th3*pi/180;

p0=[0,0,0]';

for i=1:5
    Matrix_DH_Ln(i);
end

for i=2:3
    
    Link(i).A=Link(i-1).A*Link(i).A;
    Link(i).p= Link(i).A(:,4);
    Link(i).n= Link(i).A(:,1);
    Link(i).o= Link(i).A(:,2);
    Link(i).a= Link(i).A(:,3);
    Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
    Connect3D(Link(i-1).p,Link(i).p,'b',2); hold on;
    DrawCylinder(Link(i-1).p, Link(i-1).R * Link(i).az, radius,len, joint_col); hold on;
end

%% 计算并绘制左右grip的位姿
Rl_1=[0,-1,0,0;
      1,0,0,0;
      0,0,1,0;
      0,0,0,1];
Tl_1=[1,0,0,121.83;
      0,1,0,0;
      0,0,1,0;
      0,0,0,1];
Rl_2=[cos(-171*ToRad),-sin(-171*ToRad),0,0;
      sin(-171*ToRad),cos(-171*ToRad),0,0;
      0,0,1,0;
      0,0,0,1];
  
  Link(4).A=Link(3).A*Rl_1*Tl_1*Rl_2;
  Link(4).p= Link(4).A(:,4);
  Link(4).n= Link(4).A(:,1);
  Link(4).o= Link(4).A(:,2);
  Link(4).a= Link(4).A(:,3);
  Link(4).R=[Link(4).n(1:3),Link(4).o(1:3),Link(4).a(1:3)];
  Connect3D(Link(3).p,Link(4).p,'b',2); hold on;
  DrawFrame(Link(4).R, Link(4).p(1:3), 0);
  
Rr_1=[0,1,0,0;
      -1,0,0,0;
      0,0,1,0;
      0,0,0,1];
Tr_1=[1,0,0,121.83;
      0,1,0,0;
      0,0,1,0;
      0,0,0,1];
Rr_2=[cos(171*ToRad),-sin(171*ToRad),0,0;
      sin(171*ToRad),cos(171*ToRad),0,0;
      0,0,1,0;
      0,0,0,1];
  
  Link(5).A=Link(3).A*Rr_1*Tr_1*Rr_2;
  Link(5).p= Link(5).A(:,4);
  Link(5).n= Link(5).A(:,1);
  Link(5).o= Link(5).A(:,2);
  Link(5).a= Link(5).A(:,3);
  Link(5).R=[Link(5).n(1:3),Link(5).o(1:3),Link(5).a(1:3)];
  Connect3D(Link(3).p,Link(5).p,'b',2); hold on;
  DrawFrame(Link(5).R, Link(5).p(1:3), 0);
  A4=Link(4).A;
  A5=Link(5).A;
 %% 
grid on;
axis equal;

% view(134,12);
axis([-300,300,-300,300,-300,300]);
xlabel('x');
ylabel('y');
zlabel('z');
drawnow;
pic=getframe;
if(fcla)
    cla;
end


