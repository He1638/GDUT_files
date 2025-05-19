clear;
close all;
P_o=[1,3,3]';
P_n=[2,1,1]';

P_o=P_o/norm(P_o)*20;
P_n=P_n/norm(P_n)*20;



Txyz=eye(4:4);

    T=Txyz;
    op=T(1:3,4) ;     %提取坐标原点,第四列1到3行
    oRz=T(1:3,1:3);  %提取旋转矩阵 3x3
    Connect3D(op,P_o,'k--',2); hold on;
    Connect3D(op,P_n,'k',1); hold on;
    DrawFrame(oRz, op,0);
