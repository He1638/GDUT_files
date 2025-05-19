function DHfk_3DoF2_Lnya(th1,th2,th3,fcla)  %%输入单位 度
global Link

Build_3DOFRobot2_Lnya;
radius    = 10;
len       = 30;
joint_col = 0;
ToDeg=pi/180;

th4=0;
th5=0;
th6=0;

plot3(0,0,0,'ro');

Link(2).th= th1*ToDeg;
Link(3).th=th2*ToDeg;
Link(4).th=th3*ToDeg;
Link(5).th=th4*ToDeg;
Link(6).th=th5*ToDeg;
Link(7).th=th6*ToDeg;

for i=1:7
    Matrix_DH_Ln(i);
end

for i=2:7
    
    Link(i).A=Link(i-1).A*Link(i).A;
    Link(i).p= Link(i).A(:,4);
    Link(i).n= Link(i).A(:,1);
    Link(i).o= Link(i).A(:,2);
    Link(i).a= Link(i).A(:,3);
    Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
    Connect3D(Link(i-1).p,Link(i).p,'b',2); hold on;
    plot3(Link(i).p(1),Link(i).p(2),Link(i).p(3),'rx');hold on;
    if i<=4
        DrawCylinder(Link(i-1).p, Link(i-1).R * Link(i).az, radius,len, joint_col); hold on;
    end
end
axis([-200,200,-200,200,-200,200]);
xlabel('x');
ylabel('y');
zlabel('z');
view(-21,12);
grid on;
drawnow;
if(fcla)
    cla;
end




