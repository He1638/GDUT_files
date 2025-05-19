function pic=FK_3Dof(th1,th2,th3)   %输入为度
%输入参数均为弧度,用于计算各关节轴的坐标

% close all

global Link 

 Link(2).th=th1*pi/180;
 Link(3).th=th2*pi/180;
 Link(4).th=th3*pi/180;
 Link(5).th=0;
 Link(6).th=0;
 Link(7).th=0;


p0=[0,0,0]';

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
end

