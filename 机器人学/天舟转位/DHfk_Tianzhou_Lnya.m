function pic=DHfk_Tianzhou_Lnya(th3,fcla)
% close all

global Link

Build_TianGong_TianZhou_Lnya;
radius    = 25;
len       = 50;
joint_col = 0;


plot3(0,0,0,'ro');

% Link(2).th=th1*pi/180;
% Link(3).th=th2*pi/180;
Link(4).th=th3*pi/180;
% Link(5).th=th4*pi/180;
% Link(6).th=th5*pi/180;
% Link(7).th=th6*pi/180;

% Link(2).th=Link(2).th+th1*pi/180;
% Link(3).th=Link(3).th+th2*pi/180;
% Link(4).th=Link(4).th+th3*pi/180;
% Link(5).th=Link(5).th+th4*pi/180;
% Link(6).th=Link(6).th+th5*pi/180;
% Link(7).th=Link(7).th+th6*pi/180;

p0=[0,0,0]';

for i=1:6
    Matrix_DH_Ln(i);
end

for i=2:6

    Link(i).A=Link(i-1).A*Link(i).A;
    Link(i).p= Link(i).A(:,4);
    Link(i).n= Link(i).A(:,1);
    Link(i).o= Link(i).A(:,2);
    Link(i).a= Link(i).A(:,3);
    Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
    % Connect3D(Link(i-1).p,Link(i).p,'b',2); hold on;
    if i~=4
        if i~=5
            DrawCylinder(Link(i-1).p, Link(i-1).R * Link(i).az, radius,len, joint_col); hold on;
        end
    end
    % if i==2
    % DrawCylinder(Link(i).p, Link(i-1).R * Link(i).az, radius,len, joint_col); hold on;
    % end
end



grid on;
view(134,12);
axis([-200,200,-200,200,-200,300]);
xlabel('x');
ylabel('y');
zlabel('z');
drawnow;
pic=getframe;
if(fcla)
    cla;
end


