close all;                  %%关闭所有窗口
clear;                       %%清除所有变量


ToDeg=180/pi;      %角度转换为弧度
ToRad=pi/180;      %弧度转换为角度


oR=eye(3);              %%定义3x3单位矩阵

stp=0.5;                   %%设置步进值
nsp=10;                    
ox=0;                       %%设置运动参考坐标系原点位置
oy=0;
oz=0;
%% 运动坐标系沿着x轴移动
for i=0:stp:nsp
    ox=ox+stp;
    op=[ox,oy,oz]';
    DrawFrame(oR, op,1);  
end
%% 运动坐标系沿着y轴移动
for i=0:stp:nsp
    oy=oy+stp;
    op=[ox,oy,oz]';
    DrawFrame(oR, op,1);  
end
%% 运动坐标系沿着斜线返回坐标系原点
for i=0:stp:nsp
    oy=oy-stp;
    ox=ox-stp;
    op=[ox,oy,oz]';
    DrawFrame(oR, op,1);  
end

%% 运动坐标系沿着y轴移动并绕n轴旋转九十度 （旋转是相对变换）
for i=0:stp:nsp
    oy=oy+stp;
    op=[ox,oy,oz]';       %%得到坐标系的原点
    cx=cos(90*i*ToRad/nsp);   %姿态矩阵的cos 旋转角度由步进值i计算得到，在移动过程中完成90度旋转
    sx=sin(90*i*ToRad/nsp);   %姿态矩阵的sin
    oR=[1,0,0;                %计算姿态矩阵
        0,cx,-sx;
        0,sx,cx;]
    az=oR*[0,0,1]';        %%提取坐标系z轴
    DrawCylinder(op, az, 1,2, 0.5);    %绘制圆柱体
    if i==nsp
       DrawFrame(oR, op,0);  
    else
       DrawFrame(oR, op,1);  
    end
end

%% 运动坐标系绕着z轴旋转90度 （绝对变换）
%%提取运动坐标系当前的原点及noa各轴向量，构造齐次变换矩阵
     p=[op;1];             %提取原点向量，最后一行补1
     n=[oR(1:3,1);0];   %提取当前姿态矩阵第1列，最后1行补0
     o=[oR(1:3,2);0];   %提取当前姿态矩阵第2列，最后1行补0
     a=[oR(1:3,3);0];   %提取当前姿态矩阵第3列，最后1行补0
     A=[n,o,a,p];

for i=0:stp:nsp
     %构造绝对变换矩阵
     cz=cos(90*i*ToRad/nsp);   %按照步进值计算旋转矩阵sin和cos
     sz=sin(90*i*ToRad/nsp);
     T=[cz,-sz,0,0;
           sz,cz,0,0;
           0,0,1,0;
           0,0,0,1;]
       A1=T*A;    %绝对变换  
       op=A1(1:3,4) ;     %提取坐标原点,第四列1到3行
       oRz=A1(1:3,1:3);  %提取旋转矩阵 3x3
       az=oRz*[0,0,1]';        %%提取坐标系z轴
       DrawCylinder(op, az, 1,2, 0.5);    %绘制圆柱体
       if i==nsp
         DrawFrame(oRz, op,0);  
       else
         DrawFrame(oRz, op,1);  
       end
end

%% 运动坐标系绕着n轴旋转-90度 （相对变换）

A=A1;   %提取上一次最后一次步进后的运动坐标系的齐次变换矩阵
for i=0:stp:nsp
     %构造相对变换矩阵
     cz=cos(-90*i*ToRad/nsp);   %按照步进值计算旋转矩阵sin和cos
     sz=sin(-90*i*ToRad/nsp);
     T=[1,0,0,0;
        0,cz,-sz,0;
        0,sz,cz,0;
        0,0,0,1;]
       A1=A*T;    %相对变换  
       op=A1(1:3,4) ;     %提取坐标原点,第四列1到3行
       oRz=A1(1:3,1:3);  %提取旋转矩阵 3x3
       az=oRz*[0,0,1]';        %%提取坐标系z轴
       DrawCylinder(op, az, 1,2, 0.5);    %绘制圆柱体
       if i==nsp
         DrawFrame(oRz, op,0);  
       else
         DrawFrame(oRz, op,1);  
       end
end
