close all;                  %%�ر����д���
clear;                       %%������б���


ToDeg=180/pi;      %�Ƕ�ת��Ϊ����
ToRad=pi/180;      %����ת��Ϊ�Ƕ�


oR=eye(3);              %%����3x3��λ����

stp=0.5;                   %%���ò���ֵ
nsp=10;                    
ox=0;                       %%�����˶��ο�����ϵԭ��λ��
oy=0;
oz=0;
%% �˶�����ϵ����x���ƶ�
for i=0:stp:nsp
    ox=ox+stp;
    op=[ox,oy,oz]';
    DrawFrame(oR, op,1);  
end
%% �˶�����ϵ����y���ƶ�
for i=0:stp:nsp
    oy=oy+stp;
    op=[ox,oy,oz]';
    DrawFrame(oR, op,1);  
end
%% �˶�����ϵ����б�߷�������ϵԭ��
for i=0:stp:nsp
    oy=oy-stp;
    ox=ox-stp;
    op=[ox,oy,oz]';
    DrawFrame(oR, op,1);  
end

%% �˶�����ϵ����y���ƶ�����n����ת��ʮ�� ����ת����Ա任��
for i=0:stp:nsp
    oy=oy+stp;
    op=[ox,oy,oz]';       %%�õ�����ϵ��ԭ��
    cx=cos(90*i*ToRad/nsp);   %��̬�����cos ��ת�Ƕ��ɲ���ֵi����õ������ƶ����������90����ת
    sx=sin(90*i*ToRad/nsp);   %��̬�����sin
    oR=[1,0,0;                %������̬����
        0,cx,-sx;
        0,sx,cx;]
    az=oR*[0,0,1]';        %%��ȡ����ϵz��
    DrawCylinder(op, az, 1,2, 0.5);    %����Բ����
    if i==nsp
       DrawFrame(oR, op,0);  
    else
       DrawFrame(oR, op,1);  
    end
end

%% �˶�����ϵ����z����ת90�� �����Ա任��
%%��ȡ�˶�����ϵ��ǰ��ԭ�㼰noa����������������α任����
     p=[op;1];             %��ȡԭ�����������һ�в�1
     n=[oR(1:3,1);0];   %��ȡ��ǰ��̬�����1�У����1�в�0
     o=[oR(1:3,2);0];   %��ȡ��ǰ��̬�����2�У����1�в�0
     a=[oR(1:3,3);0];   %��ȡ��ǰ��̬�����3�У����1�в�0
     A=[n,o,a,p];

for i=0:stp:nsp
     %������Ա任����
     cz=cos(90*i*ToRad/nsp);   %���ղ���ֵ������ת����sin��cos
     sz=sin(90*i*ToRad/nsp);
     T=[cz,-sz,0,0;
           sz,cz,0,0;
           0,0,1,0;
           0,0,0,1;]
       A1=T*A;    %���Ա任  
       op=A1(1:3,4) ;     %��ȡ����ԭ��,������1��3��
       oRz=A1(1:3,1:3);  %��ȡ��ת���� 3x3
       az=oRz*[0,0,1]';        %%��ȡ����ϵz��
       DrawCylinder(op, az, 1,2, 0.5);    %����Բ����
       if i==nsp
         DrawFrame(oRz, op,0);  
       else
         DrawFrame(oRz, op,1);  
       end
end

%% �˶�����ϵ����n����ת-90�� ����Ա任��

A=A1;   %��ȡ��һ�����һ�β�������˶�����ϵ����α任����
for i=0:stp:nsp
     %������Ա任����
     cz=cos(-90*i*ToRad/nsp);   %���ղ���ֵ������ת����sin��cos
     sz=sin(-90*i*ToRad/nsp);
     T=[1,0,0,0;
        0,cz,-sz,0;
        0,sz,cz,0;
        0,0,0,1;]
       A1=A*T;    %��Ա任  
       op=A1(1:3,4) ;     %��ȡ����ԭ��,������1��3��
       oRz=A1(1:3,1:3);  %��ȡ��ת���� 3x3
       az=oRz*[0,0,1]';        %%��ȡ����ϵz��
       DrawCylinder(op, az, 1,2, 0.5);    %����Բ����
       if i==nsp
         DrawFrame(oRz, op,0);  
       else
         DrawFrame(oRz, op,1);  
       end
end
