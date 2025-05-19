close all;
% A(1:90)=struct('cdata',[],'colormap',[]);
clear;

global Link
Build_IRB2600_Robot_Lnya;

th=[0,0,0,0,0,0];
grid on;

for j=1:20000
    th1=0;
    %th1=-180+360*rand;
    th2=-155+250*rand;
    th3=-75+255*rand;
    th4=-175+350*rand;
    th5=-120+240*rand;
    th6=-400+800*rand;


    Link(2).th=th1*pi/180;
    Link(3).th=0.5*pi+th2*pi/180;
    Link(4).th=th3*pi/180; fprintf('%d %d %d  \n',[th1,th2,th3]');
    Link(5).th=th4*pi/180;
    %Link(6).th=0;
    Link(6).th=pi+th5*pi/180;
    Link(7).th=th6*pi/180;  fprintf('%d %d %d %d %d %d  \n',[th1,th2,th3,0,0,0]');

    for i=1:7
        Matrix_DH_Ln(i);
    end
    for i=2:7
        Link(i).A=Link(i-1).A*Link(i).A;
        Link(i).p= Link(i).A(:,4);
    end


    x(j)=Link(7).p(1);
    y(j)=Link(7).p(2);
    z(j)=Link(7).p(3);
end
plot3(x,y,z,'r.');
grid on;
axis equal;


